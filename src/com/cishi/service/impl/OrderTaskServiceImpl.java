package com.cishi.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cishi.beans.OrderReceiveInfo;
import com.cishi.beans.OrderReceiveInfoExample;
import com.cishi.beans.OrderTask;
import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.OrderTaskExample;
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysUser;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.ConfirmStatus;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.FileType;
import com.cishi.constant.SysConfirmStatus;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.constant.TaskStatus;
import com.cishi.dao.OrderReceiveInfoMapper;
import com.cishi.dao.OrderTaskMapper;
import com.cishi.dao.SysUserMapper;
import com.cishi.global.GlobalSession;
import com.cishi.param.ResponseData;
import com.cishi.service.BaseService;
import com.cishi.service.OrderReceiveInfoService;
import com.cishi.service.OrderReceiveService;
import com.cishi.service.OrderTaskService;
import com.cishi.service.SysConfirmService;
import com.cishi.service.SysFileService;
import com.cishi.service.SysScoreService;
import com.cishi.service.TradeService;
import com.cishi.util.DataToClassUtil;
import com.cishi.util.ResponseUtil;
import com.cishi.util.TokenGenerator;
import com.cishi.view.OrderReceiveView;
import com.cishi.view.OrderTaskView;
import com.cishi.view.PageView;

@Service("orderTaskService")
public class OrderTaskServiceImpl implements OrderTaskService{
	enum OrderTaskDelFlag{
		DEL((byte)1,"正常"),NORMAL((byte)0,"deal");
		private Byte flag;
		private String msg;
		private OrderTaskDelFlag(Byte flag,String msg) {
			this.flag = flag;
			this.msg = msg;
		}
		public Byte getFlag() {
			return flag;
		} 
		public void setFlag(Byte flag) {
			this.flag = flag;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		
	}
	private final static String FILE_START_WIDTH = "order_files_";
	private final static String NO_PARENT_ID="-1";
	private final static Logger logger = Logger.getLogger(OrderTaskServiceImpl.class);
	
	@Resource
	public SysFileService sysFileService;

	@Resource
	public OrderTaskMapper orderTaskMapper;
	
	@Resource
	public OrderReceiveService orderReceiveService;
	
	@Resource
	public SysScoreService sysScoreService;

	@Resource
	public SysConfirmService sysConfirmService;
	
	@Resource
	public OrderReceiveInfoMapper orderReceiveInfoMapper;
	
	@Resource
	public OrderReceiveInfoService orderReceiveInfoService;
	
	@Resource
	public SysUserMapper sysUserMapper;
	
	@Resource
	public TradeService tradeService;
	
	@Resource
	public BaseService baseService;
	
	@Override
	public List<OrderTaskCollection> loadOrderTaskListPage(OrderTaskExample orderTaskExample, PageView page,boolean flag,boolean isParent) {
		orderTaskExample.setOrderByClause(" create_date desc ");
		List<OrderTaskCollection> orderTaskList = null;
		OrderTaskExample.Criteria criteria = orderTaskExample.getCriteriaFirst();
		
		if(isParent){
			criteria.andParentIdEqualTo(NO_PARENT_ID);
		}
		
		
		criteria.andDelFlagEqualTo((byte)0);
		if(flag){
			orderTaskList = orderTaskMapper.selectByExampleByReceiveId(orderTaskExample, page.toRowBounds());
		}else{
			orderTaskList = orderTaskMapper.selectByExampleWithRowbounds(orderTaskExample, page.toRowBounds());
			int i = this.count(orderTaskExample);
			page.setTotal(i);
		}
		return orderTaskList;
	}

	@Override
	public OrderTask addOrderTask(OrderTaskView orderTaskView,ResponseData responseData) {
		Double money = orderTaskView.getMoney();
		String launchId = orderTaskView.getLauncherId();
		if(launchId!=null&&money!=null&&orderTaskView.getParentId()!=null){
			SysUser sysUser = sysUserMapper.selectByPrimaryKey(launchId);
			Double userMoney = sysUser.getMoney();
			Double lockMoney = sysUser.getLockMoney();
			if(userMoney==null){
				userMoney = 0d;
			}
			if(lockMoney==null){
				lockMoney=0d;
			}
			Double useFullMoney = userMoney-lockMoney;
			if(useFullMoney<money){
				responseData.parseErrorCode(ErrorCode.USEFULL_MONEY_IS_NOT_ENOUGH);
				return null;
			}
		}
		orderTaskView.setOrderNumber(TokenGenerator.generateOrderNum());
		OrderTask orderTask = new OrderTask();
		String id = orderTaskView.getId()!=null?orderTaskView.getId():TokenGenerator.generateKey();
		orderTask.setId(id);
		Date now= new Date();
		orderTask.setCreateDate(now);
		orderTask.setLastUpdateDate(now);
		orderTask.setStatus((byte)0);
		copyViewToOrderTask(orderTask, orderTaskView);
		if( orderTaskView.getId()!=null){
			orderTaskMapper.updateByPrimaryKeySelective(orderTask);
		}else{
			orderTaskMapper.insertSelective(orderTask);
		}
		sysFileService.updateFilesOrderId(id,FileType.ORDER_FILE.getId(),orderTaskView.getFileIds());
		sysFileService.delFile(orderTaskView.getDeleteFileIds());
		if(orderTaskView.getMoney()>=0){
			tradeService.lockMoney(launchId, id, money);
		}
		return orderTask;
	}
	
