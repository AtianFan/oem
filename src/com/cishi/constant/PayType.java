package com.cishi.constant;

public enum PayType {

	BAN1((byte)1,"银行1");
	private Byte code;
	private String name;
	private PayType(Byte code, String name) {
		this.code = code;
		this.name = name;
	}
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
