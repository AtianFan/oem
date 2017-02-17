package com.cishi.service;

import com.cishi.beans.OrderTask;

public interface OrderTaskFlowService {

	//包含任务状态，确认状态、接单信息
	String[] taskStatus(OrderTask orderTask);
	
	int updateTaskStatus(OrderTask orderTask);
}
