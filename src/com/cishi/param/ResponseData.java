package com.cishi.param;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.view.PageView;

public class ResponseData<T> {

	private List<T> dataList;
	private T  data;
	private boolean flag;
	private String msg;
	private Map<String,T> map;
	private int retcode=0;
	private String retmsg="success";
	private String accessToken;
	private Date createDate;
	private PageView pageView;
	private String userId;
	private SysUser sysUser;
	private Boolean isReadOnly;
	
	public Boolean getIsReadOnly() {
		return isReadOnly;
	}
	public void setIsReadOnly(Boolean isReadOnly) {
		this.isReadOnly = isReadOnly;
	}
	public SysUser getSysUser() {
		return sysUser;
	}
	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public PageView getPageView() {
		return pageView;
	}
	public void setPageView(PageView pageView) {
		this.pageView = pageView;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public int getRetcode() {
		return retcode;
	}
	public void setRetcode(int retcode) {
		this.retcode = retcode;
	}
	public String getRetmsg() {
		return retmsg;
	}
	public void setRetmsg(String retmsg) {
		this.retmsg = retmsg;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, T> getMap() {
		return map;
	}
	public void setMap(Map<String, T> map) {
		this.map = map;
	}
	public void parseErrorCode(ErrorCode errorCode){
		this.setRetcode(errorCode.getRetcode());
		this.setRetmsg(errorCode.getRetmsg());
	}
	
}
