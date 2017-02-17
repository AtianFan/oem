package com.cishi.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.SysTradeInfo;
import com.cishi.constant.TradeType;
import com.cishi.dao.SysTradeInfoMapper;
import com.cishi.service.SysTradeInfoService;
import com.cishi.util.TokenGenerator;

@Service("sysTradeInfoService")
public class SysTradeInfoServiceImpl implements SysTradeInfoService {


	@Resource
	public SysTradeInfoMapper sysTradeInfoMapper;
	
	@Override
	public int updateTrade() {
		return 0;
	}

	@Override
	public int addTrade(String userId, Double money,TradeType tradeType,String tradeId) {
		SysTradeInfo sysTradeInfo = new SysTradeInfo();
		sysTradeInfo.setDelFlag((byte)0);
		sysTradeInfo.setId(TokenGenerator.generateKey());
		sysTradeInfo.setStatus((byte)-1);
		sysTradeInfo.setMoney(money);
		sysTradeInfo.setUserId(userId);
		sysTradeInfo.setType(tradeType.getCode());
		sysTradeInfo.setTradeId(tradeId);
		return sysTradeInfoMapper.insert(sysTradeInfo);
	}

}
