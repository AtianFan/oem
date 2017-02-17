package com.cishi.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysUser;
import com.cishi.param.ResponseData;
import com.cishi.view.SysUserView;

public interface SysUserService {

	public boolean login();

	ResponseData<SysUser> logout(HttpServletRequest request, ResponseData<SysUser> ResponseData);

	public SysUser login(Map<String, String> map);

	public SysUser register(SysUserView sysUser, ResponseData<SysUserView> responseData);

	public boolean hasLoginName(String name);

	public ResponseData<SysUserView> login(Map<String, String> map, ResponseData<SysUserView> responseData,
			HttpServletRequest request);

	public ResponseData<SysUser> recommend(String type, ResponseData<SysUser> responseData);

	public ResponseData<SysUser> langSetting(String lang, String userId, ResponseData<SysUser> responseData);

	public SysUser userInfo(String id, ResponseData<SysUser> ResponseData);

	public ResponseData<SysUserView> updateUser(SysUserView sysUserView, ResponseData<SysUserView> responseData);

	public ResponseData<Object> modifyPassword(String oldPassword, String newPassword, String confirmNewPassword,
			String userId, ResponseData<Object> responseData);
	
	//通过id查询用户信息
	public SysUser loadSysUserById(String userId);
	
	public int updateSysUserByPrimaryKeySelective(SysUser sysUser);
}
