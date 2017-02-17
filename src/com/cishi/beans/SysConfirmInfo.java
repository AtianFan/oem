package com.cishi.beans;

public class SysConfirmInfo {
	
	private Byte partnerStatus;
	private String partnerRemark;	
	private String partnerDate;
	private Byte sysConfirmResult;
	private String sysConfirmId;
	private Byte secPartnerStatus;
	private Byte onePartnerStatus;
	private String partnerId;
	
	public Byte getSecPartnerStatus() {
		return secPartnerStatus;
	}
	public void setSecPartnerStatus(Byte secPartnerStatus) {
		this.secPartnerStatus = secPartnerStatus;
	}
	public Byte getOnePartnerStatus() {
		return onePartnerStatus;
	}
	public void setOnePartnerStatus(Byte onePartnerStatus) {
		this.onePartnerStatus = onePartnerStatus;
	}
	public String getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}
	public Byte getPartnerStatus() {
		return partnerStatus;
	}
	public Byte getCurrentStatus() {
		return sysConfirmResult;
	}
	public void setPartnerStatus(Byte partnerStatus) {
		this.partnerStatus = partnerStatus;
	}
	public String getPartnerRemark() {
		return partnerRemark;
	}
	public void setPartnerRemark(String partnerRemark) {
		this.partnerRemark = partnerRemark;
	}
	public String getPartnerDate() {
		return partnerDate;
	}
	public void setPartnerDate(String partnerDate) {
		this.partnerDate = partnerDate;
	}
	public Byte getSysConfirmResult() {
		return sysConfirmResult;
	}
	public void setSysConfirmResult(Byte sysConfirmResult) {
		this.sysConfirmResult = sysConfirmResult;
	}
	public String getSysConfirmId() {
		return sysConfirmId;
	}
	public void setSysConfirmId(String sysConfirmId) {
		this.sysConfirmId = sysConfirmId;
	}
	
}
