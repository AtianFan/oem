package com.cishi.constant;

public enum TradeType {
	RECHARGE((byte)1,"充值"),
	WIDTHDRAW((byte)2,"提现"),
	TRANSFER((byte)3,"转账"),
	IN((byte)4,"入账"),
	OUT((byte)5,"出账");
	private Byte code;
	private String type;
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private TradeType(Byte code, String type) {
		this.code = code;
		this.type = type;
	}
	
}
