package com.cishi.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysFile;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.ErrorCode;
import com.cishi.dao.SysFileMapper;
import com.cishi.param.ResponseData;
import com.cishi.service.SysConfirmService;
import com.cishi.util.ResponseUtil;

@Controller
@RequestMapping("/SysConfirm/")
public class SysConfirmController extends BaseController {

	@Resource
	public SysConfirmService sysConfirmService;
	
	@Resource
	public SysFileMapper sysFileMapper;
	
	@ResponseBody
	@RequestMapping(value="loadSysConfirm")
	public ResponseData<SysConfirmCollection> loadSysConfirm(@RequestParam("requestList")String requestList){
		ResponseData<SysConfirmCollection> responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		String userId = this.getCurrentUserId();
		String status = map.get("type");
		String isCurrent = map.get("isCurrent");
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId,status},new String[]{"orderId","status"},responseData)){
			return responseData;
		}
		List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadSysConfirmList(orderId, userId,status, isCurrent==null?null:(isCurrent!=null&&isCurrent.equals("1")?true:false));
		for(SysConfirmCollection sysConfirmCollection:sysConfirmList){
			if(null!=sysConfirmCollection.getIframeFile()&&!"".equals(sysConfirmCollection.getIframeFile())){
				SysFile s = sysFileMapper.selectByPrimaryKey(sysConfirmCollection.getIframeFile());
				sysConfirmCollection.setOriginName(s.getOriginName());
				sysConfirmCollection.setName(s.getName());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				sysConfirmCollection.setDate(sdf.format(s.getCreateDate()));
			}     
		}
		responseData.setDataList(sysConfirmList);
		return responseData;
	}
	@ResponseBody
	@RequestMapping(value="loadSysConfirmByIds")
	public ResponseData<SysConfirmCollection> loadSysConfirmByIds(@RequestParam("requestList")String requestList){
		ResponseData<SysConfirmCollection> responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String orderIds = map.get("orderId");
		String userId = this.getCurrentUserId();
		String status = map.get("type");
		String isCurrent = map.get("isCurrent");
		String[] orderId = orderIds.split(",");
		List<String> ids = Arrays.asList(orderId);
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderIds,status},new String[]{"orderId","status"},responseData)){
			return responseData;
		}
		List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadSysConfirmList(ids, userId,status, isCurrent==null?null:(isCurrent!=null&&isCurrent.equals("1")?true:false));
		responseData.setDataList(sysConfirmList);
		return responseData;
	}
	@ResponseBody
	@RequestMapping(value="loadChildSysConfirm")
	public ResponseData<SysConfirmCollection> loadChildSysConfirm(@RequestParam("requestList")String requestList){
		ResponseData<SysConfirmCollection> responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		String userId = this.getCurrentUserId();
		String status = map.get("type");
		String isCurrent = map.get("isCurrent");
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId},new String[]{"orderId"},responseData)){
			return responseData;
		}
		List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadSysConfirmList(orderId, userId,status,  isCurrent==null?null:(isCurrent!=null&&isCurrent.equals("1")?true:false));
		responseData.setDataList(sysConfirmList);
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value="loadApplyDetailSysConfirmList")
	public ResponseData<SysConfirm> loadSysConfirmApplyDetail(@RequestParam("requestList")String requestList){
		ResponseData responseData = this.getNewResponseData();
		Map<String,String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		String userId = this.getCurrentUserId();
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId},new String[]{"orderId"},responseData)){
			return responseData;
		}
		List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadsysConfirmApplyDetail(orderId,userId,responseData);
		responseData.setDataList(sysConfirmList);
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value = "applyForConfirm", method = RequestMethod.POST)
	public ResponseData<OrderTask> applyForConfirm(@RequestParam("requestList") String requestList) {
		ResponseData responseData = this.getNewResponseData();
		Map<String, String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		String type = map.get("type");
		String remark = map.get("remark");
		String status = map.get("confirmStatus");//0否定 or 1:确定
		String money = map.get("money");
		String sysConfirmId = (String)map.get("sysConfirmId");
		String priceList = map.get("priceList");
		String confirmFlag = map.get("flag");
		
		String iframeFile = map.get("iframeFile");
		
		Byte flag = (status!=null && status.equals("1") )?(byte)1:(byte)-1;
		String userId = this.getCurrentUserId();
		this.setUserId(userId);
		if(type==null){
			type=1+"";
		}
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId,type,remark},new String[]{"orderId","type","remark"},responseData)){
			return responseData;
		}
		if(StringUtils.isEmpty(sysConfirmId)){
			sysConfirmId = sysConfirmService.applyForConfirm(orderId, userId, type,StringUtils.isEmpty(money)?null:Double.valueOf(money),responseData,false);
		}
		sysConfirmService.confirm(userId, sysConfirmId, flag,remark,responseData,priceList,orderId,confirmFlag,iframeFile);
		return responseData;
	}
	
	@RequestMapping(value="loadSysConfirmListByOrderId",method=RequestMethod.POST)
	public ResponseData<SysConfirmCollection> loadSysConfirmListByOrderId(@RequestParam("requestList")String requestList){
		ResponseData<SysConfirmCollection> responseData = this.getNewResponseData();
		String currentUserId = this.getCurrentUserId();
		if(currentUserId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
		}
		Map<String,String> map = this.parseRequestList(requestList);
		String orderId = map.get("orderId");
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{orderId}, new String[]{"orderId"}, responseData)){
			return responseData;
		}
		sysConfirmService.loadSysConfirmByUserId(currentUserId, orderId, responseData);
		return responseData;
	}
	public static void main(String[] args) {
		System.out.println(Double.valueOf(null));
	}
}
