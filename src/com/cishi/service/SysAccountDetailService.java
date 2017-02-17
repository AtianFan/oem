package com.cishi.service;

import com.cishi.beans.SysAccountDetail;

public interface SysAccountDetailService {
	boolean recharge(String userId,Double money);
	boolean withdraw(String userId,Double money);
	int addRecharge(SysAccountDetail sysAccountDetail);
	
}
