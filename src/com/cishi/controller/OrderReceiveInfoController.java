package com.cishi.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.OrderReceiveInfo;
import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderReceiveInfoService;

@Controller
@RequestMapping("/OrderReceiveInfo/")
public class OrderReceiveInfoController extends BaseController{

	
	@Resource
	public OrderReceiveInfoService orderReceiveInfoService;
	
	@ResponseBody
	@RequestMapping(value="loadOrderReceiveInfoList")
	public ResponseData<OrderReceiveInfo> loadOrderReceiveInfoList(@RequestParam("requestList")String requestList){
		ResponseData<OrderReceiveInfo> responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String pOrderId = map.get("pOrderId");
		String userId = null;
		String sysConfirmId = map.get("sysConfirmId");
		if(sysConfirmId==null){
			userId = this.getCurrentUserId();
			if(userId==null){
				responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			}
		}
		List<OrderReceiveInfo> orderReceiveInfos = orderReceiveInfoService.loadOrderReceiveInfoList(pOrderId, userId, sysConfirmId );
		responseData.setDataList(orderReceiveInfos);
		return responseData;
	}
	
}
