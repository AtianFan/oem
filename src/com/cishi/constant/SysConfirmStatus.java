package com.cishi.constant;

public enum SysConfirmStatus {

	FAIL((byte)-1,""),
	SUCCESS((byte)1,""),
	RUNNING((byte)0,"");
	private Byte code;
	private String msg;
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private SysConfirmStatus(Byte code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
}
