package com.cishi.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cishi.beans.OrderTaskExample;
import com.cishi.beans.SysUser;
import com.cishi.beans.SysUserExample;
import com.cishi.beans.SysUserExample.Criteria;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.FileType;
import com.cishi.dao.SysUserMapper;
import com.cishi.global.GlobalSession;
import com.cishi.param.ResponseData;
import com.cishi.service.SysCompanyService;
import com.cishi.service.SysFileService;
import com.cishi.service.SysUserAdminService;
import com.cishi.service.SysUserService;
import com.cishi.util.MD5Util;
import com.cishi.util.ResponseUtil;
import com.cishi.util.TokenGenerator;
import com.cishi.util.Validator;
import com.cishi.view.PageView;
import com.cishi.view.SysUserView;

@Service("sysUserAdminService")
public class SysUserAdminServiceImpl implements SysUserAdminService{

	private final static Logger logger = Logger.getLogger(SysUserAdminServiceImpl.class);
	
//	@Resource
//	public SysFileService sysFileAdminService;

	@Resource
	public SysUserMapper sysUserMapper;
	
	@Resource
	public SysCompanyService sysCompanyService;

	@Override
	public boolean adminLogin() {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public ResponseData<SysUserView> adminLogin(Map<String, String> map, ResponseData<SysUserView> responseData,
			HttpServletRequest request) {
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
		criteria.andLoginNameEqualTo(loginName);
		criteria.andPasswordEqualTo(MD5Util.MD5(password));
		List<SysUser> userList = sysUserMapper.selectByExample(sysUserExample);
		if(userList==null || userList.isEmpty()){
//			responseData.setRetcode(ErrorCode.PASSWORD_ERROR.getRetcode());
//			responseData.setRetmsg(ErrorCode.PASSWORD_ERROR.getRetmsg());
			responseData.parseErrorCode(ErrorCode.PASSWORD_ERROR);
			return responseData;
		}
		if (userList.size() == 1) {
			sysUser = userList.get(0);
			request.getSession().setAttribute("sysUser", sysUser);
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
		responseData.setData(adminCopySysUserToView(sysUser));
		return responseData;
	}
	
	
	public SysUserView adminCopySysUserToView(SysUser sysUser){
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
		return sysUserView;
	}

	@Override
	public List<SysUser> loadUserInfoList(PageView pageView,ResponseData responseData) {
		List<SysUser> sysUser= sysUserMapper.selectByExampleWithRowbounds(new SysUserExample(), pageView.toRowBounds());
		if(sysUser!=null){
			int i = this.count(new SysUserExample());
			pageView.setTotal(i);
			return sysUser;
		}
		return null;
	}
	@Override
	public int count(SysUserExample sysUserExample) {
		return sysUserMapper.countByExample(sysUserExample);
	}

	@Override
	public int deleteAndActiveUserInfo(String userID,String operateType,ResponseData responseData) {
		SysUser sysUser = new SysUser();
		if(operateType.equals("1")){
			sysUser.setStatus((byte)1);
		}else if(operateType.equals("0")){
			sysUser.setStatus((byte)0);
		}
		sysUser.setId(userID);
		int num = sysUserMapper.updateByPrimaryKeySelective(sysUser);
		return num;
	}

	@Override
	public ResponseData<SysUserView> adminUpdateUser(SysUserView sysUserView, ResponseData<SysUserView> responseData) {
		int i = sysUserMapper.updateByPrimaryKeySelective(copyViewToSysUser(new SysUser(), sysUserView));
		return responseData;
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
		if(sysUserView.getId()!=null){
			sysUser.setId(sysUserView.getId());
		}
		
		return sysUser;
	}
	

}
