package com.cishi.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.cishi.beans.OrderTask;
import com.cishi.service.OrderTaskFlowService;
import com.cishi.service.OrderTaskService;


@Service("orderTaskFlowService")
public class OrderTaskFloaServiceImpl implements OrderTaskFlowService {
	
	@Resource
	public OrderTaskService orderTaskService;

	@Override
	public String[] taskStatus(OrderTask orderTask) {
		String receiverId = orderTask.getReceiverId();
		Byte status = orderTask.getStatus();
		Byte launcherStatus = orderTask.getLauncherStatus();
		Byte receiverStatus = orderTask.getReceiverStatus();
		if(receiverId==null){//wait for receive
			
		}else{
			if(receiverStatus==null){
				
			}
		}
		return null;
	}

	@Override
	public int updateTaskStatus(OrderTask orderTask) {
		return 0;
	}

}
