package com.cishi.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.SysAccountDetail;
import com.cishi.constant.TradeType;
import com.cishi.dao.SysAccountDetailMapper;
import com.cishi.service.SysAccountDetailService;
import com.cishi.system.BankPay;

@Service("sysAccountDetailService")
public class SysAccountDetailServiceImpl extends BankPay implements SysAccountDetailService{
	
	@Resource
	public SysAccountDetailMapper sysAccountDetailMapper;

	/**
	 * 交易成功
	 * @param userId
	 * @param money
	 * @param tradeType
	 * @return
	 */
	@Override
	public boolean success(String userId, Double money, TradeType tradeType) {
		SysAccountDetail sysAccountDetail = getSysAccountDetail(userId, money, tradeType, (byte)1);
		this.addRecharge(sysAccountDetail);
		return false;
	}

	/**
	 * 交易失败
	 * @param userId
	 * @param money
	 * @param tradeType
	 * @return
	 */
	@Override
	public boolean fail(String userId, Double money, TradeType tradeType) {
		SysAccountDetail sysAccountDetail = getSysAccountDetail(userId, money, tradeType, (byte)0);
		this.addRecharge(sysAccountDetail);
		return false;
	}

	public SysAccountDetail getSysAccountDetail(String userId,Double money,TradeType tradeType,Byte flag){
		SysAccountDetail sysAccountDetail = new SysAccountDetail();
		sysAccountDetail.setCreateDate(new Date());
		sysAccountDetail.setDelFlag((byte)0);
		sysAccountDetail.setMoney(money);
		sysAccountDetail.setType(tradeType.getCode());
		sysAccountDetail.setUserId(userId);
		sysAccountDetail.setStatus(flag);
		return sysAccountDetail;
	}
	
	@Override
	public int addRecharge(SysAccountDetail sysAccountDetail) {
		return sysAccountDetailMapper.insertSelective(sysAccountDetail);
	}

}
