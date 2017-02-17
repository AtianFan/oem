package com.cishi.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cishi.beans.OrderReceiveInfo;
import com.cishi.beans.OrderTask;
import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysConfirmExample;
import com.cishi.beans.SysTradeInfo;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.ConfirmStatus;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.SysConfirmStatus;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.constant.TaskStatus;
import com.cishi.dao.OrderTaskMapper;
import com.cishi.dao.SysConfirmMapper;
import com.cishi.param.ResponseData;
import com.cishi.service.AbstractSysConfirmService;
import com.cishi.service.OrderReceiveInfoService;
import com.cishi.service.OrderReceiveService;
import com.cishi.service.OrderTaskService;
import com.cishi.service.SysAccountDetailService;
import com.cishi.service.SysConfirmService;
import com.cishi.service.SysTradeInfoService;
import com.cishi.service.TradeService;
import com.cishi.util.JacksonUtil;
import com.cishi.util.ResponseUtil;
import com.cishi.util.SendEmailUtils;
import com.cishi.util.TokenGenerator;
import com.cishi.view.OrderReceiveView;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * SysConfirm添加字段create_date(创建日期，current是否是当前字段，result处理结果（未完成，完成，废弃）)
 * 
 * @author tao
 *
 */
@Service("sysConfirmService")
public class SysConfirmServiceImpl implements SysConfirmService {

	@Resource
	public OrderTaskService orderTaskService;

	@Resource
	public OrderReceiveService orderReceiveService;

	@Resource
	public SysConfirmMapper sysConfirmMapper;

	@Resource
	public OrderTaskMapper orderTaskMapper;
	
	@Resource
	public OrderReceiveInfoService orderReceiveInfoService;
	
	@Resource
	public TradeService tradeService;
	
	@Override
	public int addConfirm(SysConfirm sysConfirm) {
		return sysConfirmMapper.insertSelective(sysConfirm);
	}

	@Deprecated
	@Override
	public boolean confirm(boolean flag, Byte confirmStatus, String remark, String confirmId) {
		SysConfirm sysConfirm = new SysConfirm();
		sysConfirm.setId(confirmId);
		if (flag) {
			sysConfirm.setOnePartnerDate(new Date());
			sysConfirm.setOnePartnerStatus(confirmStatus);
			sysConfirm.setOnPartnerRemark(remark);
		} else {
			sysConfirm.setSecPartnerDate(new Date());
			sysConfirm.setSecPartnerStatus(confirmStatus);
			sysConfirm.setSecPartnerRemark(remark);
		}
		return sysConfirmMapper.updateByPrimaryKey(sysConfirm) > 1 ? true : false;
	}

	@Override
	public List<SysConfirmCollection> loadSysConfirmList(String orderId, Byte status, Boolean isCurrent) {
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andDelFlagEqualTo((byte) 0);
		if (status == null) {
			criteria.andOrderStatusEqualTo((byte) 0);
		}
		if (isCurrent == null) {
			criteria.andIsCurrentEqualTo(isCurrent);
		}
		List<SysConfirmCollection> sysConfirmList = sysConfirmMapper.selectByExample(sysConfirmExample);
		return sysConfirmList;
	}

	@Override
	public int deprecatedSysConfirm(String id) {
		SysConfirm sysConfirm = new SysConfirm();
		sysConfirm.setId(id);
		sysConfirm.setIsCurrent(false);
		return sysConfirmMapper.updateByPrimaryKeySelective(sysConfirm);
	}

	
	
