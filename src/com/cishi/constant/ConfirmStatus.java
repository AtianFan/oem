package com.cishi.constant;

public enum ConfirmStatus {

	WAIT((byte)0,""),
	CONFIRM_SUCCESS((byte)1,""),
	CONFORM_FAILED((byte)-1,""),
	AUTO_CANCEL((byte)-2,"取消");
	private Byte id;
	private String name;
	private ConfirmStatus(Byte id, String name) {
		this.id = id;
		this.name = name;
	}
	public Byte getId() {
		return id;
	}
	public void setId(Byte id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
