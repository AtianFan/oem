package com.cishi.view;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SysFileView {
	private boolean flag;
	private String path;
	private String originName;
	private String name;
	private Date createDate;
	private String id;
	private Map<String,String> params = new HashMap<String, String>();
	public void add(String key,String value){
		params.put(key, value);
	}
	public String get(String key){
		return params.get(key);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
}
