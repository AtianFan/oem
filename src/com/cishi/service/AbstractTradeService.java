package com.cishi.service;

import com.cishi.constant.TradeType;

public abstract class AbstractTradeService {
	String fromUserId;
	String toUserId;
	Double money;
	TradeType tradeType;
	public String getFromUserId() {
		return fromUserId;
	}


	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}


	public String getToUserId() {
		return toUserId;
	}


	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}


	public Double getMoney() {
		return money;
	}


	public void setMoney(Double money) {
		this.money = money;
	}

	public AbstractTradeService(String fromUserId, String toUserId, Double money,TradeType tradeType) {
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.money = money;
		this.tradeType = tradeType;
	}


	public abstract boolean addPayApply();
	
	public abstract boolean addApplyInfo(boolean flag);
	
	public boolean execute(){
		boolean flag = addPayApply();
		addApplyInfo(flag);
		return false;
	}
}
