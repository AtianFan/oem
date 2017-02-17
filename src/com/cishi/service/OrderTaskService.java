package com.cishi.service;

import java.util.List;
import com.cishi.beans.OrderTask;
import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.OrderTaskExample;
import com.cishi.param.ResponseData;
import com.cishi.view.OrderTaskView;
import com.cishi.view.PageView;

public interface OrderTaskService {
	
	OrderTask addOrderTask(OrderTaskView orderTaskView,ResponseData responseData);
	int count(OrderTaskExample orderTaskExample);
	
	ResponseData<OrderTask> deleteOrderTask(String orderId,ResponseData<OrderTask> responseData,String userId);
	
	List<OrderTaskCollection> loadOrderTaskListPage(OrderTaskExample orderTaskExample,PageView page,boolean flag,boolean isParent);
	
	/**
	 * 更新任务接口
	 * @param orderId
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTask> updateOrderTask(OrderTask orderTask,ResponseData<OrderTask> responseData);
	
	/**
	 * 添加任务
	 * @param orderTaskView
	 * @param responseData
	 * @param requestList
	 * @return
	 */
	ResponseData<OrderTask> addOrderTask(OrderTaskView orderTaskView,ResponseData<OrderTask> responseData,String requestList);
	
	/**
	 * 更新任务信息
	 * @param orderTask
	 * @return
	 */
	int updateTask(OrderTask orderTask);
	
	
	int updateTask(OrderTaskView orderTask);
	/**
	 * 更新任务状态
	 * @param id
	 * @param taskStatus
	 * @return
	 */
	int updateTaskStatus(String id,Byte taskStatus);
	
	/**
	 * 任务详情接口通过任务id
	 * @param orderId
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTask> orderTaskDetail(String orderId,ResponseData<OrderTask> responseData);
	
	ResponseData<OrderTaskCollection> orderTaskDetailRefer(String orderId,String userId,ResponseData<OrderTaskCollection> responseData);
	
	/**
	 * 完成任务
	 * @param orderId
	 * @param userId
	 * @param score
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTask> finshOrderTask(String orderId,String userId,String score,ResponseData<OrderTask> responseData);
	
	/**
	 * 设置接包方，修改任务状态为开始
	 * @param orderId
	 * @param receiverId
	 * @param orderReceiveId
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTask> receive(String orderId,String receiverId,String orderReceiveId,ResponseData<OrderTask> responseData);
	
	/**
	 * 通过id查询任务
	 * @param orderId
	 * @return
	 */
	OrderTask loadOrderTaskById(String orderId);
	
	/**
	 * 接包方确认流程
	 * @param orderId
	 * @param receiverId
	 * @return
	 */
	ResponseData<OrderTask> confirmTaskByReceiver(String orderId,String receiverI,String confirmStatus,String remark,ResponseData<OrderTask> responseData);
	
	/**
	 * 发包方确认流程
	 * @param orderId
	 * @param launchId
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTask> confirmTaskByLauncher(String orderId,String launchId,String confirmStatus,String remark,ResponseData<OrderTask> responseData);
	/**
	 * 推荐
	 * @param responseData
	 * @return
	 */
	ResponseData<OrderTaskCollection> recomendTask(ResponseData<OrderTaskCollection> responseData);
	
	/**
	 * 查找子任务
	 * @param orderId
	 * @return
	 */
	List<OrderTask> loadChildren(String orderId,String userId);
	
	/**
	 * 更新任务价格
	 * @param orderTaskList
	 * @return
	 */
	Boolean updateOrderTaskPrice(String orderId,String userId,String sysConfirmId);
	
	/**
	 * 根据任务ID拿到发包人的邮箱
	 */
	String getStartEmailByOrderId(String orderId);
}