	@Override
	public ResponseData<OrderTask> addOrderTask(OrderTaskView orderTaskView,ResponseData<OrderTask> responseData,String requestList) {
		try{
			orderTaskView.setOrderNumber(TokenGenerator.generateOrderNum());
			OrderTask orderTask = new OrderTask();
			String id = TokenGenerator.generateKey();
			orderTask.setId(id);
			Date now= new Date();
			orderTask.setCreateDate(now);
			orderTask.setLastUpdateDate(now);
			orderTask.setStatus((byte)0);
			copyViewToOrderTask(orderTask, orderTaskView);
			orderTaskMapper.insertSelective(orderTask);
			sysFileService.updateFilesOrderId(id,FileType.ORDER_FILE.getId(),orderTaskView.getFileIds());
			sysFileService.updateFilesOrderId(id,FileType.ORDER_ICON.getId(),orderTaskView.getIconId());
			responseData.parseErrorCode(ErrorCode.SUCCESS);
			responseData.setData(orderTask);
		}catch(Exception e){
			/*responseData.setRetcode(ErrorCode.DATA_BASE_ERROR_CODE.getRetcode());
			responseData.setRetmsg(ErrorCode.DATA_BASE_ERROR_CODE.getRetmsg());*/
			responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
		}
		return responseData;
	}

	public OrderTask copyViewToOrderTask(OrderTask orderTask,OrderTaskView orderTaskView){
		if(orderTask==null){
			return null;
		}
		if(orderTaskView==null){
			return orderTask;
		}
		orderTask.setName(orderTaskView.getName());
		orderTask.setOrderName(orderTaskView.getName());
		orderTask.setIntroduce(orderTaskView.getIntroduce());
		orderTask.setDescription(orderTaskView.getDescription());
		orderTask.setType(orderTaskView.getType());
		orderTask.setRequirements(orderTaskView.getRequirements());
		orderTask.setMoney(orderTaskView.getMoney());
		orderTask.setReceiverId(orderTaskView.getReceiveId());
		orderTask.setLauncherId(orderTaskView.getLauncherId());
		orderTask.setOrderNumber(orderTaskView.getOrderNumber());
//		orderTask.setLauncherId(orderTaskView.getUserId());
		orderTask.setLastUpdateUserid(orderTaskView.getLauncherId());
		orderTask.setIconId(orderTaskView.getIconId());
		orderTask.setParentId(orderTaskView.getParentId());
		orderTask.setOrininMoney(orderTaskView.getMoney());
		return orderTask;
	}

	public List<String> loadFileIds(String requestList){
		Map<String,String> map = DataToClassUtil.parseRequestList(requestList);
		return this.loadFileIds(map);
	}

	public List<String> loadFileIds(Map<String,String> map){
		List<String> list = new ArrayList<String>();
		Iterator<String> iterator = map.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
			if(!key.contains(FILE_START_WIDTH)){
				continue;
			}
			String value = (String)map.get(key);
			list.add(value);
		}
		return list;
	}
	
	@Override
	public int updateTask(OrderTaskView orderTaskView){
		String id = orderTaskView.getId();
		logger.debug("updataTask:id"+id);
		if(id==null){
			return 0;
		}
		OrderTask orderTask = new OrderTask();
		copyViewToOrderTask(orderTask, orderTaskView);
		int i = orderTaskMapper.updateByPrimaryKey(orderTask);
		if(StringUtils.isEmpty(orderTaskView.getDeleteFileIds())){
			sysFileService.delFile(orderTaskView.getDeleteFileIds());
		}
		return i;
	}

