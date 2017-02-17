package com.cishi.constant;

public enum TaskFlowStatus {

	WAIT_FOR_DETAIL((byte)1,"WAIT_FOR_DETAIL"),
	ACCEPT_FOR_TASK((byte)2,"ACCEPT_FOR_TASK"),
	FINISH_TASK((byte)3,"FINISH_TASK"),
	PAY_FOR_MONEY((byte)4,"PAY_FOR_MONEY");
	
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
	private TaskFlowStatus(Byte code, String msg) {
		this.code = code;
		this.msg = msg;
	}
}

