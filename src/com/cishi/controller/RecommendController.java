package com.cishi.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.param.ResponseData;
import com.cishi.service.OrderTaskService;
import com.cishi.service.SysUserService;



/**
 * 推荐接口
 * @author tao
 *
 */

@Controller
public class RecommendController extends BaseController{

	@Resource
	public SysUserService sysUserService;
	
	@Resource
	public OrderTaskService orderTaskService;
	
	@ResponseBody
	@RequestMapping(value="recommend")
	public ResponseData recommend(@RequestParam(value="requestList",required=false)String requestList){
		ResponseData responseData = this.getNewResponseData();
		if(requestList==null){
			orderTaskService.recomendTask(responseData);
		}else{
			String type = "2";
			if(requestList!=null){
				Map<String, String> map = this.parseRequestList(requestList);
				type = map.get("type");
			}
			if(type==null || type.equals("0")){
				orderTaskService.recomendTask(responseData);
			}else{
				sysUserService.recommend(type, responseData);
			}
		}
		return responseData;
	}
	
}
