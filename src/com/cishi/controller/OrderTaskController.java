package com.cishi.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.OrderTask;
import com.cishi.beans.OrderTaskCollection;
import com.cishi.beans.OrderTaskExample;
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysUser;
import com.cishi.beans.OrderReceiveExample.Criteria;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.constant.TaskStatus;
import com.cishi.param.ResponseData;
import com.cishi.service.OrderTaskService;
import com.cishi.service.OrderTypeService;
import com.cishi.service.SysCompanyService;
import com.cishi.service.SysConfirmService;
import com.cishi.util.DataToClassUtil;
import com.cishi.util.ResponseUtil;
import com.cishi.view.OrderTaskView;
import com.cishi.view.PageView;

@Controller
@RequestMapping("/OrderTask/")
@SuppressWarnings("unchecked")
public class OrderTaskController extends BaseController {

	@Resource
	public OrderTaskService orderTaskService;

	@Resource
	public SysConfirmService sysConfirmService;

	@Resource
	private OrderTypeService orderTypeService;

	@ResponseBody
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public ResponseData<OrderTask> confirmOrderTask(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = parseRequestList(requestList);
		String type = map.get("userType");
		String orderId = map.get("orderId");
		String remark = map.get("remark") == null ? "" : map.get("remark");
		String confirmStatus = map.get("confirmStatus") == null ? "1" : map.get("confirmStatus");
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		if (sysUser == null) {
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		String userId = sysUser.getId();
		if (!ResponseUtil.paramsCanNotBeNull(new String[] { type, orderId }, responseData)) {
			return responseData;
		}
		if (type == null) {
			responseData.parseErrorCode(ErrorCode.PARAMS_ERROR);
		} else {
			if (type.equals("1")) {// 发包方
				orderTaskService.confirmTaskByLauncher(orderId, userId, confirmStatus, remark, responseData);
			} else if (type.equals("2")) {// 接包方确认
				orderTaskService.confirmTaskByReceiver(orderId, userId, confirmStatus, remark, responseData);
			} else {
				responseData.parseErrorCode(ErrorCode.PARAMS_ERROR);
			}
		}
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "addTask", method = RequestMethod.POST)
	public ResponseData<OrderTask> addTask(@RequestParam("requestList") String requestList) {
		String msg = "发起成功";
		ResponseData responseData = this.getNewResponseData();
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		if (sysUser == null || sysUser.getId() == null) {
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		String launcherId = sysUser.getId();
		OrderTaskView orderTaskView = (OrderTaskView) DataToClassUtil.toClassData(requestList, OrderTaskView.class);
		if(orderTaskView.getId()!=null){
			msg = "修改成功";
		}
		orderTaskView.setLauncherId(launcherId);
		OrderTask orderTask = orderTaskService.addOrderTask(orderTaskView, responseData);
		responseData.setData(orderTask);
		responseData.setMsg(msg);
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "loadOrderTask", method = RequestMethod.POST)
	public ResponseData<OrderTaskCollection> loadOrderTask(@RequestParam("requestList") String requestList) {
		boolean isParent = true;
		ResponseData responseData = this.getNewResponseData();
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		String currentUserId = null;
		String type = null;
		if (sysUser != null) {
			currentUserId = sysUser.getId();
			type = sysUser.getType();
		}
		Map<String, String> map = this.parseRequestList(requestList);
		// String type = map.get("type");
		String receiveId = map.get("receiveId");
		String launchId = map.get("launchId");
		String keyWord = map.get("keyWord");
		String userType = "" + (String) map.get("userType");
		String taskType = (String) map.get("taskType");
		String pageType = map.get("pageType");
		String status = (String) map.get("status");
		String complate = ""+map.get("complate");
		String all = ""+map.get("all");
		OrderTaskExample orderTaskExample = null;
		orderTaskExample = new OrderTaskExample();
		orderTaskExample.setUserId(currentUserId);
		orderTaskExample.setDistinct(true);
		OrderTaskExample.Criteria criteria = orderTaskExample.createCriteria();
		if (status != null) {
			if (type != null && type.equals("2") && status.equals("0")) {
				//乙方查询待接收的任务时的场景
				criteria.andStatusEqualTo((byte) 1);
				isParent = false;
			} else if("2".equals(type) && status.equals("1")){
				//已方正在运行的任务
				criteria.andStatusEqualTo((byte) 2);
			}else{
				criteria.andStatusEqualTo(Byte.valueOf(status));
			}
		}
		List<Byte> resultList = orderTypeService.loadOrderTaskByName(keyWord);
		if (!StringUtils.isEmpty(keyWord)) {
			// criteria.andNameLike("%"+keyWord+"%");
			// criteria.andTypeIn(resultList);
			criteria.orNameListIn(keyWord, resultList);
		}
		if (taskType != null) {
			criteria.andTypeEqualTo(Byte.valueOf(taskType));
		}
		//type=2 为接单方 1为发单方
		
		if (sysUser != null && status != null) {
			if (type == null) {
				type = "2";
			}
			if (type != null && type.equals("1")) {
				if (status.equals("0")) {
					criteria.andStatusEqualTo((byte) 0);
				} else if (status.equals("1")) {
					criteria.andStatusGreaterThanOrEqualTo((byte) 0);
				}else if ("2".equals(status)){
					criteria.andChildNotEq();
				}
			} else if (type.equals("2")) {
				if (status.equals("0")) {
					//接单方 待接收任务
					criteria.andReceiverIdIsNull();
				} else if (status.equals("1")) {
					//接单方 正在运行的任务
					criteria.andChildNotEq();
					criteria.andReceiverIdEqualTo(sysUser.getId());
				}
			}
		}
		// 如果状态有相应的条件值，则不再条件中重新增加状态条件的判断，规避查询条件我此条件冲突的场景，比如乙方账户希望查询待接收的任务时，无法查询到结果
		if ((sysUser == null || sysUser.getType() == null || sysUser.getType().equals("2")) && StringUtils.isEmpty(status)) {
			criteria.andStatusGreaterThanOrEqualTo((byte) 1);
		}
		
		//设置接单人
		if (receiveId != null) {
			criteria.andReceiverIdEqualTo(receiveId);
		}
		//设置发单人
		if ((currentUserId != null && type != null && type.equals("1")) || (launchId != null) && (StringUtils.isEmpty(status))) {
			criteria.andLauncherIdEqualTo(currentUserId);
		}
		if(StringUtils.isEmpty(all) || all.equals("1")){
			if(!StringUtils.isEmpty(complate) && complate.equals("1")){
				criteria.andComplateEqualTotal(true);
			}else{
				criteria.andComplateNotEqualTotal(true);
			}
		}
		//已完成
		if("1".equals(complate)){
			criteria.andChildEq();
			criteria.andStatusEqualTo((byte) 2);
		}
		
		
		
		PageView pageView = new PageView();
		List<OrderTaskCollection> orderTaskList = orderTaskService.loadOrderTaskListPage(orderTaskExample, pageView,
				userType != null && userType.equals("3") ? true : false,isParent);
		responseData.setDataList(orderTaskList);
		responseData.setPageView(pageView);
		responseData.setUserId(currentUserId);
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		responseData.setSysUser(sysUser);
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "delOrderTask", method = RequestMethod.POST)
	public ResponseData<OrderTask> delOrderTask(@RequestParam("requestList") String requestList) {
		SysUser sysUser = this.getSessionUser(true);
		Map<String, String> map = this.parseRequestList(requestList);
		ResponseData<OrderTask> responseData = new ResponseData<>();
		if (sysUser != null && StringUtils.isEmpty(sysUser.getId())) {
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		String userId = sysUser.getId();
		String orderId = map.get("orderId");
		if (orderId == null) {
			responseData.parseErrorCode(ErrorCode.ORDER_TASK_ID_CAN_NOT_BE_NULL);
			return responseData;
		}
		orderTaskService.deleteOrderTask(orderId, responseData, userId);
		return responseData;
	}

	/**
	 * 更新任务接口
	 * 
	 * @param requestList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateOrderTask", method = RequestMethod.POST)
	public ResponseData<OrderTask> updateOrderTask(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		OrderTaskView orderTaskView = (OrderTaskView) DataToClassUtil.toClassData(requestList, OrderTaskView.class);
		orderTaskService.updateTask(orderTaskView);
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "updateOrderTaskStatus", method = RequestMethod.POST)
	public ResponseData<OrderTask> updateOrderTaskStatus(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = DataToClassUtil.parseRequestList(requestList);
		String id = map.get("orderTaskId");
		if (id == null) {
			ResponseUtil.parseResponseError(responseData, ErrorCode.ORDER_TASK_ID_CAN_NOT_BE_NULL);
		}
		String status = map.get("orderTaskStatus");
		orderTaskService.updateTaskStatus(id, Byte.valueOf(status));
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "relaseTask", method = RequestMethod.POST)
	public ResponseData<OrderTask> relaseTask(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = DataToClassUtil.parseRequestList(requestList);
		String orderId = map.get("orderId") + "";
		String status = map.get("status") + "";
		if (!ResponseUtil.paramsCanNotBeNull(new String[] { orderId, status }, new String[] { "orderId", "status" },
				responseData)) {
			// ResponseUtil.parseResponseError(this.getResponseData(),
			// ErrorCode.PARAMS_ERROR);
			return responseData;
		}
		if (!status.equals("1")) {
			responseData.parseErrorCode(ErrorCode.PARAMS_ERROR);
		}
		orderTaskService.updateTaskStatus(orderId, Byte.valueOf("1"));
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "orderTaskDetail", method = RequestMethod.POST)
	public ResponseData<OrderTask> orderTaskDetail(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = DataToClassUtil.parseRequestList(requestList);
		String orderId = map.get("orderId");
		session.removeAttribute("RedirectURL");
		String userId = this.getCurrentUserId();
		responseData.setSysUser(this.getSessionUser(true));
		if (orderId == null) {
			responseData.parseErrorCode(ErrorCode.ORDER_TASK_ID_CAN_NOT_BE_NULL);
		} else {
			orderTaskService.orderTaskDetailRefer(orderId, userId, responseData);
		}
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "receive", method = RequestMethod.POST)
	public ResponseData<OrderTask> receive(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = this.parseRequestList(requestList);
		orderTaskService.receive(map.get("orderId"), map.get("receiverId"), map.get("orderReceiveId"), responseData);
		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "finishOrderTask", method = RequestMethod.POST)
	public ResponseData<OrderTask> finishOrderTask(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		String userId = map.get("userId");
		String score = map.get("score");
		orderTaskService.finshOrderTask(orderId, userId, score, responseData);
		return responseData;
	}

}
