package com.cishi.service;

import java.util.List;

import com.cishi.beans.OrderReceiveInfo;

public interface OrderReceiveInfoService {
	
	int addOrderReceiveInfo(OrderReceiveInfo orderReceiveInfo);
	
	int addBatchReceiveInfoList(List<OrderReceiveInfo> list,String userId,String pOrderId,String sysConfirmId);
	
	List<OrderReceiveInfo> loadOrderReceiveInfoList(String pOrderId,String userId,String sysConfirmId);
}
