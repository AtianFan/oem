package com.cishi.view;

import java.util.Date;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysUser;

public class OrderReceiveView {

	private String receiveId;
	private String orderId;
	private String remark;
	private String id;
	private Date createDate;
	private Double money;
	private SysUser receiver;
	private String receiverId;
	private String orderName;
	private OrderTask orderTask;
	
	public OrderTask getOrderTask() {
		return orderTask;
	}
	public void setOrderTask(OrderTask orderTask) {
		this.orderTask = orderTask;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public SysUser getReceiver() {
		return receiver;
	}
	public void setReceiver(SysUser receiver) {
		this.receiver = receiver;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
}
