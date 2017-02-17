package com.cishi.service;

import java.util.List;
import java.util.Map;

public interface BaseService {

	public int update(String sql,Object object);
	public List query(String sql, Object object);
	public List query(String sql);
	public Map queryOne(String sql);
}
