package com.cishi.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.SysUser;
import com.cishi.beans.SysUserExample;
import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.service.SysFileService;
import com.cishi.service.SysUserAdminService;
import com.cishi.util.DataToClassUtil;
import com.cishi.view.PageView;
import com.cishi.view.SysUserView;

@Controller
@RequestMapping("/SysUser/")
public class SysUserAdminController extends BaseController {
	private final static Logger logger = Logger.getLogger(SysUserAdminController.class);

	@Resource
	public SysUserAdminService sysUserAdminService;
	
//	@Resource
//	public SysFileService sysFileAdminService;

	
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
	/**
	 * 管理员登录接口
	 * @param requestList
	 * @return
	 */
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> adminLogin(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		logger.debug("login:"+requestList);
		sysUserAdminService.adminLogin(this.parseRequestList(requestList),responseData,request);
		return responseData;
	}
	
	/**
	 * 用户列表接口
	 * @param requestList
	 * @return
	 */
	@RequestMapping(value = "loadUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> loadUserInfo(@RequestParam("requestList") String requestList) {
		logger.debug("login:"+requestList);
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = DataToClassUtil.parseRequestList(requestList);
		int pageNo = Integer.valueOf(map.get("pageNo"));
		PageView pageView = new PageView();
		pageView.setPageNo(pageNo);
		List<SysUser> sysUser = sysUserAdminService.loadUserInfoList(pageView,responseData);
		if(sysUser!=null){
			responseData.setDataList(sysUser);
			responseData.setPageView(pageView);
		}else{
			responseData.parseErrorCode(ErrorCode.DATA_EMTIY);
		}
		return responseData;
	}
	/**
	 * 删除用户信息接口
	 * @param requestList
	 * @return
	 */
	@RequestMapping(value = "deleteAndActiveUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData<SysUser> deleteAndActiveUserInfo(@RequestParam("requestList") String requestList){
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = DataToClassUtil.parseRequestList(requestList);
		String userId = map.get("id");
		String userType = map.get("type");
		String operateType = map.get("operateType");
		//type取值为4时表示管理员，管理员不能删除
		if(userType!=null&&!userType.equals("4")){
			if(!userId.equals("")&&userId!=null){
				int num = sysUserAdminService.deleteAndActiveUserInfo(userId,operateType,responseData);
			}else{
				responseData.parseErrorCode(ErrorCode.USERID_EMTIY);
			}
		}else{
			responseData.parseErrorCode(ErrorCode.ADMIN_NO_DELETE);
		}
		return responseData;
	}
	/**
	 * 更新用户接口
	 * @param requestList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateUserInfo",method=RequestMethod.POST)
	public ResponseData<SysUserView> updateUserInfo(@RequestParam("requestList")String requestList){
		ResponseData responseData = this.getNewResponseData();
		SysUserView sysUserView = (SysUserView)DataToClassUtil.toClassData(requestList,SysUserView.class);
		sysUserAdminService.adminUpdateUser(sysUserView, responseData);
		return responseData;
	}

}
