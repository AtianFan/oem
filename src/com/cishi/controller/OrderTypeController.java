package com.cishi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.OrderType;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderTypeService;

@Controller
@RequestMapping("/OrderType/")
public class OrderTypeController extends BaseController {

	@Resource
	public OrderTypeService orderTypeService;
	
	@ResponseBody
	@RequestMapping(value = "loadOrderType",method=RequestMethod.POST)
	public ResponseData<OrderType> loadOrderTypeList(@RequestParam(value="requestList",required=false)String requestList){
		ResponseData responseData = this.getNewResponseData();
		orderTypeService.loadOrderTypeList(responseData);
		return responseData;
	}
	
}
