package com.cishi.service.impl;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cishi.beans.OrderReceive;
import com.cishi.beans.OrderReceiveExample;
import com.cishi.beans.OrderTask;
import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.dao.OrderReceiveMapper;
import com.cishi.global.GlobalSession;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderReceiveService;
import com.cishi.service.OrderTaskService;
import com.cishi.util.TokenGenerator;
import com.cishi.view.OrderReceiveView;

import sun.launcher.resources.launcher;
import sun.launcher.resources.launcher_it;

@Service("orderReceiveService")
public class OrderReceiveServiceImpl implements OrderReceiveService {

	@Resource
	public OrderReceiveMapper orderReceiveMapper;
	
	@Resource
	public OrderTaskService orderTaskService;
	
	@Override
	public int addOrderReceive(OrderReceiveView orderReceiveView) {
		OrderReceive orderReceive = copyViewToEntity(orderReceiveView, null);
		int i = orderReceiveMapper.insertSelective(orderReceive);
		return i;
	}

	@Override
	public ResponseData<OrderReceive> loadOrderReceiveByUserId(String userId) {
		ResponseData<OrderReceive> responseData = new ResponseData<OrderReceive>();
		OrderReceiveExample orderReceiveExample = new OrderReceiveExample();
		OrderReceiveExample.Criteria criteria = orderReceiveExample.createCriteria();
		criteria.andReceiverIdEqualTo(userId);
		List<OrderReceive> orderReceiveList = orderReceiveMapper
				.selectByExample(orderReceiveExample);
		responseData.setDataList(orderReceiveList);
		responseData.setRetcode(ErrorCode.SUCCESS.getRetcode());
		responseData.setMsg(ErrorCode.SUCCESS.getRetmsg());
		return responseData;
	}
	
	@Override
	public ResponseData<OrderReceive> loadOrderReceiveByOrderId(String orderId) {
		ResponseData<OrderReceive> responseData = new ResponseData<OrderReceive>();
		OrderReceiveExample orderReceiveExample = new OrderReceiveExample();
		OrderReceiveExample.Criteria criteria = orderReceiveExample.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		List<OrderReceive> orderReceiveList = orderReceiveMapper
				.selectByExample(orderReceiveExample);
		responseData.setDataList(orderReceiveList);
		responseData.setRetcode(ErrorCode.SUCCESS.getRetcode());
		responseData.setMsg(ErrorCode.SUCCESS.getRetmsg());
		return responseData;
	}
	
	public ResponseData<OrderReceive> updateOrderReceive(OrderReceive orderReceive,ResponseData<OrderReceive> responseData){
		int i = orderReceiveMapper.updateByPrimaryKey(orderReceive);
		if(i<=0){
			responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
		}else{
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}
		return responseData;
	}
	
	private OrderReceive copyViewToEntity(OrderReceiveView orderReceiveView,OrderReceive orderReceive){
		if(orderReceiveView==null){
			return new OrderReceive();
		}
		if(orderReceive==null){
			orderReceive = new OrderReceive();
		}
		orderReceive.setCreateDate(new Date());
		orderReceive.setId(TokenGenerator.generateKey());
		orderReceive.setOrderId(orderReceiveView.getOrderId());
		orderReceive.setRemark(orderReceiveView.getRemark());
		orderReceive.setReceiverId(orderReceiveView.getReceiveId());
		orderReceive.setMoney(orderReceiveView.getMoney());
		return orderReceive;
	}

	@Override
	public List<OrderReceiveView> loadOrderReceiveList(String orderId) {
		OrderReceiveExample ore = new OrderReceiveExample();
		OrderReceiveExample.Criteria criteria = ore.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		ore.setOrderByClause(" create_date desc");
		List<OrderReceiveView> orderReceiveList = orderReceiveMapper.selectReferList(ore);
		return orderReceiveList;
	}

	@Override
	public ResponseData<OrderReceive> addOrderReceive(OrderReceiveView orderReceiveView,
			ResponseData<OrderReceive> responseData) {
		String orderId = orderReceiveView.getOrderId();
		SysUser sysUser =  GlobalSession.get();
		if(sysUser==null){
			responseData.parseErrorCode(ErrorCode.HASLOGIN_FALSE);
			return responseData;
		}
		String receiverId = sysUser.getId();
		String orderLaunchId = null;
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		if(orderTask!=null){
			orderLaunchId = orderTask.getLauncherId();
		}
		if(orderLaunchId==null){
			responseData.parseErrorCode(ErrorCode.ORDER_CAN_NOT_BE_FOUND_OR_CAN_NOT_FIND_LAUNCH_ID);
			return responseData;
		}
		if(orderTask.getStatus()==(byte)0){
			responseData.parseErrorCode(ErrorCode.ORDER_NOT_RELEASE);
			return responseData;
		}
		//自己发布的任务不能自己接受
		if(receiverId.equals(orderLaunchId)){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_RECEIVE_SELF);
			return responseData;
		}
		this.addOrderReceive(orderReceiveView);
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		return responseData;
	}

}
