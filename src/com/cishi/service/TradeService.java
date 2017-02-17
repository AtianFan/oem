package com.cishi.service;


public interface TradeService {
	
	//userId用户Id，money充值金额，payType：支付方式，银行名称
	public boolean recharge(String userId,Double money,Byte payType,String payAccount);
	
	public boolean transfer(String fromUserId,String toUserId,Double money);
	
	public boolean unlockMoney(String userId,String orderId,Double money);
	
	public boolean lockMoney(String userId,String orderId,Double money);
	
}
