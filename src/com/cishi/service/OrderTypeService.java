package com.cishi.service;

import java.util.List;

import com.cishi.beans.OrderType;
import com.cishi.param.ResponseData;

public interface OrderTypeService {

	
	List<Byte> loadOrderTaskByName(String name);
	
	ResponseData<OrderType> loadOrderTypeList(ResponseData<OrderType> responseData);

}