	@Override
	public int updateTask(OrderTask orderTask) {
		String id = orderTask.getId();
		logger.debug("updataTask:id"+id);
		if(id==null){
			return 0;
		}
		return orderTaskMapper.updateByPrimaryKey(orderTask);
	}

	@Override
	public int updateTaskStatus(String id, Byte taskStatus) {
		OrderTask orderTask = new OrderTask();
		orderTask.setStatus(taskStatus);
		orderTask.setId(id);
		return orderTaskMapper.updateByPrimaryKeySelective(orderTask);
	}

	
	@Override
	public ResponseData<OrderTask> orderTaskDetail(String orderId,ResponseData<OrderTask> responseData) {
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		if(orderTask!=null){
			responseData.setData(orderTask);
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}else{
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
		}
		return responseData;
	}
	
	
	@Override
	public ResponseData<OrderTaskCollection> orderTaskDetailRefer(String orderId,String userId,
			ResponseData<OrderTaskCollection> responseData) {
		OrderTaskCollection orderTaskCollection = orderTaskMapper.selectReferByPrimaryKey(orderId,userId,TaskFlowStatus.PAY_FOR_MONEY.getCode()+"");
		SysUser sysUser = GlobalSession.get();
		if(orderTaskCollection==null){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
		}
		if(sysUser!=null){
			if( orderTaskCollection.getLauncherId()!=null && orderTaskCollection.getLauncherId().equals(sysUser.getId())){
				orderTaskCollection.setLauncherFlag(true);
			}
			if( orderTaskCollection.getReceiverId()!=null && orderTaskCollection.getReceiverId().equals(sysUser.getId())){
				if(orderTaskCollection.getReceiverStatus()==ConfirmStatus.WAIT.getId()){
					orderTaskCollection.setConfirmStatus(true);
				}
			}
		}
		List<OrderReceiveView> orderReceiveList = orderReceiveService.loadOrderReceiveList(orderId);
		orderTaskCollection.setOrderReceiveList(orderReceiveList);
		List<SysConfirmCollection> sysConfirmCollectionList = sysConfirmService.loadCurrUserSysConfirmList(userId, orderTaskCollection,null);
		Byte currentStatus = 0;
		Byte currentResult = 0;
		for(SysConfirmCollection sysConfirmCollection:sysConfirmCollectionList){
			if(sysConfirmCollection.getIsCurrent()!=null&&sysConfirmCollection.getIsCurrent()&&sysConfirmCollection.getResult()>currentStatus){
				currentStatus = sysConfirmCollection.getType();
				currentResult = sysConfirmCollection.getResult();
			}
		}
		orderTaskCollection.setConfirmResult(currentResult);
		orderTaskCollection.setCurrentStatus(currentStatus);
		orderTaskCollection.setSysConfirmCollectionList(sysConfirmCollectionList);
		List<OrderTask> orderTaskList = this.loadChildren(orderId,userId);
		boolean flag = true;
		for(OrderTask orderTask:orderTaskList){
			byte status = orderTask.getStatus();
			if(status!=TaskStatus.FINISH.getCode()){
				flag = false;
			}
		}
		if(flag && orderTaskCollection!=null &&orderTaskCollection.getStatus()>=2){
			orderTaskCollection.setStatus(TaskStatus.FINISH.getCode());
		}
		orderTaskCollection.setSubTaskList(orderTaskList);
		List<String> list = new ArrayList<>();
		for(OrderTask orderTask:orderTaskList){
			list.add(orderTask.getId());
		}
		if(list.size()>0){
		Map<String,List<SysConfirmCollection>> mapCol = sysConfirmService.loadChildSysConfirm(userId, list, null,null,orderTaskCollection.getLauncherId().equals(userId));
			orderTaskCollection.setSysConfirmMap(mapCol);
		}
		/*List<OrderReceiveInfo> orderReceiveInfoList = orderReceiveInfoService.loadOrderReceiveInfoList(orderId, userId);
		orderTaskCollection.setOrderReceiveInfoList(orderReceiveInfoList);*/
		if(orderTaskCollection!=null){
			responseData.setData(orderTaskCollection);
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}
		return responseData;
	}

