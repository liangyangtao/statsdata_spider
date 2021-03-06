package com.unbank.task;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;

import com.unbank.dao.QuotasStorer;
import com.unbank.fetch.Fetcher;
import com.unbank.tools.DataIndexer;
import com.unbank.tools.MD5;
import com.unbank.tools.SimpleBloomFilter;

public class StatsFsSpider {

	private final static String url = "http://data.stats.gov.cn/easyquery.htm";
	private final static String charset = "utf-8";

	private static Log logger = LogFactory.getLog(StatsFsSpider.class);
	private static boolean update = false;
	private static String tablePre = "fsnd";
	public static Map<Integer, String> dataindex = new HashMap<Integer, String>();
	public static SimpleBloomFilter simpleBloomFilter = SimpleBloomFilter
			.getInstance();
	static {
		// 启动日志
		try {
			PropertyConfigurator.configure(StatsFsSpider.class.getClassLoader()
					.getResource("").toURI().getPath()
					+ "log4j.properties");
			logger.info("---日志系统启动成功---");
		} catch (Exception e) {
			logger.error("日志系统启动失败:", e);
		}
	}

	public static void main(String[] args) {
		dataindex.put(3, "");
		dataindex.put(5, "");
		dataindex.put(7, "");
		dataindex.put(9, "");
		new StatsFsSpider().getQuotasTree();
	}

	public static Fetcher fetcher = Fetcher.getInstance();

