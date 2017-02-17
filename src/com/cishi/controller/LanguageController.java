package com.cishi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.util.LanguageUtil;

@Controller
@RequestMapping(value="/Language")
public class LanguageController extends BaseController {

	@ResponseBody
	@RequestMapping(value="change")
	public ResponseData changeLanguage(@RequestParam("requestList") String requestList){
		Map<String,String> map = this.parseRequestList(requestList);
		ResponseData responseData = this.getNewResponseData();
		String lang = map.get("lang");
		if(lang==null){
			lang="cn";
		}
		if(!lang.equals(LanguageUtil.getCurrentLanguage(request))){//保存上次的语言
			LanguageUtil.lastLanguage = LanguageUtil.getCurrentLanguage(request);
		}
		request.getSession().setAttribute("lang", lang);
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value="loadLanguage")
	public ResponseData loadLanguage(){
		List<String> list = LanguageUtil.getList();
		ResponseData responseData = this.getNewResponseData();
		List<Map<String,String>> result = new ArrayList<>();
		for(int length=list.size(),i=0;i<length;i++){
			Map<String,String> map = new HashMap<>();
			String type = list.get(i);
			map.put("title", LanguageUtil.getProperties(list.get(i), request.getSession()));
			map.put("value",type);
			if(type.equals(LanguageUtil.getCurrentLanguage(request))){//将最新的语言放在第一项
				result.add(0, map);
			}else{
				result.add(map);
			}
		}
		responseData.setDataList(result);
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		return responseData;
	}
}