	//完成任务，需要双方确认，并且可以发包方进行5分评价
	@Override
	public ResponseData<OrderTask> finshOrderTask(String orderId,String userId,String score, ResponseData<OrderTask> responseData) {
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId,userId,score}, responseData)){
			return responseData; 
		}
		OrderTask orderTask = new OrderTask();
		orderTask.setId(orderId);
		orderTask.setEndTime(new Date());
		//更改任务状态
		orderTask.setStatus(TaskStatus.FINISH.getCode());
		int i = orderTaskMapper.updateByPrimaryKey(orderTask);
		if(i==0){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
		}else{
			responseData.parseErrorCode(ErrorCode.SUCCESS);
			Double sc = null;
			try{
				 sc = Double.valueOf(score);
			}catch(Exception e){
				
			}
			//设置任务完成，添加评分
			if(score!=null){
				int j = sysScoreService.addOrderScore(userId, sc, orderId);
				if(j==0){
					responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
				}
			}
		}
		responseData.setData(orderTask);
		return responseData;
	}

	@Override
	public ResponseData<OrderTask> receive(String orderId,String receiverId,String orderReceiveId,ResponseData<OrderTask> responseData) {
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId,receiverId,orderReceiveId}, responseData)){
			return responseData; 
		}
		OrderTask ot = orderTaskMapper.selectByPrimaryKey(orderId);
		if(ot!=null){
			String launcherId = ot.getLauncherId();
			if(launcherId!=null && launcherId.equals(receiverId)){
				responseData.parseErrorCode(ErrorCode.CAN_NOT_RECEIVE_SELF);
				return responseData;
			}
		}
		OrderTask orderTask = new OrderTask();
		orderTask.setId(orderId);
		orderTask.setOrderReceiverId(orderReceiveId);
		orderTask.setReceiverId(receiverId);