	public void getQuotasTree() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", "zb");
		params.put("dbcode", tablePre);
		params.put("wdcode", "zb");
		params.put("m", "getTree");
		getTree(params, "");

	}

	public void getTree(Map<String, String> params, String name) {
		JSONArray treeArray = getJsonArray(params);
		List<Map<String, Object>> result = getTree(treeArray);
		for (Map<String, Object> map : result) {
			String id = (String) map.get("id");
			name = (String) map.get("name");

			int idLength = id.length();
			String dataindexName = dataindex.get(idLength);
			if (dataindexName.isEmpty()) {

			} else {
				if (!dataindexName.equals(name)) {
					continue;
				} else {
					dataindex.put(idLength, "");
				}
			}
			new DataIndexer().writerIndex(name, idLength);
			if (!update) {
				new QuotasStorer().saveQuotas(tablePre + "_tree", map);
			}
			boolean isp = true;
			Object isPObject = map.get("isParent");
			if (isPObject instanceof String) {
				String isParent = (String) map.get("isParent");
				if (isParent.equals("0")) {
					isp = false;
				} else {
					isp = true;
				}
			} else if (isPObject instanceof Boolean) {
				Boolean isParent = (Boolean) map.get("isParent");
				if (isParent) {
					isp = true;
				} else {
					isp = false;
				}

			}
			if (isp) {
				// 获取下一级
				params.put("id", id);
				getTree(params, name);

			} else {

				String[] regWd = new String[] { "110000", "120000", "130000",
						"140000", "150000", "210000", "220000", "230000",
						"310000", "320000", "330000", "340000", "350000",
						"360000", "370000", "410000", "420000", "430000",
						"440000", "450000", "460000", "500000", "510000",
						"520000", "530000", "540000", "610000", "620000",
						"630000", "640000", "650000" };
				for (String reg : regWd) {
					System.out.println(reg);
					Map<String, String> resultparams = new HashMap<String, String>();
					resultparams.put("m", "QueryData");
					resultparams.put("dbcode", tablePre);
					resultparams.put("rowcode", "zb");
					resultparams.put("colcode", "sj");
					resultparams.put("wds",
							"[{\"wdcode\":\"reg\",\"valuecode\":\"" + reg
									+ "\"}]");
					resultparams.put("k1", new Date().getTime() + "");
					resultparams.put("dfwds",
							"[{\"wdcode\":\"zb\",\"valuecode\":\"" + id
									+ "\"}]");
					spiderNode(resultparams);
					resultparams.put("dfwds",
							"[{\"wdcode\":\"sj\",\"valuecode\":\"LAST36\"}]");
					JSONObject jsonObject = getJsonObject(resultparams);
					getResult(jsonObject, id);
				}
			}

		}
	}

	// 获取导航树
	public String spiderNode(Map<String, String> params) {
		String html = fetcher.post(url, params, null, charset);
		return html;
	}

	public JSONArray getJsonArray(Map<String, String> params) {
		String html = spiderNode(params);
		JSONArray treeArray = JSONArray.fromObject(html);
		return treeArray;
	}

	public List<Map<String, Object>> getTree(JSONArray treeArray) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Object object : treeArray) {
			JSONObject jsonObject = JSONObject.fromObject(object);
			Map<String, Object> resultMap = (Map<String, Object>) JSONObject
					.toBean(jsonObject, Map.class);
			String id = (String) resultMap.get("id");
			resultMap.put("uniqueid", MD5.GetMD5Code(id));
			result.add(resultMap);
		}
		return result;
	}

	// 获取最后结果

	public JSONObject getJsonObject(Map<String, String> resultparams) {
		String html = spiderNode(resultparams);
		JSONObject jsonObject = JSONObject.fromObject(html);
		return jsonObject;
	}

	public void getResult(JSONObject jsonObject, String linkPid) {

		JSONObject returndata = jsonObject.getJSONObject("returndata");
		JSONArray dataNodeArray = returndata.getJSONArray("datanodes");
		JSONArray wdNodeArray = returndata.getJSONArray("wdnodes");
		parserWdNode(wdNodeArray, linkPid);
		parserDataNode(dataNodeArray);

	}

	private void parserWdNode(JSONArray wdNodeArray, String linkPid) {
		Object object = wdNodeArray.get(0);
		JSONArray nodes = JSONArray.fromObject(JSONObject.fromObject(object)
				.get("nodes"));
		for (Object node : nodes) {
			JSONObject jsonObject = JSONObject.fromObject(node);
			Map<String, Object> htmlMap = (Map<String, Object>) JSONObject
					.toBean(jsonObject, Map.class);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("cname", htmlMap.get("cname"));
			resultMap.put("code", htmlMap.get("code"));
			resultMap.put("dotcount", htmlMap.get("dotcount"));
			resultMap.put("name", htmlMap.get("name"));
			resultMap.put("nodesort", htmlMap.get("nodesort"));
			resultMap.put("sortcode", htmlMap.get("sortcode"));
			resultMap.put("unit", htmlMap.get("unit"));
			String uniqueid = MD5.GetMD5Code(htmlMap.get("code") + "");
			resultMap.put("uniqueid", uniqueid);
			resultMap.put("linkPid", linkPid);
			if (simpleBloomFilter.contains(uniqueid)) {

			} else {
				simpleBloomFilter.add(uniqueid);
				if (!update) {
					new QuotasStorer().saveQuotas(tablePre + "_wd", resultMap);
				}
			}

		}

	}

	private void parserDataNode(JSONArray dataNodeArray) {

		for (Object object : dataNodeArray) {
			JSONObject datanode = JSONObject.fromObject(object);
			// zb.A01010101_reg.110000_sj.201605
			String code = datanode.getString("code");
			String wdcode = StringUtils.substringBetween(code, "zb.", "_reg.");
			String sjcode = StringUtils.substringAfterLast(code, "_sj.");
			String regcode = StringUtils
					.substringBetween(code, "_reg.", "_sj.");
			JSONObject dataInfo = datanode.getJSONObject("data");
			Double data = dataInfo.getDouble("data");
			int dotcount = dataInfo.getInt("dotcount");
			boolean hasdata = dataInfo.getBoolean("hasdata");
			String strdata = dataInfo.getString("strdata");
			if (hasdata) {
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("code", code);
				resultMap.put("wdcode", wdcode);
				resultMap.put("sjcode", sjcode);
				resultMap.put("regcode", regcode);
				resultMap.put("data", data);
				resultMap.put("dotcount", dotcount);
				resultMap.put("hasdata", hasdata);
				resultMap.put("strdata", strdata);
				resultMap.put("uniqueid", MD5.GetMD5Code(code));
				new QuotasStorer().saveQuotas(tablePre + "_data", resultMap);

			}

		}

	}

}
