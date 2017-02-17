package com.cishi.system;

import com.cishi.constant.TradeType;

public abstract class BankPay extends AbstractPay {

	@Override
	public boolean recharge(String userId, Double money) {
		// TODO
		boolean flag = false;
		if (flag) {
			this.success(userId, money, TradeType.RECHARGE);
		} else {
			this.fail(userId, money, TradeType.RECHARGE);
		}
		return flag;
	}

	@Override
	public boolean withdraw(String userId, Double money) {
		// TODO
		boolean flag = false;
		if (flag) {
			this.success(userId, money, TradeType.WIDTHDRAW);
		} else {
			this.fail(userId, money, TradeType.WIDTHDRAW);
		}
		return flag;
	}

}
