package com.cishi.system;

import com.cishi.constant.TradeType;

public abstract class AbstractPay {

	/**
	 * 模拟充值
	 * @return
	 */
	public abstract boolean recharge(String userId,Double money);
	
	/**
	 * 模拟提现
	 * @return
	 */
	public abstract boolean withdraw(String userId,Double money);
	
	/**
	 * 成功回掉函数
	 * @param userId
	 * @param money
	 * @param type
	 * @return
	 */
	public abstract boolean success(String userId,Double money,TradeType tradeType);
	
	
	public abstract boolean fail(String userId,Double money,TradeType tradeType);
}