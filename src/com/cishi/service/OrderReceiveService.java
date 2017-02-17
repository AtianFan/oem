package com.cishi.service;

import java.util.List;

import com.cishi.beans.OrderReceive;
import com.cishi.param.ResponseData;
import com.cishi.view.OrderReceiveView;

public interface OrderReceiveService {

	int addOrderReceive(OrderReceiveView orderReceiveView);
	ResponseData<OrderReceive> addOrderReceive(OrderReceiveView orderReceiveView,ResponseData<OrderReceive> responseData);
	ResponseData<OrderReceive> loadOrderReceiveByUserId(String userId);
	ResponseData<OrderReceive> loadOrderReceiveByOrderId(String orderId);
	List<OrderReceiveView> loadOrderReceiveList(String orderId);
}