//		orderTask.setStatus();
		orderTask.setReceiverStatus(ConfirmStatus.WAIT.getId());
		int i = orderTaskMapper.updateByPrimaryKeySelective(orderTask);
		if(i==0){
			responseData.parseErrorCode(ErrorCode.ORDER_TASK_ID_CAN_NOT_BE_NULL);
		}else{
			responseData.parseErrorCode(ErrorCode.SUCCESS);
		}
		responseData.setData(orderTask);
		return responseData;
	}

	@Override
	public OrderTask loadOrderTaskById(String orderId) {
		return orderTaskMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public ResponseData<OrderTask> confirmTaskByReceiver(String orderId, String receiverId,String confirmStatus,String remark,ResponseData<OrderTask> responseData) {
		return confirmOrderTask(orderId, receiverId, confirmStatus,remark,true, responseData);
	}

	@Override
	public ResponseData<OrderTask> confirmTaskByLauncher(String orderId, String launchId,
			String confirmStatus,String remark,ResponseData<OrderTask> responseData) {
		
		return confirmOrderTask(orderId, launchId,confirmStatus,remark,false, responseData);
	}
	
	/**
	 * true 表示接包方，false表示发包方
	 * @param orderId
	 * @param userId
	 * @param flag
	 * @return
	 */
	public ResponseData<OrderTask> confirmOrderTask(String orderId,String userId,String confirmStatus,String remark,boolean flag,ResponseData<OrderTask> responseData){
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		if(orderTask==null){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
		}else{
			OrderTask orderTask2 = new OrderTask();
			orderTask2.setId(orderId);
			if(confirmStatus.equals("0")){
				orderTask2.setLauncherStatus((byte)0);
				orderTask2.setReceiverStatus((byte)0);
			}else{
				if(flag){
					orderTask2.setReceiverStatus(ConfirmStatus.CONFIRM_SUCCESS.getId());
				}else{
					orderTask2.setLauncherStatus(ConfirmStatus.CONFIRM_SUCCESS.getId());
				}
			}
			int i = orderTaskMapper.updateByPrimaryKeySelective(orderTask2);
			if(i>0){
				responseData.parseErrorCode(ErrorCode.SUCCESS);
			}else{
				responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
			}
		}
		return responseData;
	}
	
	@Override
	public ResponseData<OrderTaskCollection> recomendTask(ResponseData<OrderTaskCollection> responseData) {
		OrderTaskExample orderTaskExample = new OrderTaskExample();
		OrderTaskExample.Criteria criteria = orderTaskExample.createCriteria();
		criteria.andDelFlagEqualTo((byte)0);
		List<OrderTaskCollection> orderTaskList = orderTaskMapper.selectByExampleWithRowbounds(orderTaskExample,new RowBounds(0,20));
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		responseData.setDataList(orderTaskList);
		return responseData;
	}

	@Override
	public List<OrderTask> loadChildren(String orderId,String userId) {
		OrderTaskExample orderTaskExample = new  OrderTaskExample();
		orderTaskExample.setOrderByClause("create_date desc");
		OrderTaskExample.Criteria criteria = orderTaskExample.createCriteria();
		criteria.andParentIdEqualTo(orderId);
		criteria.andDelFlagEqualTo((byte)0);
		if(userId!=null){
			orderTaskExample.setUserId(userId);
		}
		orderTaskExample.setConfirmType(TaskFlowStatus.FINISH_TASK.getCode());
		List<OrderTask> orderTaskList = orderTaskMapper.selectByExample(orderTaskExample);
		return orderTaskList;
	}

	@Override
	public ResponseData<OrderTask> updateOrderTask(OrderTask orderTask, ResponseData<OrderTask> responseData) {
		orderTaskMapper.updateByPrimaryKeySelective(orderTask);
		return null;
	}

	@Override
	public int count(OrderTaskExample orderTaskExample) {
		return orderTaskMapper.countByExample(orderTaskExample);
	}

	@Override
	public Boolean updateOrderTaskPrice(String orderId,String userId,String sysConfirmId) {
		if(orderId==null || userId==null){
			return false;
		}
		SysUser sysUser = sysUserMapper.selectByPrimaryKey(userId);
		Double money = sysUser.getMoney();
		Double lockMoney = sysUser.getLockMoney();
		OrderReceiveInfoExample orderReceiveInfoExample = new OrderReceiveInfoExample();
		OrderReceiveInfoExample.Criteria criteria = orderReceiveInfoExample.createCriteria();
		if(sysConfirmId!=null){
			criteria.andSysConfirmIdEqualTo(sysConfirmId);
		}else{
			criteria.andReceiverIdEqualTo(userId);
		}
		String sql = "select sum(money) total from order_task where del_flag=0 and parent_id='"+orderId+"'";
		Map map = baseService.queryOne(sql);
		Double totalMoney = (Double)map.get("total");
		if(totalMoney==null){
			totalMoney = 0d;
		}
//		criteria.andOrderIdEqualTo(orderId);
		//TODO need to complete this code
		criteria.andParentOrderIdEqualTo(orderId);
		criteria.andDelFlagEqualTo((byte)0);
		criteria.andIsCurrentEqualTo(true);
		List<OrderReceiveInfo> orderReceiveInfoList = orderReceiveInfoMapper.selectByExample(orderReceiveInfoExample);
		Double yiJiaMoney = 0d;
		for(OrderReceiveInfo orderReceiveInfo:orderReceiveInfoList){
			if(orderReceiveInfo.getMoney()==null){
				continue;
			}
			yiJiaMoney += orderReceiveInfo.getMoney();
		}
		if(money-lockMoney<yiJiaMoney-totalMoney){
			return false;
		}
		for(OrderReceiveInfo orderReceiveInfo:orderReceiveInfoList){
			if(orderReceiveInfo.getMoney()==null){
				continue;
			}
			OrderTask ott = new OrderTask();
			ott.setId(orderReceiveInfo.getOrderId());
			ott.setMoney(orderReceiveInfo.getMoney());
			orderTaskMapper.updateByPrimaryKeySelective(ott);
		}
		return true;
	}

	@Override
	public ResponseData<OrderTask> deleteOrderTask(String orderId,ResponseData<OrderTask> responseData,String userId) {
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		if(orderTask==null){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
			return responseData;
		}
		String parentId = orderTask.getParentId();
		if(!userId.equals(orderTask.getLauncherId())){
			responseData.parseErrorCode(ErrorCode.HAS_NO_AUTHIORITY);
			return responseData;
		}
		if(parentId==null || parentId.equals(NO_PARENT_ID)){
			Byte status = orderTask.getStatus();
			if(status>=TaskStatus.VERITY_SUCCESS.getCode()){
				responseData.parseErrorCode(ErrorCode.CAN_NOT_BE_DELETED_OF_STATUS);
				return responseData;
			}
		}else{
			OrderTask parentOrderTask = orderTaskMapper.selectByPrimaryKey(parentId);
			Byte parentStatus = parentOrderTask.getStatus();
			if(parentStatus>=TaskStatus.VERITY_SUCCESS.getCode()){
				responseData.parseErrorCode(ErrorCode.SON_CAN_NOT_BE_DELETED_OF_STATUS);
				return responseData;
			}
		}
		orderTask.setDelFlag(OrderTaskDelFlag.DEL.getFlag());
		int i = orderTaskMapper.updateByPrimaryKey(orderTask);
		if(i==1){
			responseData.parseErrorCode(ErrorCode.SUCCESS);
			tradeService.unlockMoney(userId, orderId, orderTask.getMoney());
		}else{
			responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
		}
		return responseData;
	}

	@Override
	public String getStartEmailByOrderId(String orderId) {
		return orderTaskMapper.getStartEmailByOrderId(orderId);
	}
	
	

}
