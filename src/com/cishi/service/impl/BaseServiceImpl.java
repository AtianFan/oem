package com.cishi.service.impl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cishi.service.BaseService;

@Service("baseService")
public class BaseServiceImpl implements BaseService{

	@Resource
	public JdbcTemplate jdbcTemplate;

	@Override
	public int update(String sql, Object object) {
		return jdbcTemplate.update(sql); 
	}

	@Override
	public List query(String sql) {
		return jdbcTemplate.queryForList(sql); 
	}

	@Override
	public List query(String sql, Object object) {
		List result = jdbcTemplate.query(sql, new RowMapper<Map>() {  

		      @Override  

		      public Map mapRow(ResultSet rs, int rowNum) throws SQLException {  

		          Map row = new HashMap<>();  

		          row.put(rs.getInt("id"), rs.getString("name"));  

		          return row;  

		  }});  
		return result;
	}

	@Override
	public Map queryOne(String sql) {
		List list = this.query(sql);
		if(list!=null && list.size()>0){
			return (Map)list.get(0);
		}
		return null;
	}
	
}
