package com.cishi.service;

import java.util.List;
import java.util.Map;

import com.cishi.beans.OrderTask;
import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.SysConfirm;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.param.ResponseData;

public interface SysConfirmService {

	
	/**
	 * 添加空白确认
	 * @param sysConfirm
	 * @return
	 */
	int addConfirm(SysConfirm sysConfirm);
	
	/**
	 * 双方确认
	 * @param flag
	 * @param confirmStatus
	 * @param remark
	 * @param confirmId
	 * @return
	 */
	boolean confirm(boolean flag,Byte confirmStatus,String remark,String confirmId);
	
	/**
	 * 通过任务状态获取确认信息
	 * @param orderId
	 * @param status
	 * @return
	 */
	List<SysConfirmCollection> loadSysConfirmList(String orderId,Byte status,Boolean isCurrent);
	
	/**
	 * 通过任务状态获取确认信息
	 * @param orderId
	 * @param status
	 * @return
	 */
	List<SysConfirmCollection> loadSysConfirmList(String orderId,Byte status,Boolean isCurrent,String userId);
	/**
	 * 通过任务状态获取确认信息
	 * @param orderId
	 * @param status
	 * @return
	 */
	List<SysConfirmCollection> loadSysConfirmList(String orderId,String userId,String status,Boolean isCurrent);
	
	/**
	 * 废弃确认流程
	 * @param id
	 * @return
	 */
	int deprecatedSysConfirm(String id);
	
	/**
	 * 添加确认订单，废弃原先的确认
	 * @return
	 */
	int addSysConfirmAndDeprecated(SysConfirm sysConfrim,Boolean flag);
	
	/**
	 * 申请系统确认流程
	 * @param orderId
	 * @param userId
	 * @param taskFlowStatus
	 * @param responseData
	 */
	String applySysConfirm(String orderId,Double money,String userId,TaskFlowStatus taskFlowStatus,Byte type,AbstractSysConfirmService abstractSysConfirmService,ResponseData<OrderTask> responseData);
	
	public SysConfirm loadConfirmById(String id);
	
	/**
	 * 更新SysConfirm
	 * @param sysConfirm
	 * @return
	 */
	public int updateSysConfirm(SysConfirm sysConfirm);
	

	/**
	 * 申请查看列表
	 * @param id
	 * @param userId
	 * @param responseData
	 */
	String applyForSeeDetail(String id,String userId,ResponseData<OrderTask> responseData);
	
	/**
	 * 申请接单
	 * @param id
	 * @param userId
	 * @param responseData
	 */
	String applyForTask(String orderId,String userId,Double money,ResponseData<OrderTask> responseData);
	
	/**
	 * 申请提交
	 * @param id
	 * @param userId
	 * @param responseData
	 */
	String applyForSubmit(String orderId,String userId,ResponseData<OrderTask> responseData);
	
	/**
	 * 申请金额
	 * @param id
	 * @param userId
	 * @param responseData
	 */
	String applyForMoney(String orderId,String userId,ResponseData<OrderTask> responseData,Boolean flag);
	
	/**
	 * 申请确认订单
	 * @param orderId
	 * @param userId
	 * @param responseData
	 */
	String applyForConfirm(String orderId,String userId,String type,Double money,ResponseData<OrderTask> responseData,Boolean offlineFlag);
	
	String findLauncherIdByOrderId(String orderId);
	
	/**
	 * 确认流程
	 * @param userId
	 * @param sysConfirmId
	 * @param status
	 * @param remark
	 * @param responseData
	 * @return
	 */
	boolean confirm(String userId,String sysConfirmId,Byte status,String remark,ResponseData<OrderTaskCollection> responseData,String priceList,String orderId,String flag,String iframeFile);
	
	String getCurrentUserStatus(String userId,String orderId);
	
	/**
	 * 查看申请列表
	 * @param orderId
	 * @return
	 */
	List<SysConfirmCollection> loadsysConfirmApplyDetail(String orderId,String userId,ResponseData<SysConfirm> responseData);
	
	/**
	 * 个人申请任务列表
	 * @param userId
	 * @param orderId
	 * @param responseData
	 * @return
	 */
	public List<SysConfirmCollection> loadSysConfirmByUserId(String userId,String orderId,ResponseData<SysConfirmCollection> responseData);
	
	public List<SysConfirmCollection> loadCurrUserSysConfirmList(String userId, OrderTaskCollection orderTask,Boolean flag);
	
	public Map<String, List<SysConfirmCollection>> loadChildSysConfirm(String userId,List<String> orderIds,Boolean flag,TaskFlowStatus taskFlowStatus,Boolean isLauncher);
	
	public List<String> loadOrderIdsByUserId(String userId);

	List<SysConfirmCollection> loadSysConfirmList(List<String> ids, String userId, String status, Boolean isCurrent);
	
	public String getEmailByConfirmId(String confirmId);
}
