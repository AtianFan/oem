package com.cishi.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cishi.beans.OrderTaskExample;
import com.cishi.beans.SysUser;
import com.cishi.beans.SysUserExample;
import com.cishi.param.ResponseData;
import com.cishi.view.PageView;
import com.cishi.view.SysUserView;

public interface SysUserAdminService {

	public boolean adminLogin();

	public ResponseData<SysUserView> adminLogin(Map<String, String> map, ResponseData<SysUserView> responseData,
			HttpServletRequest request);

	public List<SysUser> loadUserInfoList(PageView pageView,ResponseData responseData);
	int count(SysUserExample sysUserExample);
	
	public int deleteAndActiveUserInfo(String userID,String operateType,ResponseData responseData);
	
	public ResponseData<SysUserView> adminUpdateUser(SysUserView sysUserView, ResponseData<SysUserView> responseData);

}
