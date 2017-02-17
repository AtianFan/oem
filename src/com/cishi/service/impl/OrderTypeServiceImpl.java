package com.cishi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.OrderReceiveExample.Criteria;
import com.cishi.beans.OrderType;
import com.cishi.beans.OrderTypeExample;
import com.cishi.constant.ErrorCode;
import com.cishi.dao.OrderTypeMapper;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderTypeService;

@Service("orderTypeService")
public class OrderTypeServiceImpl implements OrderTypeService{

	@Resource
	public OrderTypeMapper orderTypeMapper;
	
	@Override
	public ResponseData<OrderType> loadOrderTypeList(ResponseData<OrderType> responseData) {
		List<OrderType> orderTypeList = orderTypeMapper.selectByExample(new OrderTypeExample());
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		responseData.setDataList(orderTypeList);
		return responseData;
	}

	@Override
	public List<Byte> loadOrderTaskByName(String name) {
		OrderTypeExample orderTypeExample = new OrderTypeExample();
		OrderTypeExample.Criteria criteria = orderTypeExample.createCriteria();
		criteria.andNameLike("%"+name+"%");
		List<OrderType> orderTypeList = orderTypeMapper.selectByExample(orderTypeExample);
		List<Byte> resultList = new ArrayList<>();
		for(OrderType orderType:orderTypeList){
			Byte typeId = orderType.getId();
			resultList.add(typeId);
		}
		return resultList;
	}

}
