package com.cishi.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.SysContactInfo;
import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.service.SysContactInfoService;
import com.cishi.util.DataToClassUtil;

@Controller
@RequestMapping("/global/")
public class GlobalController extends BaseController {

	@Resource
	public SysContactInfoService sysContactInfoService;
	
	@RequestMapping("addSysContactInfo")
	@ResponseBody
	public ResponseData<SysContactInfo> addSysContactInfo(@RequestParam("requestList")String requestList){
		ResponseData<SysContactInfo> responseData = new ResponseData<>();
		SysContactInfo sysContactInfo = (SysContactInfo)DataToClassUtil.toClassData(this.parseRequestList(requestList), SysContactInfo.class);
		int i = sysContactInfoService.addSysContactInfo(sysContactInfo);
		if(i>0){
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}else{
			responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
		}
		return responseData;
	}
	
}
