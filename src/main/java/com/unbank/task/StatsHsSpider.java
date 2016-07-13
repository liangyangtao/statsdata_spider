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
import com.unbank.tools.MD5;

public class StatsHsSpider {

	private final static String url = "http://data.stats.gov.cn/easyquery.htm";
	private final static String charset = "utf-8";

	private static Log logger = LogFactory.getLog(StatsHsSpider.class);
	private static boolean update = false;
	private static String tablePre = "hsyd";
	static {
		// 启动日志
		try {
			PropertyConfigurator.configure(StatsHsSpider.class.getClassLoader()
					.getResource("").toURI().getPath()
					+ "log4j.properties");
			logger.info("---日志系统启动成功---");
		} catch (Exception e) {
			logger.error("日志系统启动失败:", e);
		}
	}

	public static void main(String[] args) {

		new StatsHsSpider().getQuotasTree();
	}

	public static Fetcher fetcher = Fetcher.getInstance();

	public void getQuotasTree() {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", "zb");
		params.put("dbcode", tablePre);
		params.put("wdcode", "zb");
		params.put("m", "getTree");
		getTree(params, "", "");

	}

	public void getTree(Map<String, String> params, String name, String linkPid) {
		JSONArray treeArray = getJsonArray(params);
		List<Map<String, Object>> result = getTree(treeArray, name, linkPid);
		for (Map<String, Object> map : result) {
			String id = (String) map.get("id");
			name = (String) map.get("name");

			int idLength = id.length();
			switch (idLength) {
			case 3:
				// new MysqlTableMaker().makeTableSql("quotas",map);
				if (!update) {
					new QuotasStorer().saveQuotas(tablePre + "_quotas", map);
				}
				break;
			case 5:
				// new MysqlTableMaker().makeTableSql("category",map);
				if (!update) {
					new QuotasStorer().saveQuotas(tablePre + "_category", map);
				}
				break;
			case 7:
				// new MysqlTableMaker().makeTableSql("subcategory",map);
				if (!update) {
					new QuotasStorer().saveQuotas(tablePre + "_subcategory",
							map);
				}
				break;
			case 9:
				// new MysqlTableMaker().makeTableSql("subcategory",map);
				if (!update) {
					new QuotasStorer().saveQuotas(tablePre + "_treecategory",
							map);
				}
				break;
			default:

				break;
			}
			linkPid = (String) map.get("uniqueid");

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
				getTree(params, name, linkPid);

			} else {

				String [] regWd =new String []{"110000","120000","130000","140000","150000","210000","220000","230000","310000","320000","330000","340000","350000","360000","370000","410000","420000","430000","440000","450000","460000","500000","510000","520000","530000","540000","610000","620000","630000","640000","650000"};
				for (String reg : regWd) {
					Map<String, String> resultparams = new HashMap<String, String>();
					resultparams.put("m", "QueryData");
					resultparams.put("dbcode", tablePre);
					resultparams.put("rowcode", "zb");
					resultparams.put("colcode", "sj");
					resultparams.put("wds", "[{\"wdcode\":\"reg\",\"valuecode\":\""+reg +"\"}]");
					resultparams.put("k1", new Date().getTime() + "");
//					if (!update) {
//						resultparams.put("dfwds",
//								"[{\"wdcode\":\"zb\",\"valuecode\":\"LAST36\"}]");
//						spiderNode(resultparams);
//					}
					resultparams.put("dfwds",
							"[{\"wdcode\":\"zb\",\"valuecode\":\"" + id + "\"}]");
					JSONObject jsonObject = getJsonObject(resultparams);
					getResult(jsonObject, name, linkPid);
				}
			
				// 获取详情页
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

	public List<Map<String, Object>> getTree(JSONArray treeArray, String name,
			String linkPid) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Object object : treeArray) {
			JSONObject jsonObject = JSONObject.fromObject(object);
			Map<String, Object> resultMap = (Map<String, Object>) JSONObject
					.toBean(jsonObject, Map.class);
			String newname = (String) resultMap.get("name");
			resultMap.put("uniqueid", MD5.GetMD5Code(name + newname));
			resultMap.put("linkPid", linkPid);
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

	public void getResult(JSONObject jsonObject, String name, String linkPid) {

		JSONObject returndata = jsonObject.getJSONObject("returndata");
		JSONArray dataNodeArray = returndata.getJSONArray("datanodes");
		JSONArray wdNodeArray = returndata.getJSONArray("wdnodes");

		Map<String, Object> regMap = parserRegNode(wdNodeArray);
		Map<String, Map<String, Object>> wdMap = parserWdNode(wdNodeArray,
				name, linkPid);
		parserDataNode(dataNodeArray, wdMap, regMap);

	}

	private Map<String, Object> parserRegNode(JSONArray wdNodeArray) {
		Object object = wdNodeArray.get(1);
		JSONObject regObject = JSONObject.fromObject(object);
		JSONObject regNode = regObject.getJSONObject("0");
		Map<String, Object> regMap = (Map<String, Object>) JSONObject.toBean(
				regNode, Map.class);
		return regMap;

	}

	private Map<String, Map<String, Object>> parserWdNode(
			JSONArray wdNodeArray, String name, String linkPid) {
		Object object = wdNodeArray.get(0);
		JSONArray nodes = JSONArray.fromObject(JSONObject.fromObject(object)
				.get("nodes"));
		Map<String, Map<String, Object>> wdMap = new HashMap<String, Map<String, Object>>();
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
			String newname = (String) resultMap.get("name");
			resultMap.put("uniqueid", MD5.GetMD5Code(name + newname));
			resultMap.put("linkPid", linkPid);
			wdMap.put((String) resultMap.get("code"), resultMap);
			if (!update) {
				new QuotasStorer().saveQuotas(tablePre + "_wd", resultMap);
			}
		}

		return wdMap;
	}

	private void parserDataNode(JSONArray dataNodeArray,
			Map<String, Map<String, Object>> wdMap, Map<String, Object> regMap) {

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
				Map<String, Object> prentMap = wdMap.get(wdcode);
				String linkPid = (String) prentMap.get("uniqueid");
				String name = (String) prentMap.get("name");
				resultMap.put("uniqueid", MD5.GetMD5Code(name + sjcode + data));
				resultMap.put("linkPid", linkPid);
				new QuotasStorer().saveQuotas(tablePre + "_data", resultMap);

			}

		}

	}

}