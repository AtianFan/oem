package com.cishi.constant;

public enum TradeStatus {

	APPLYING((byte)1,"申请中"),
	SUCCESS((byte)2,"成功"),
	FAIL((byte)3,"失败");
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
	private TradeStatus(Byte code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
}
