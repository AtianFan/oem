package com.cishi.collection;

import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysUser;

public class SysConfirmCollection extends SysConfirm{

	private SysUser onePartner;
	private SysUser secPartner;
	private String statusString;
	
	private String originName;
	private String date;
	private String name;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStatusString() {
		return statusString;
	}
	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}
	public SysUser getOnePartner() {
		return onePartner;
	}
	public void setOnePartner(SysUser onePartner) {
		this.onePartner = onePartner;
	}
	public SysUser getSecPartner() {
		return secPartner;
	}
	public void setSecPartner(SysUser secPartner) {
		this.secPartner = secPartner;
	}
	
	
}
