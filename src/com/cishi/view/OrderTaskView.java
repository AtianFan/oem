package com.cishi.view;

public class OrderTaskView extends BaseView {

	private String id;
	private String name;
	private String description;
	private String introduce;
	private Double money;
	private Byte type;
	private String requirements;
	private String launcherId;
	private String receiveId;
	private String fileIds;
	private String deleteFileIds;
	private String orderNumber;
	private String iconId;
	private String parentId;
	private String childrenIds;
	
	public String getDeleteFileIds() {
		return deleteFileIds;
	}
	public void setDeleteFileIds(String deleteFileIds) {
		this.deleteFileIds = deleteFileIds;
	}
	public String getChildrenIds() {
		return childrenIds;
	}
	public void setChildrenIds(String childrenIds) {
		this.childrenIds = childrenIds;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getIconId() {
		return iconId;
	}
	public void setIconId(String iconId) {
		this.iconId = iconId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getFileIds() {
		return fileIds;
	}
	public void setFileIds(String fileIds) {
		this.fileIds = fileIds;
	}
	public String getLauncherId() {
		return launcherId;
	}
	public void setLauncherId(String launcherId) {
		this.launcherId = launcherId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Double getMoney() {
		return money==null?0:money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Byte getType() {
		return type;
	}
	public void setType(Byte type) {
		this.type = type;
	}
	public String getRequirements() {
		return requirements;
	}
	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	
}
