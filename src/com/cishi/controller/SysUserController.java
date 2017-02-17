package com.cishi.controller;

import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.annotation.XmlElementDecl.GLOBAL;
import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.SysFile;
import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.global.GlobalSession;
import com.cishi.param.ResponseData;
import com.cishi.service.SysFileService;
import com.cishi.service.SysUserService;
import com.cishi.util.DataToClassUtil;
import com.cishi.util.GlobalContextUtil;
import com.cishi.util.LanguageUtil;
import com.cishi.view.SysUserView;
import com.sun.org.apache.bcel.internal.generic.StoreInstruction;

@Controller
@RequestMapping("/SysUser/")
public class SysUserController extends BaseController {
	private final static Logger logger = Logger.getLogger(SysUserController.class);

	@Resource
	public SysUserService sysUserService;
	
	@Resource
	public SysFileService sysFileService;

	
	/*@ResponseBody
	@RequestMapping(value="logout",method=RequestMethod.POST)
	public ResponseData<SysUser> logout(){
		sysUserService.logout(request,this.getResponseData());
		return this.getResponseData(true);
	}
	
	@RequestMapping(value="lout",method=RequestMethod.GET)
	public String logout1(){
		sysUserService.logout(request,this.getResponseData());
		return "redirect:/Page/login";
	}*/
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> login(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		logger.debug("login:"+requestList);
		sysUserService.login(this.parseRequestList(requestList),responseData,request);
		return responseData;
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> register(@RequestParam("requestList") String requestList) {
		logger.debug("register"+requestList);
		ResponseData responseData = this.getNewResponseData();
		SysUser sysUser = sysUserService.register((SysUserView) this.loadObjectByJSON(requestList, SysUserView.class),responseData);
		if (sysUser != null) {
//			request.getSession().setAttribute("sysUser", sysUser);
			/*this.setRetcode(ErrorCode.LOGIN_SUCCESS.getRetcode());
			this.setRetmsg(ErrorCode.LOGIN_SUCCESS.getRetmsg());*/
			responseData.parseErrorCode(ErrorCode.SUCCESS);
			responseData.setAccessToken(sysUser.getAccessToken());
			responseData.setData(sysUser);
		}
		return responseData;
	}
	
	@RequestMapping(value = "hasUser", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> hasUser(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		boolean flag = sysUserService.hasLoginName(this.getParamValue("loginName",null));
		if(flag){
			/*this.setRetcode(ErrorCode.USER_HAS_EXIST.getRetcode());
			this.setRetmsg(ErrorCode.USER_HAS_EXIST.getRetmsg());*/
			responseData.parseErrorCode(ErrorCode.USER_HAS_EXIST);
		}else{
//			this.setRetcode(ErrorCode.SUCCESS.getRetcode());
//			this.setRetmsg(ErrorCode.SUCCESS.getRetmsg());
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}
		return responseData;
	}
	
	@RequestMapping(value = "userInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> userInfo(@RequestParam("requestList") String requestList) {
		logger.debug("login:"+requestList);
		ResponseData responseData = this.getNewResponseData();
		String userId = this.parseRequestList(requestList).get("userId");
		sysUserService.userInfo(userId,responseData);
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value = "loadCurrentUser", method = RequestMethod.POST)
	public ResponseData<SysUser> loadCurrentUser(){
		ResponseData responseData = this.getNewResponseData();
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		if(sysUser==null){
			responseData.parseErrorCode(ErrorCode.HASLOGIN_FALSE);
		}else{
			String id = sysUser.getId();
			if(!StringUtils.isEmpty(id)){
				sysUser = sysUserService.loadSysUserById(id);
			}
//			SysFile sysFile = sysFileService.downUserPicture(sysUser.getId());
			/*if(sysFile!=null){
				sysUser.setIconFile(sysFile);
			}*/
			responseData.parseErrorCode(ErrorCode.SUCCESS);
			responseData.setData(sysUser);
		}
		return responseData;
	}
	
	public static SysUser loadSysUser(HttpSession httpSession){
		SysUserService sysUserService = GlobalContextUtil.getBean("sysUserService");
		SysUser sysUser = (SysUser)httpSession.getAttribute("sysUser");
		if(sysUser==null)
			return null;
		String id = sysUser.getId();
		SysUser sysUserResult = sysUserService.loadSysUserById(id);
		return sysUserResult;
	}
	/**
	 * 更新用户接口
	 * @param requestList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public ResponseData<SysUserView> updateUser(@RequestParam("requestList")String requestList){
		ResponseData responseData = this.getNewResponseData();
		SysUserView sysUserView = (SysUserView)DataToClassUtil.toClassData(requestList,SysUserView.class);
		sysUserService.updateUser(sysUserView, responseData);
		return responseData;
	}

	/**
	 * 修改密码
	 * @param requestList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="modifyPassword",method=RequestMethod.POST)
	public ResponseData<SysUserView> modifyPassword(@RequestParam("requestList")String requestList){
		ResponseData responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String oldPassword = map.get("oldPassword");
		String newPassword = map.get("newPassword");
		String confirmNewPassword = map.get("confirmNewPassword");
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		if(sysUser==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
		}
		String userId = sysUser.getId();
		sysUserService.modifyPassword(oldPassword, newPassword, confirmNewPassword, userId, responseData);
		return responseData;
	}
}
