package com.cishi.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.OrderReceive;
import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderReceiveService;
import com.cishi.util.DataToClassUtil;
import com.cishi.view.OrderReceiveView;

@Controller
@RequestMapping("/OrderReceive/")
public class OrderReceiveController extends BaseController{
	
	public enum OrderReceiveParams{
		LOAD_BY_USER_ID("1","通过用户id查询"),
		LOAD_BY_ORDER_ID("2","通过任务id查询");
		private String id;
		private String name;
		private OrderReceiveParams(String id, String name) {
			this.id = id;
			this.name = name;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
	}
	
	@Resource
	public OrderReceiveService orderReceiveService;
	
	@ResponseBody
	@RequestMapping(value="loadOrderReceive",method=RequestMethod.POST)
	public ResponseData<OrderReceive> loadOrderReceive(@RequestParam("requestList")String requestList){
		ResponseData responseData = null;
		Map<String,String> map = DataToClassUtil.parseRequestList(requestList);
		String type = (String)map.get("type");
		if(type==null || type.equals(OrderReceiveParams.LOAD_BY_USER_ID.getId())){//1表示通过用户id查找已接受项目
			String userId = (String)map.get("userId");
			responseData = orderReceiveService.loadOrderReceiveByUserId(userId);
		}else if(type.equals(OrderReceiveParams.LOAD_BY_ORDER_ID.getId())){
			String orderId = (String)map.get("orderId");
			responseData = orderReceiveService.loadOrderReceiveByOrderId(orderId);
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}else{
			responseData = this.getNewResponseData();
			responseData.parseErrorCode(ErrorCode.PARAMS_ERROR);
		}
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value="addOrderReceive",method=RequestMethod.POST)
	public ResponseData<OrderReceive> addOrderReceive(@RequestParam("requestList")String requestList){
		ResponseData responseData = this.getNewResponseData();
		SysUser sysUser =(SysUser)request.getSession().getAttribute("sysUser");
		if(sysUser==null || sysUser.getId()==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
		}else{
			OrderReceiveView orderReceiveView = (OrderReceiveView)DataToClassUtil.toClassData(requestList, OrderReceiveView.class);
			orderReceiveView.setReceiveId(sysUser.getId());
			orderReceiveService.addOrderReceive(orderReceiveView,responseData);
		}
		return responseData;
	}
}
