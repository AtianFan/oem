package com.cishi.service.impl;

import javax.annotation.Resource;

import com.cishi.beans.SysAccountDetail;
import com.cishi.constant.TradeType;
import com.cishi.service.AbstractTradeService;

public  class TradeCenterService extends AbstractTradeService {
	
	@Resource
	public SysAccountDetail sysAccountDetail;

	public TradeCenterService(String fromUserId, String toUserId, Double money,TradeType tradeType) {
		super(fromUserId, toUserId, money,tradeType);
	}
	
	@Override
	public boolean addPayApply() {
		return false;
	}

	@Override
	public boolean addApplyInfo(boolean flag) {
		return false;
	}

}
