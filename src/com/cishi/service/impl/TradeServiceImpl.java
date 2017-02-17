package com.cishi.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.SysAccountDetail;
import com.cishi.beans.SysMoneyLockHistroy;
import com.cishi.beans.SysUser;
import com.cishi.constant.PayType;
import com.cishi.constant.TradeStatus;
import com.cishi.constant.TradeType;
import com.cishi.dao.SysAccountDetailMapper;
import com.cishi.dao.SysMoneyLockHistroyMapper;
import com.cishi.dao.SysUserMapper;
import com.cishi.service.SysTradeInfoService;
import com.cishi.service.SysUserService;
import com.cishi.service.TradeService;
import com.cishi.util.TokenGenerator;

@Service("tradeService")
public class TradeServiceImpl implements TradeService{
	
	@Resource
	public SysAccountDetailMapper sysAccountDetailMapper;
	
	@Resource
	public SysUserMapper sysUserMapper;
	
	@Resource
	public SysUserService sysUserService;
	
	@Resource
	public SysTradeInfoService sysTradeInfoService;
	
	@Resource
	public SysMoneyLockHistroyMapper sysMoneyLockHistroyMapper;

	@Override
	public boolean recharge(String userId, Double money,Byte payType,String payAccount) {
		TradeStatus tradeStatus = TradeStatus.APPLYING;
		String tradeId = TokenGenerator.generateKey();
		if(!payMoneyBank(userId, money)){
			tradeStatus = tradeStatus.FAIL;
		}else{
			tradeStatus = tradeStatus.SUCCESS;
		}
		//更新当前用户的充值金额
		SysUser sysUser = sysUserService.loadSysUserById(userId);
		SysUser sysUserDesc = new SysUser();
		Double originMoney = sysUser.getMoney()==null?0:sysUser.getMoney();
		sysUserDesc.setId(sysUser.getId());
		sysUserDesc.setMoney(money+originMoney);
		sysUserService.updateSysUserByPrimaryKeySelective(sysUserDesc);
		//设置当前用户的充值明细
		SysAccountDetail sysAccountDetail = new SysAccountDetail();
		sysAccountDetail.setType(TradeType.RECHARGE.getCode());
		sysAccountDetail.setMoney(money);
		sysAccountDetail.setCreateDate(new Date());
		sysAccountDetail.setDelFlag((byte)0);
		sysAccountDetail.setReceiverId(userId);
		sysAccountDetail.setStatus(tradeStatus.getCode());
		sysAccountDetail.setPayType(payType);
		sysAccountDetail.setId(tradeId);
		sysAccountDetail.setAccount(payAccount);
		sysAccountDetailMapper.insert(sysAccountDetail);
		sysTradeInfoService.addTrade(userId, money, TradeType.IN, tradeId);
		return true;
	}

	@Override
	public boolean transfer(String fromUserId, String toUserId, Double money) {
		boolean flag = false;
		SysUser fromSysUser = sysUserService.loadSysUserById(fromUserId);
		String tradeId = TokenGenerator.generateKey();
		TradeStatus tradeStatus = TradeStatus.APPLYING;
		Double fromUserMoney = fromSysUser.getMoney();
		Double lockMoney = fromSysUser.getLockMoney();
		if(fromUserMoney==null || fromUserMoney<money){
			tradeStatus = TradeStatus.FAIL;
			flag = false;
		}else{
			//更新付款方信息
			Double lastFromMoney = fromUserMoney-money;
			Double lasLockMoney = lockMoney-money;
			if(lastFromMoney>0){
				tradeStatus = TradeStatus.SUCCESS;
				flag = true;
				SysUser fromSysUserDesc = new SysUser();
				fromSysUserDesc.setId(fromUserId);
				fromSysUserDesc.setMoney(lastFromMoney);
				fromSysUserDesc.setLockMoney(lasLockMoney);//取消锁定金额
				sysUserService.updateSysUserByPrimaryKeySelective(fromSysUserDesc);
				SysUser toSysUser = sysUserService.loadSysUserById(toUserId);
				Double toUserMoney = toSysUser.getMoney()==null?0:toSysUser.getMoney();
				//更新收款方信息
				SysUser toSysUserDesc = new SysUser();
				Double lastToMoney = toUserMoney + money;
				toSysUserDesc.setId(toUserId);
				toSysUserDesc.setMoney(lastToMoney);
				sysUserService.updateSysUserByPrimaryKeySelective(toSysUserDesc);
			}
		}
		//if(sysUser.get)
		SysAccountDetail sysAccountDetail = new SysAccountDetail();
		sysAccountDetail.setType(tradeStatus.getCode());
		sysAccountDetail.setMoney(money);
		sysAccountDetail.setCreateDate(new Date());
		sysAccountDetail.setDelFlag((byte)0);
		sysAccountDetail.setReceiverId(toUserId);
		sysAccountDetail.setUserId(fromUserId);
		sysAccountDetail.setStatus(tradeStatus.getCode());
		sysAccountDetail.setId(tradeId);
		sysAccountDetailMapper.insert(sysAccountDetail);
		return flag;
	}

	public boolean payMoneyBank(String userId,Double money){
		return true;
	}

	@Override
	public boolean unlockMoney(String userId, String orderId, Double money) {
		SysMoneyLockHistroy sysMoneyLockHistroy = new SysMoneyLockHistroy();
		sysMoneyLockHistroy.setDelFlag(false);
		sysMoneyLockHistroy.setCreateDate(new Date());
		sysMoneyLockHistroy.setOrderId(orderId);
		sysMoneyLockHistroy.setUserId(userId);
		sysMoneyLockHistroy.setType((byte)0);
		sysMoneyLockHistroy.setId(TokenGenerator.generateKey());
		sysMoneyLockHistroyMapper.insertSelective(sysMoneyLockHistroy);
		SysUser sysUser = sysUserService.loadSysUserById(userId);
		Double lockMoney = sysUser.getLockMoney();
		if(lockMoney==null){
			lockMoney = 0d;
		}
		if(money==null){
			money = 0d;
		}
		lockMoney-=money;
		sysUser.setLockMoney(lockMoney);
		sysUserService.updateSysUserByPrimaryKeySelective(sysUser);
		return true;
	}

	@Override
	public boolean lockMoney(String userId, String orderId, Double money) {
		SysMoneyLockHistroy sysMoneyLockHistroy = new SysMoneyLockHistroy();
		sysMoneyLockHistroy.setDelFlag(false);
		sysMoneyLockHistroy.setCreateDate(new Date());
		sysMoneyLockHistroy.setOrderId(orderId);
		sysMoneyLockHistroy.setUserId(userId);
		sysMoneyLockHistroy.setType((byte)1);
		sysMoneyLockHistroy.setId(TokenGenerator.generateKey());
		sysMoneyLockHistroyMapper.insertSelective(sysMoneyLockHistroy);
		SysUser sysUser = sysUserService.loadSysUserById(userId);
		Double userMoney = sysUser.getMoney();
		Double lockMoney = sysUser.getLockMoney();
		if(lockMoney==null){
			lockMoney = 0d;
		}
		if(money==null){
			money = 0d;
		}
		lockMoney+=money;
		sysUser.setLockMoney(lockMoney);
		if(lockMoney>userMoney){
			return false;
		}
		sysMoneyLockHistroy.setId(TokenGenerator.generateKey());
		sysUserService.updateSysUserByPrimaryKeySelective(sysUser);
		return true;
	}
}
