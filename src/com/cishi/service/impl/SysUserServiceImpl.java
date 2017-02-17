package com.cishi.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.Globals;
import org.apache.log4j.Logger;
import org.apache.tomcat.jni.Global;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysUser;
import com.cishi.beans.SysUserExample;
import com.cishi.beans.SysUserExample.Criteria;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.FileType;
import com.cishi.constant.SysUserStatus;
import com.cishi.dao.SysUserMapper;
import com.cishi.global.GlobalMenu;
import com.cishi.global.GlobalSession;
import com.cishi.param.ResponseData;
import com.cishi.service.SysCompanyService;
import com.cishi.service.SysFileService;
import com.cishi.service.SysUserService;
import com.cishi.util.GlobalContextUtil;
import com.cishi.util.MD5Util;
import com.cishi.util.ResponseUtil;
import com.cishi.util.TokenGenerator;
import com.cishi.util.Validator;
import com.cishi.view.SysUserView;

@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService{

	private final static Logger logger = Logger.getLogger(SysUserServiceImpl.class);
	
	@Resource
	public SysFileService sysFileService;
	
/*	void test(){
		Fields[]
	Resource resource = sysFileService.getAnnotation(Resource.class);
	resource.name();
	}*/
	@Resource
	public SysUserMapper sysUserMapper;
	
	@Resource
	public SysCompanyService sysCompanyService;
	
	@Override
	public boolean login() {
		SysUserExample sysUserExample = new SysUserExample();
		int i = sysUserMapper.countByExample(sysUserExample);
		return false;
	}

	public SysUser login(Map<String, String> map) {
		SysUser sysUser = null;
		String loginName = map.get("loginName");
		String password = map.get("password");
		if(loginName==null || password==null){
			return sysUser;
		}
		SysUserExample sysUserExample = new SysUserExample();
		SysUserExample.Criteria criteria = sysUserExample.createCriteria(true);
		criteria.andLoginNameEqualTo(loginName);
		criteria.andPasswordEqualTo(MD5Util.MD5(password));
		List<SysUser> userList = sysUserMapper.selectByExample(sysUserExample);
		if(userList==null || userList.isEmpty()){
			return sysUser;
		}
		if (userList.size() == 1) {
			sysUser = userList.get(0);
		}
		String accessToken = TokenGenerator.generateKey();
		sysUser.setAccessToken(accessToken);
		SysUser sysUser2 = new SysUser();
		sysUser2.setAccessToken(accessToken);
		sysUserMapper.updateByPrimaryKeySelective(sysUser2);
		return sysUser;
	}

	public ResponseData<SysUserView> login(Map<String, String> map,ResponseData<SysUserView> responseData,HttpServletRequest request) {
		SysUser sysUser = null;
		String loginName = map.get("loginName");
		String password = map.get("password");
		if(loginName==null || password==null || loginName.isEmpty() || password.isEmpty()){
			/*responseData.setRetcode(ErrorCode.USER_AND_PASSWOD_NOT_NULL.getRetcode());
			responseData.setRetmsg(ErrorCode.USER_AND_PASSWOD_NOT_NULL.getRetmsg());*/
			responseData.parseErrorCode(ErrorCode.USER_AND_PASSWOD_NOT_NULL);
			return responseData;
		}
		
		SysUserExample sysUserExample = new SysUserExample();
		SysUserExample.Criteria criteria = sysUserExample.createCriteria(true);
		SysUserExample.Criteria orCriteria = sysUserExample.createCriteria(true);
		List<Byte> list = new ArrayList<Byte>(Arrays.asList(SysUserStatus.VALID_ING.getCode(),SysUserStatus.VALID_SUCCESS.getCode()));
		criteria.andLoginNameEqualTo(loginName);
		criteria.andPasswordEqualTo(MD5Util.MD5(password));
//		criteria.andStatusEqualTo(SysUserStatus.VALID_SUCCESS.getCode());
		criteria.andStatusIn(list);
		orCriteria.andAccountReadonlyEqualTo(loginName);
		orCriteria.andPasswordEqualTo(MD5Util.MD5(password));
		orCriteria.andReadonlyFlagEqualTo(true);
		orCriteria.andStatusIn(list);
//		orCriteria.andStatusEqualTo(SysUserStatus.VALID_SUCCESS.getCode());
		sysUserExample.or(orCriteria);
		sysUserExample.setDistinct(true);
		List<SysUser> userList = sysUserMapper.selectByExample(sysUserExample);
		if(userList==null || userList.isEmpty()){
//			responseData.setRetcode(ErrorCode.PASSWORD_ERROR.getRetcode());
//			responseData.setRetmsg(ErrorCode.PASSWORD_ERROR.getRetmsg());
			responseData.parseErrorCode(ErrorCode.PASSWORD_ERROR);
			return responseData;
		}
		if (userList.size() == 1) {
			sysUser = userList.get(0);
			if(sysUser.getStatus() == SysUserStatus.VALID_ING.getCode()){
				//如果状态是0，说明有此用户，需要管理员验证验证，否则状态为1，说明已经验证通过
				responseData.parseErrorCode(ErrorCode.WAIT_FOR_REVIEW);
				return responseData;
			}
			sysUser.setCurrentLoginName(loginName);
			request.getSession().setAttribute("sysUser", sysUser);
			request.getSession().setAttribute("currentLoginName", loginName);
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}
		String accessToken = TokenGenerator.generateKey();
		sysUser.setAccessToken(accessToken);
		SysUser sysUser2 = new SysUser();
		sysUser2.setAccessToken(accessToken);
		sysUserMapper.updateByPrimaryKeySelective(sysUser2);
//		responseData.setRetcode(ErrorCode.SUCCESS.getRetcode());
//		responseData.setRetmsg(ErrorCode.SUCCESS.getRetmsg());
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		responseData.setAccessToken(accessToken);
		responseData.setData(copySysUserToView(sysUser));
		return responseData;
	}
	
	public void addSysUser(SysUser user) {
		int i = sysUserMapper.insertSelective(user);
		logger.debug("addSysUser:" + i);
	}

	public List<SysUser> loadUsers(SysUserExample sysUserExample) {
		return sysUserMapper.selectByExample(sysUserExample);
	}

	public List<SysUser> loadUsersByLoginName(String name) {
		SysUserExample example = new SysUserExample();
		Criteria criteria = example.createCriteria(true);
		criteria.andLoginNameEqualTo(name);
		return this.loadUsers(example);
	}
	
	@Override
	public boolean hasLoginName(String name){
		List<SysUser> sysUsers = this.loadUsersByLoginName(name);
		return sysUsers!=null && !sysUsers.isEmpty();
	}

	@Override
	public SysUser register(SysUserView sysUserView,ResponseData<SysUserView> responseData) {
		if (sysUserView == null || this.hasLoginName(sysUserView.getLoginName())) {
			responseData.parseErrorCode(ErrorCode.USER_AND_PASSWOD_NOT_NULL);
			return null;
		}
		if(!sysUserView.getEmail().isEmpty()&&!Validator.isEmail(sysUserView.getEmail())){
			responseData.parseErrorCode(ErrorCode.EMAIL_ILLEGAL);
			return null;
		}
		if(!sysUserView.getPhoneNumber().isEmpty()&&!Validator.isMobile(sysUserView.getPhoneNumber())){
			responseData.parseErrorCode(ErrorCode.PHONENUMBER_ILLEGAL);
			return null;
		}
		if(!sysUserView.getAddress().isEmpty()&&!Validator.isIDCard(sysUserView.getIdNo())){
			responseData.parseErrorCode(ErrorCode.ADDRESS_ILLEGAL);
			return null;
		}
		String company = sysUserView.getCompany();
		String companyId = null;
		if(!StringUtils.isEmpty(company)){
			companyId = sysCompanyService.addCompany(company);
		}
		SysUser sysUser = new SysUser();
		String userId = TokenGenerator.generateKey();
		Date createDate = new Date();
		sysUser.setCreateDate(createDate);
		sysUser.setLastLogindate(createDate);
		sysUser.setDelFlag((byte) 0);
		sysUser.setId(userId);
		sysUser.setType(GlobalMenu.RECEIVE_TYPE);
		sysUser = copyViewToSysUser(sysUser, sysUserView);
		sysUser.setPassword(MD5Util.MD5(sysUser.getPassword()));
		sysUser.setCompanyId(companyId);
		if(sysUser.getIcon()==null || sysUser.getIcon().isEmpty()){
			sysUser.setIcon(sysUserView.getIconId());
		}
		sysUserMapper.insertSelective(sysUser);
//		SysUserView suv = copySysUserToView(sysUser);
		sysFileService.updateFilesOrderId(userId,FileType.USER_ICON.getId(),sysUserView.getIcon());
		sysFileService.updateFilesOrderId(userId,FileType.VALID_FILE.getId(),sysUserView.getFileIds());
		return sysUser;
	}
	
	public SysUser copyViewToSysUser(SysUser sysUser,SysUserView sysUserView){
		if(sysUserView==null){
			return sysUser;
		}
		if(sysUser==null){
			sysUser = new SysUser();
		}
		sysUser.setLoginName(sysUserView.getLoginName());
		sysUser.setNickName(sysUserView.getNickName());
		sysUser.setEmail(sysUserView.getEmail());
		sysUser.setAddress(sysUserView.getAddress());
		sysUser.setPhoneNumber(sysUserView.getPhoneNumber());
		sysUser.setRealName(sysUserView.getRealName());
		sysUser.setPassword(sysUserView.getPassword());
		sysUser.setType(sysUserView.getType());
		sysUser.setIcon(sysUserView.getIcon());
		sysUser.setIdNo(sysUserView.getIdNo());
		sysUser.setReadonlyFlag(sysUserView.getReadonlyFlag());
		sysUser.setAccountReadonly(sysUserView.getAccountReadonly());
		sysUser.setReadonlyFlag(sysUserView.getReadonlyFlag());
		sysUser.setAccountType(sysUserView.getAccountType());
		if(sysUserView.getId()!=null){
			sysUser.setId(sysUserView.getId());
		}
		
		return sysUser;
	}
	public SysUserView copySysUserToView(SysUser sysUser){
		SysUserView sysUserView = new SysUserView();
		if(sysUser==null){
			return null;
		}
		sysUserView.setLoginName(sysUser.getLoginName());
		sysUserView.setNickName(sysUser.getNickName());
		sysUserView.setEmail(sysUser.getEmail());
		sysUserView.setAddress(sysUser.getAddress());
		sysUserView.setPhoneNumber(sysUser.getPhoneNumber());
		sysUserView.setRealName(sysUser.getRealName());
		sysUserView.setId(sysUser.getId());
		sysUserView.setType(sysUser.getType());
		sysUserView.setAccessToken(sysUser.getAccessToken());
		sysUserView.setIcon(sysUser.getIcon());
		sysUserView.setAccountReadonly(sysUser.getAccountReadonly());
		sysUserView.setReadonlyFlag(sysUser.getReadonlyFlag());
		sysUser.setAccountType(sysUser.getAccountType());
		return sysUserView;
	}

	@Override
	public ResponseData<SysUser> recommend(String type,ResponseData<SysUser> responseData) {
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		SysUserExample sysUserExample = null;
		if(type==null || type.equals("1")){//查找制作方
			sysUserExample = new SysUserExample();
		}else{//寻找接包方
			sysUserExample = new SysUserExample();
		}
		List<SysUser> sysUserList = sysUserMapper.selectByExample(sysUserExample);
		responseData.setDataList(sysUserList);
		return responseData;
	}

	@Override
	public ResponseData<SysUser> langSetting(String lang,String id,ResponseData<SysUser> responseData) {
		SysUser sysUser = new SysUser();
		sysUser.setId(id);
		sysUser.setLang(lang);
		sysUserMapper.updateByPrimaryKeySelective(sysUser);
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		return responseData;
	}

	//注销接口
	@Override
	public ResponseData<SysUser> logout(HttpServletRequest request,ResponseData<SysUser> responseData) {
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
		if(sysUser==null && responseData!=null){
			responseData.parseErrorCode(ErrorCode.HASLOGIN_FALSE);
			return responseData;
		}
		if(sysUser==null){
			return null;
		}
		request.getSession().removeAttribute("sysUser");
		GlobalSession.remove();
		SysUser tempUser = new SysUser();
		tempUser.setId(sysUser.getId());
		tempUser.setAccessToken("");
		sysUserMapper.updateByPrimaryKeySelective(tempUser);
		return responseData;
	}

	@Override
	public SysUser userInfo(String id, ResponseData<SysUser> ResponseData) {
		SysUser sysUser = null;
		if(id==null){
			ResponseData.parseErrorCode(ErrorCode.USERID_EMPTY);
			return sysUser;
		}
		sysUser = sysUserMapper.selectByPrimaryKey(id);
		ResponseData.setData(sysUser);
		return sysUser;
	}

	@Override
	public ResponseData<SysUserView> updateUser(SysUserView sysUserView, ResponseData<SysUserView> responseData) {
		int i = sysUserMapper.updateByPrimaryKeySelective(copyViewToSysUser(new SysUser(), sysUserView));
		responseData.setData(sysUserView);
		return responseData;
	}

	@Override
	public ResponseData<Object> modifyPassword(String oldPassword, String newPassword, String confirmNewPassword,
			String userId,ResponseData<Object> responseData) {
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{oldPassword,newPassword,confirmNewPassword},new String[]{"oldPassword","newPassword","confirmNewPassword"}, responseData)){
			return responseData;
		}
		SysUser sysUser = sysUserMapper.selectByPrimaryKey(userId);
		if(sysUser==null){
			responseData.parseErrorCode(ErrorCode.USER_CAN_NOT_FOUND);
		}else{
			String password = sysUser.getPassword();
			if(!password.equals(MD5Util.MD5(oldPassword))){
				responseData.parseErrorCode(ErrorCode.OLD_PASSWORD_IS_NOT_RIGHT);
			}else{
				if(!newPassword.equals(confirmNewPassword)){
					responseData.parseErrorCode(ErrorCode.TWO_NEW_PASSWORD_IS_NOT_SAME);
				}else{
					SysUser su = new SysUser();
					su.setId(userId);
					su.setPassword(MD5Util.MD5(newPassword));
					int i = sysUserMapper.updateByPrimaryKeySelective(su);
					if(i<=0){
						responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
					}
					responseData.setData(copySysUserToView(sysUser));
				}
			}
		}
		return responseData;
	}

	@Override
	public SysUser loadSysUserById(String userId) {
		SysUser sysUser = sysUserMapper.selectByPrimaryKey(userId);
		return  sysUser;
	}

	@Override
	public int updateSysUserByPrimaryKeySelective(SysUser sysUser) {
		return sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}
	

}
