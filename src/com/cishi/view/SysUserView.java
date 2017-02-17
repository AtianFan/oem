package com.cishi.view;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class SysUserView {

	private String loginName;
	private String realName;
	private String address;
	private String nickName;
	private String email;
	private String phoneNumber;
	private String password;
	private String type;
	private String accessToken;
	private String idNo;
	private String id;
	private String company;
	private String accountType;
	private String icon;
	private String iconId;
	private String accountReadonly;
	private Boolean readonlyFlag;
	private String fileIds;
	
	public String getFileIds() {
		return fileIds;
	}
	public void setFileIds(String fileIds) {
		this.fileIds = fileIds;
	}
	public Boolean getReadonlyFlag() {
		return readonlyFlag;
	}
	public void setReadonlyFlag(Boolean readonlyFlag) {
		this.readonlyFlag = readonlyFlag;
	}
	public String getAccountReadonly() {
		return accountReadonly;
	}
	public void setAccountReadonly(String accountReadonly) {
		this.accountReadonly = accountReadonly;
	}
	//	private String 
	public String getIconId() {
		return iconId;
	}
	public void setIconId(String iconId) {
		this.iconId = iconId;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@JsonIgnore
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	
}
