package com.unbank.dao;

import java.util.Map;

import com.unbank.mybatis.factory.BaseDao;

public class QuotasStorer extends BaseDao {

	public void saveQuotas(String tableName, Map<String, Object> colums) {
		if (colums == null || colums.size() == 0) {
			return;
		}
		String sql = "insert into  " + tableName;
		executeMapSQL(sql, colums);

	}
	
	public void upIndex(String name, int idLength ){
		String sql = "update  dataindex set name='"+name+"' where level="+idLength;
		System.out.println(sql);
		executeSQL(sql);
		
	}
}
