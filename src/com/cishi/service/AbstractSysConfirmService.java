package com.cishi.service;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysConfirm;

public abstract class AbstractSysConfirmService {
	public abstract void applyConfirmCallback(SysConfirm sysConfirm,OrderTask orderTask);
	
}
