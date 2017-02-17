package com.cishi.constant;

public enum SysUserType {

	
	VISITOR((byte)-1,"游客"),
	REGISTER((byte)0,"注册用户"),
	PUBLISHER((byte)1,"任务发布用户"),
	ADMIN((byte)9,"管理员");
	
	private Byte code;
	private String description;
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private SysUserType(Byte code, String description) {
		this.code = code;
		this.description = description;
	}
	
}