	@Override
	public List<SysConfirmCollection> loadSysConfirmList(String orderId, Byte status, Boolean isCurrent,
			String userId) {
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		sysConfirmExample.setOrderByClause("create_date desc");
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		if(userId!=null)criteria.andSecPartnerIdEqualTo(userId);
		criteria.andDelFlagEqualTo((byte)0);
		if(criteria!=null)criteria.andIsCurrentEqualTo(isCurrent);
		if(status!=null)criteria.andTypeEqualTo(status);
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	@Override
	public int addSysConfirmAndDeprecated(SysConfirm sysConfirm, Boolean flag) {
		String onePartner = sysConfirm.getOnePartnerId();
		String secondParnter = sysConfirm.getSecPartnerId();
		String orderId = sysConfirm.getOrderId();
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andOnePartnerIdEqualTo(onePartner);
		criteria.andSecPartnerIdEqualTo(secondParnter);
		criteria.andOrderIdEqualTo(orderId);
		criteria.andIsCurrentEqualTo(true);
		List<SysConfirmCollection> sysConfirmList = sysConfirmMapper.selectByExample(sysConfirmExample);
		if (sysConfirmList != null && sysConfirmList.size() > 0) {
			SysConfirmCollection sysConfirm2 = sysConfirmList.get(0);
			sysConfirm2.setIsCurrent(false);
			sysConfirm2.setResult(SysConfirmStatus.FAIL.getCode());
			sysConfirmMapper.updateByPrimaryKey(sysConfirm2);
		}
		return this.addConfirm(sysConfirm);
	}

	@Override
	public String applySysConfirm(String orderId, Double money, String userId,
			TaskFlowStatus taskFlowStatus, Byte type, AbstractSysConfirmService abstractSysConfirmService,ResponseData<OrderTask> responseData) {
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		if(orderTask==null){
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
		}
		String launcherId = orderTask.getLauncherId();
		String sysConfirmId = TokenGenerator.generateKey();
		SysConfirm sysConfirm = new SysConfirm();
		sysConfirm.setCreateDate(new Date());
		sysConfirm.setId(sysConfirmId);
		sysConfirm.setOrderId(orderId);
		sysConfirm.setResult(SysConfirmStatus.RUNNING.getCode());
		sysConfirm.setOrderStatus(orderTask.getStatus());
		sysConfirm.setOnePartnerId(launcherId);
		sysConfirm.setSecPartnerId(userId);
		sysConfirm.setIsCurrent(true);
		sysConfirm.setType(type);
		if (money != null) {
			sysConfirm.setMoney(money);
		}
		this.addConfirm(sysConfirm);
		abstractSysConfirmService.applyConfirmCallback(sysConfirm,orderTask);
		return sysConfirmId;
	}

	@Override
	public SysConfirm loadConfirmById(String id) {
		return sysConfirmMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSysConfirm(SysConfirm sysConfirm) {
		return sysConfirmMapper.updateByPrimaryKeySelective(sysConfirm);
	}

	@Override
	public List<SysConfirmCollection> loadSysConfirmList(String orderId, String userId, String type,
			Boolean isCurrent) {
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		String launcherId = orderTask.getLauncherId();
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		sysConfirmExample.setOrderByClause("create_date desc");
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		criteria.andDelFlagEqualTo((byte)0);
		if (isCurrent != null)
			criteria.andIsCurrentEqualTo(isCurrent);
		if (type != null)
			criteria.andTypeEqualTo(Byte.valueOf(type));
		if (orderId != null)
			criteria.andOrderIdEqualTo(orderId);
		if (launcherId != null && launcherId.equals(userId)) {
			criteria.andOnePartnerIdEqualTo(userId);
		} else {
			criteria.andSecPartnerIdEqualTo(userId);
		}
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	@Override
	public String applyForSeeDetail(String orderId, String userId, ResponseData<OrderTask> responseData) {
		if (!ResponseUtil.paramsCanNotBeNull(new String[] { orderId, userId }, new String[] { "orderId", "userId" },
				responseData)) {
			return null;
		}
		String confirmId =  applySysConfirm(orderId, null, userId, TaskFlowStatus.WAIT_FOR_DETAIL,
				TaskFlowStatus.WAIT_FOR_DETAIL.getCode(), new AbstractSysConfirmService() {
					@Override
					public void applyConfirmCallback(SysConfirm sysConfirm,OrderTask orderTask) {

					}
				},responseData);
		String startEmail=orderTaskService.getStartEmailByOrderId(orderId);
		OrderTask orderTask=orderTaskService.loadOrderTaskById(orderId);
		if(null!=startEmail&& !"".equals(startEmail)){
			//发送申请查看任务详情
			SendEmailUtils.sendEmail(startEmail, "申请查看任务详情,项目名称:"+orderTask.getOrderName());
		}
		return confirmId;
	}

	@Override
	public String applyForTask(String orderId, String userId, Double money, ResponseData<OrderTask> responseData) {
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		String launcherId = orderTask.getLauncherId();
		String receiverId = orderTask.getReceiverId();
		if (launcherId == null) {
			responseData.parseErrorCode(ErrorCode.DATA_BASE_ERROR_CODE);
			return null;
		}
		if (receiverId != null) {
			responseData.parseErrorCode(ErrorCode.ORDER_TASK_HAS_BEEN_RECEIVE);
			return null;
		}
		// if()
		if (!ResponseUtil.paramsCanNotBeNull(new String[] { orderId, userId }, new String[] { "orderId", "userId" },
				responseData)) {
			return null;
		}
		String sysConfirmId = applySysConfirm(orderId, money, userId,
				TaskFlowStatus.ACCEPT_FOR_TASK, TaskFlowStatus.ACCEPT_FOR_TASK.getCode(),
				new AbstractSysConfirmService() {

					@Override
					public void applyConfirmCallback(SysConfirm sysConfirm,OrderTask orderTask) {
					}
				},responseData);
		String startEmail=orderTaskService.getStartEmailByOrderId(orderId);
		
		if(null!=startEmail&& !"".equals(startEmail)){
			//发送申请查看任务详情
			SendEmailUtils.sendEmail(startEmail, "申请接单,项目名称:"+orderTask.getOrderName());
		}
		return sysConfirmId;
	}

	@Override
	public String applyForSubmit(String orderId, String userId, ResponseData<OrderTask> responseData) {
		String sysConfirmId = applySysConfirm(orderId, null, userId,TaskFlowStatus.FINISH_TASK,
				TaskFlowStatus.FINISH_TASK.getCode(),new AbstractSysConfirmService() {
					@Override
					public void applyConfirmCallback(SysConfirm sysConfirm,OrderTask orderTask) {
					}
				},responseData);
		String startEmail=orderTaskService.getStartEmailByOrderId(orderId);
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		if(null!=startEmail&& !"".equals(startEmail)){
			//发送申请查看任务详情
			SendEmailUtils.sendEmail(startEmail, "提交任务,项目名称:"+orderTask.getOrderName());
		}
		return sysConfirmId;
		
	}

	@Override
	public String applyForMoney(String orderId, String userId, ResponseData<OrderTask> responseData,Boolean flag) {
		String sysConfirmId = applySysConfirm(orderId, null, userId, TaskFlowStatus.PAY_FOR_MONEY,
				TaskFlowStatus.PAY_FOR_MONEY.getCode(),new AbstractSysConfirmService() {
					@Override
					public void applyConfirmCallback(SysConfirm sysConfirm,OrderTask orderTask) {
					}
				},responseData);
		String startEmail=orderTaskService.getStartEmailByOrderId(orderId);
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		if(null!=startEmail&& !"".equals(startEmail)){
			//发送申请查看任务详情
			SendEmailUtils.sendEmail(startEmail, "申请付款,项目名称:"+orderTask.getOrderName());
		}
		return sysConfirmId;
	}

	@Override
	public String findLauncherIdByOrderId(String orderId) {
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		return orderTask != null ? orderTask.getLauncherId() : null;
	}

	@Override
	public String applyForConfirm(String orderId, String userId, String type, Double money,
			ResponseData<OrderTask> responseData,Boolean flag) {
		String sysConfirmId = null;
		switch (type) {
		case "1":
			sysConfirmId = applyForSeeDetail(orderId, userId, responseData);
			break;
		case "2":
			sysConfirmId = applyForTask(orderId, userId, money, responseData);
			break;
		case "3":
			sysConfirmId = applyForSubmit(orderId, userId, responseData);
			break;
		case "4":
			sysConfirmId = applyForMoney(orderId, userId, responseData,flag);
			break;
		default:
			responseData.parseErrorCode(ErrorCode.DONE_NOTHING);
			break;
		}
		return sysConfirmId;
	}

	@Override
	public boolean confirm(String userId, String sysConfirmId, Byte status, String remark,
			ResponseData<OrderTaskCollection> responseData,String priceList,String pOrderId,String confirmFlag,String iframeFile) {
		SysConfirm sysConfirm = loadConfirmById(sysConfirmId);
		String onePartnerId = sysConfirm.getOnePartnerId();
		String secPartnerId = sysConfirm.getSecPartnerId();
		String orderId = sysConfirm.getOrderId();
		OrderTask orderTask = orderTaskMapper.selectByPrimaryKey(orderId);
		if (onePartnerId.equals(userId)) {
			sysConfirm.setOnePartnerStatus(status);
			sysConfirm.setOnPartnerRemark(remark);
			sysConfirm.setOnePartnerDate(new Date());
			//申请被拒绝
			String email = this.getEmailByConfirmId(sysConfirmId);
			if(null!=email&&!"".equals(email)){
				SendEmailUtils.sendEmail(email, remark+",项目名称:"+orderTask.getOrderName());
			}
		} else if (secPartnerId.equals(userId)) {
			sysConfirm.setSecPartnerStatus(status);
			sysConfirm.setSecPartnerRemark(remark);
			sysConfirm.setSecPartnerDate(new Date());
			if(sysConfirm.getSecPartnerStatus()==ConfirmStatus.CONFIRM_SUCCESS.getId()){
				ObjectMapper mapper = new ObjectMapper(); 
				JavaType javaType = JacksonUtil.getCollectionType(ArrayList.class, OrderReceiveInfo.class);
				try {
					List<OrderReceiveInfo> list =  (List<OrderReceiveInfo>)mapper.readValue(priceList, javaType);
					orderReceiveInfoService.addBatchReceiveInfoList(list,userId,pOrderId,sysConfirmId);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		if ((sysConfirm.getOnePartnerStatus() != null && sysConfirm.getOnePartnerStatus() == -1)
				|| (sysConfirm.getSecPartnerStatus() != null && sysConfirm.getSecPartnerStatus() == -1)) {
			sysConfirm.setResult(SysConfirmStatus.FAIL.getCode());
			sysConfirm.setIsCurrent(false);
		}
		if ((sysConfirm.getOnePartnerStatus() != null && sysConfirm.getOnePartnerStatus() == 1)
				&& (sysConfirm.getSecPartnerStatus() != null && sysConfirm.getSecPartnerStatus() == 1)) {
			sysConfirm.setResult(SysConfirmStatus.SUCCESS.getCode());
			// 如果是申请任务，则任务申请成功之后，则会将生成订单，并且会保存在任务信息里面。
			
			if (sysConfirm.getType() == TaskFlowStatus.ACCEPT_FOR_TASK.getCode()) {
				/*tradeService.unlockMoney(userId, orderId, orderTask.getMoney());
				boolean flag = tradeService.lockMoney(userId, orderId, sysConfirm.getMoney());
				if(!flag){
					
					return false;
				}*/
				//如果同意则更新任务列表
				boolean flag = orderTaskService.updateOrderTaskPrice(pOrderId, userId,sysConfirmId);
				if(!flag){
					responseData.parseErrorCode(ErrorCode.USEFULL_MONEY_IS_NOT_ENOUGH_YIJIA);
					return false;
				}
				String orderReceiveId = TokenGenerator.generateKey();
				OrderReceiveView orderReceiveView = new OrderReceiveView();
				orderReceiveView.setOrderId(sysConfirm.getOrderId());
				orderReceiveView.setReceiverId(secPartnerId);
				orderReceiveView.setMoney(sysConfirm.getMoney());
				orderReceiveView.setCreateDate(new Date());
				orderReceiveView.setId(orderReceiveId);
				orderReceiveService.addOrderReceive(orderReceiveView);
				orderTask.setReceiverId(secPartnerId);
				orderTask.setOrderReceiverId(orderReceiveId);
				orderTask.setStatus(TaskFlowStatus.ACCEPT_FOR_TASK.getCode());
				orderTaskMapper.updateByPrimaryKeySelective(orderTask);
				SysConfirmExample example = new SysConfirmExample();
				SysConfirmExample.Criteria criteria = example.createCriteria();
				criteria.andIdNotEqualTo(sysConfirm.getId());
				criteria.andResultEqualTo((byte) 0);
				SysConfirm updateSysConfirm = new SysConfirm();
				updateSysConfirm.setResult(ConfirmStatus.AUTO_CANCEL.getId());
				//更新确认信息
				sysConfirmMapper.updateByExampleSelective(updateSysConfirm, example);
				//同意申请
				//申请被拒绝
				String email = this.getEmailByConfirmId(sysConfirmId);
				if(null!=email&&!"".equals(email)){
					SendEmailUtils.sendEmail(email, "同意申请,项目名称:"+orderTask.getOrderName());
				}
			}
			//任务完成需要付款
			if(sysConfirm.getType() ==  TaskFlowStatus.FINISH_TASK.getCode()){
				if(StringUtils.isEmpty(confirmFlag)){
					boolean flag = tradeService.transfer(onePartnerId, secPartnerId, orderTask.getMoney());
					if(!flag){
						sysConfirm.setResult((byte)-1);
						sysConfirm.setOnPartnerRemark(remark+"[系统失败,发包方余额不足]");
						sysConfirm.setIsCurrent(false);
					}
				}else{
					tradeService.unlockMoney(onePartnerId, orderId, orderTask.getOrininMoney());
				}
			}
			if(sysConfirm.getType()==TaskFlowStatus.PAY_FOR_MONEY.getCode()){
				Byte onStatus = sysConfirm.getOnePartnerStatus(),secStatus = sysConfirm.getSecPartnerStatus();
				if(onStatus==1 && secStatus==1){
					OrderTask orderTaskTmp = new OrderTask();
					orderTaskTmp.setStatus(TaskStatus.FINISH.getCode());
					orderTaskTmp.setId(orderId);
					orderTaskMapper.updateByPrimaryKeySelective(orderTaskTmp);
					
				}
				
			}
		}
		if(null!=iframeFile&&!"".equals(iframeFile)){
			OrderTask orderTask1 = new OrderTask();  
			orderTask1.setId(orderId);
			orderTask1.setAtt_id(iframeFile);
			orderTaskMapper.updateByPrimaryKeySelective(orderTask1);
		}
		int i = updateSysConfirm(sysConfirm);
		if (i <= 0) {
			responseData.parseErrorCode(ErrorCode.NO_RESULT_UPDATE);
			return false;
		}
		return true;
	}

	@Override
	public String getCurrentUserStatus(String userId, String orderId) {
		return null;
	}

	@Override
	public List<SysConfirmCollection> loadsysConfirmApplyDetail(String orderId, String userId,
			ResponseData<SysConfirm> responseData) {
		String launcherId = findLauncherIdByOrderId(orderId);
		if (userId == null || (launcherId == null || !launcherId.equals(userId))) {
			responseData.parseErrorCode(ErrorCode.LOGIN_USER_NOT_EQUAL_TASK_LAUNCHERID);
			return null;
		}
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		sysConfirmExample.setDistinct(true);
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andDelFlagEqualTo((byte) 0);
		criteria.andIsCurrentEqualTo(true);
		criteria.andOnePartnerIdEqualTo(userId);
		criteria.andOrderIdEqualTo(orderId);
		criteria.andSecPartnerStatusEqualTo(ConfirmStatus.CONFIRM_SUCCESS.getId());
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	@Override
	public List<SysConfirmCollection> loadSysConfirmByUserId(String userId, String orderId,
			ResponseData<SysConfirmCollection> responseData) {
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		if (orderTask == null && responseData!=null) {
			responseData.parseErrorCode(ErrorCode.CAN_NOT_FIND_OREDR_BY_ID);
			return null;
		}
		String launcherId = orderTask.getId();
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		if (launcherId.equals(userId)) {
			criteria.andOnePartnerIdEqualTo(userId);
		} else {
			criteria.andSecPartnerIdEqualTo(userId);
		}
		criteria.andIsCurrentEqualTo(true);
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	@Override
	public List<SysConfirmCollection> loadCurrUserSysConfirmList(String userId, OrderTaskCollection orderTask,
			Boolean flag) {
		String launcherId = orderTask.getId();
		String orderId = orderTask.getId();
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		if (launcherId.equals(userId)) {
			criteria.andOnePartnerIdEqualTo(userId);
		} else {
			criteria.andSecPartnerIdEqualTo(userId);
		}
		if (flag != null)
			criteria.andIsCurrentEqualTo(flag);
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	@Override
	public Map<String, List<SysConfirmCollection>> loadChildSysConfirm(String userId, List<String> orderIds,
			Boolean flag,TaskFlowStatus taskFlowStatus,Boolean isLauncher) {
		SysConfirmExample example = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdIn(orderIds);
		if(isLauncher){
			criteria.andOnePartnerIdEqualTo(userId);
		}else{
			criteria.andSecPartnerIdEqualTo(userId);
		}
		if(flag!=null){
			criteria.andIsCurrentEqualTo(flag);
		}
		if(taskFlowStatus!=null)criteria.andTypeEqualTo(taskFlowStatus.getCode());
		List<SysConfirmCollection> list = sysConfirmMapper.selectByExample(example);
		Map<String,List<SysConfirmCollection>> map = new HashMap<>();
		for(SysConfirmCollection sysConfirmCollection:list){
			String orderId = sysConfirmCollection.getOrderId();
			List<SysConfirmCollection> sysList= map.get(orderId);
			if(sysList==null){
				sysList = new ArrayList<>();
				map.put(orderId, sysList);
			}
			sysList.add(sysConfirmCollection);
		}
		return map;
	}

	@Override
	public List<String> loadOrderIdsByUserId(String userId) {
		SysConfirmExample example = new SysConfirmExample();
		SysConfirmExample.Criteria criteria = example.createCriteria();
		criteria.andSecPartnerIdEqualTo(userId);
		criteria.andDelFlagEqualTo((byte)0);
		criteria.andIsCurrentEqualTo(true);
		criteria.andResultEqualTo((byte)0);
		List<SysConfirmCollection> sysConfirms = sysConfirmMapper.selectByExample(example);
		List<String> sList = new ArrayList<>();
		for(SysConfirmCollection sysConfirmCollection:sysConfirms){
			sList.add(sysConfirmCollection.getOrderId());
		}
		return sList;
	}

	@Override
	public List<SysConfirmCollection> loadSysConfirmList(List<String> ids, String userId, String type,
			Boolean isCurrent) {
//		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
//		String launcherId = orderTask.getLauncherId();
		SysConfirmExample sysConfirmExample = new SysConfirmExample();
		sysConfirmExample.setOrderByClause("create_date desc");
		SysConfirmExample.Criteria criteria = sysConfirmExample.createCriteria();
		criteria.andOrderIdNotIn(ids);
		if (isCurrent != null)
			criteria.andIsCurrentEqualTo(isCurrent);
		if (type != null)
			criteria.andTypeEqualTo(Byte.valueOf(type));
		/*if (orderId != null)
			criteria.andOrderIdEqualTo(orderId);*/
		/*if (launcherId != null && launcherId.equals(userId)) {
			criteria.andOnePartnerIdEqualTo(userId);
		} else {*/
		criteria.andSecPartnerIdEqualTo(userId);
//		}
		return sysConfirmMapper.selectByExample(sysConfirmExample);
	}

	
	@Override
	public String getEmailByConfirmId(String confirmId) {
		return sysConfirmMapper.getEmailByConfirmId(confirmId);
	}
}
