package com.cishi.beans;

import java.util.List;
import java.util.Map;

import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.TaskStatus;
import com.cishi.view.OrderReceiveView;

public class OrderTaskCollection extends OrderTask{

	private List<SysFile> sysFileList;
	private boolean launcherFlag = false;
	private boolean confirmStatus;
	private List<OrderTask> subTaskList;
	private String statusString;
	private Byte orderReceiveStatus;
	private SysConfirmInfo sysConfirmInfo;
	private Byte secPartnerStatus;
	private Byte onePartnerStatus;
	private String partnerId;
	private List<SysConfirmCollection> sysConfirmCollectionList;
	private Map<String,SysConfirmCollection> map;
	private Map<String,List<SysConfirmCollection>> sysConfirmMap;
	private List<OrderReceiveInfo> orderReceiveInfoList;
	private Byte currentStatus;
	private Byte confirmResult;
	private SysFile sysLauncherFile;
	private int total;
	private int complate;
	
/*	@Override
	public Integer getSum() {
		if(this.getSum()==null){
			return 0;
		}
		return this.getSum();
	}*/

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getComplate() {
		return complate;
	}

	public void setComplate(int complate) {
		this.complate = complate;
	}

	public SysFile getSysLauncherFile() {
		return sysLauncherFile;
	}

	public void setSysLauncherFile(SysFile sysLauncherFile) {
		this.sysLauncherFile = sysLauncherFile;
	}

	public List<OrderReceiveInfo> getOrderReceiveInfoList() {
		return orderReceiveInfoList;
	}

	public void setOrderReceiveInfoList(List<OrderReceiveInfo> orderReceiveInfoList) {
		this.orderReceiveInfoList = orderReceiveInfoList;
	}

	public Byte getCurrentStatus() {
		return currentStatus;
	}

	public Map<String, List<SysConfirmCollection>> getSysConfirmMap() {
		return sysConfirmMap;
	}



	public void setSysConfirmMap(Map<String, List<SysConfirmCollection>> sysConfirmMap) {
		this.sysConfirmMap = sysConfirmMap;
	}



	public void setCurrentStatus(Byte currentStatus) {
		this.currentStatus = currentStatus;
	}



	public Byte getConfirmResult() {
		return confirmResult;
	}



	public void setConfirmResult(Byte confirmResult) {
		this.confirmResult = confirmResult;
	}



	public Map<String, SysConfirmCollection> getMap() {
		return map;
	}
	
	

	public void setMap(Map<String, SysConfirmCollection> map) {
		this.map = map;
	}

	public List<SysConfirmCollection> getSysConfirmCollectionList() {
		return sysConfirmCollectionList;
	}

	public void setSysConfirmCollectionList(List<SysConfirmCollection> sysConfirmCollectionList) {
		this.sysConfirmCollectionList = sysConfirmCollectionList;
	}

	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}

	public Byte getSecPartnerStatus() {
		return secPartnerStatus;
	}

	public void setSecPartnerStatus(Byte secPartnerStatus) {
		this.secPartnerStatus = secPartnerStatus;
	}

	public Byte getOnePartnerStatus() {
		return onePartnerStatus;
	}

	public void setOnePartnerStatus(Byte onePartnerStatus) {
		this.onePartnerStatus = onePartnerStatus;
	}

	public SysConfirmInfo getSysConfirmInfo() {
		return sysConfirmInfo;
	}

	public void setSysConfirmInfo(SysConfirmInfo sysConfirmInfo) {
		this.sysConfirmInfo = sysConfirmInfo;
	}

	public Byte getOrderReceiveStatus() {
		return orderReceiveStatus;
	}

	public void setOrderReceiveStatus(Byte orderReceiveStatus) {
		this.orderReceiveStatus = orderReceiveStatus;
	}

	public String getStatusString() {
		return TaskStatus.getTaskStatusName(super.getStatus());
	}

	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}

	public List<OrderTask> getSubTaskList() {
		return subTaskList;
	}

	public void setSubTaskList(List<OrderTask> subTaskList) {
		this.subTaskList = subTaskList;
	}

	public boolean isConfirmStatus() {
		return confirmStatus;
	}

	public void setConfirmStatus(boolean confirmStatus) {
		this.confirmStatus = confirmStatus;
	}

	public boolean isLauncherFlag() {
		return launcherFlag;
	}

	public void setLauncherFlag(boolean launcherFlag) {
		this.launcherFlag = launcherFlag;
	}

	public List<SysFile> getSysFileList() {
		return sysFileList;
	}

	public void setSysFileList(List<SysFile> sysFileList) {
		this.sysFileList = sysFileList;
	}
	
	public List<OrderReceiveView> orderReceiveList;

	public List<OrderReceiveView> getOrderReceiveList() {
		return orderReceiveList;
	}

	public void setOrderReceiveList(List<OrderReceiveView> orderReceiveList) {
		this.orderReceiveList = orderReceiveList;
	}
	
}
