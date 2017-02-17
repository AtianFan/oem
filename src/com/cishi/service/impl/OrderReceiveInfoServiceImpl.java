package com.cishi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.OrderReceiveInfo;
import com.cishi.beans.OrderReceiveInfoExample;
import com.cishi.dao.OrderReceiveInfoMapper;
import com.cishi.service.OrderReceiveInfoService;
import com.cishi.util.TokenGenerator;
import com.sun.org.apache.xpath.internal.operations.Or;

@Service("orderReceiveInfoService")
public class OrderReceiveInfoServiceImpl implements OrderReceiveInfoService {

	@Resource
	public OrderReceiveInfoMapper orderReceiveInfoMapper;
	
	@Override
	public int addOrderReceiveInfo(OrderReceiveInfo orderReceiveInfo) {
		return orderReceiveInfoMapper.insertSelective(orderReceiveInfo);
	}

	@Override
	public int addBatchReceiveInfoList(List<OrderReceiveInfo> list,String userId,String pOrderId,String sysConfirmId) {
	/*	OrderReceiveInfoExample orderReceiveInfoExample = new OrderReceiveInfoExample();
		OrderReceiveInfoExample.Criteria criteria = orderReceiveInfoExample.createCriteria();
		criteria.andDelFlagEqualTo((byte)0);
		criteria.andReceiverIdEqualTo(userId);
		List<String> values = new ArrayList<>();
		for(OrderReceiveInfo orderReceiveInfo:list){
			values.add(orderReceiveInfo.getOrderId());
		}
		criteria.andOrderIdIn(values);
		OrderReceiveInfo record = new OrderReceiveInfo();
		record.setIsCurrent(false);
		orderReceiveInfoMapper.updateByExampleSelective(record , orderReceiveInfoExample);*/
		int i = 0;
		for(OrderReceiveInfo orderReceiveInfo:list){
			if(orderReceiveInfo==null){
				continue;
			}
			orderReceiveInfo.setId(TokenGenerator.generateKey());
			orderReceiveInfo.setDelFlag((byte)0);
			orderReceiveInfo.setReceiverId(userId);
			orderReceiveInfo.setIsCurrent(true);
			orderReceiveInfo.setOrderId(orderReceiveInfo.getOrderId());
			orderReceiveInfo.setParentOrderId(pOrderId);
			orderReceiveInfo.setSysConfirmId(sysConfirmId);
			int result = addOrderReceiveInfo(orderReceiveInfo);
			i+=result;
		}
		return i;
	}

	@Override
	public List<OrderReceiveInfo> loadOrderReceiveInfoList(String pOrderId, String userId,String sysConfirmId) {
		OrderReceiveInfoExample example = new OrderReceiveInfoExample();
		OrderReceiveInfoExample.Criteria criteria = example.createCriteria();
		criteria.andDelFlagEqualTo((byte)0);
		if(userId!=null)criteria.andReceiverIdEqualTo(userId);
		criteria.andParentOrderIdEqualTo(pOrderId);
		criteria.andIsCurrentEqualTo(true);
		if(sysConfirmId!=null){
			criteria.andSysConfirmIdEqualTo(sysConfirmId);
		}
		return orderReceiveInfoMapper.selectByExample(example);
	}
	
	

}
