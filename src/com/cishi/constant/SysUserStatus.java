package com.cishi.constant;

public enum SysUserStatus {

	LOGIN((byte)1,"登录"),
	LOGOUT((byte)2,"退出"),
	VALID_SUCCESS((byte)1,"成功"),
	VALID_FAILED((byte)-1,"失败"),
	VALID_ING((byte)0,"待验证");
	private Byte code;
	private String desc;
	
	private SysUserStatus(Byte code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
