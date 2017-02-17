package com.cishi.service;

import com.cishi.constant.TradeType;

public interface SysTradeInfoService {
	
	int addTrade(String userId,Double money,TradeType tradeType,String tradeId);
	
	int updateTrade();
	
}
