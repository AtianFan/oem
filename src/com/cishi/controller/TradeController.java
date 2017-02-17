package com.cishi.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.constant.PayType;
import com.cishi.constant.TradeType;
import com.cishi.param.ResponseData;
import com.cishi.service.SysUserService;
import com.cishi.service.TradeService;
import com.cishi.service.impl.TradeCenterService;
import com.cishi.service.impl.TradeServiceImpl;
import com.cishi.util.DataToClassUtil;
import com.cishi.util.ResponseUtil;

@Controller
@RequestMapping("/TradeSystem/")
public class TradeController extends BaseController {

	@Resource
	public TradeService tradeService;
	
	@Resource
	public SysUserService sysUserService;

	@ResponseBody
	@RequestMapping(value="recharge")
	public ResponseData recharge(){
		ResponseData responseData = this.getNewResponseData();
		Map<String,String> map = DataToClassUtil.parseRequestList(requestList);
		String money = map.get("money");
		String payType = map.get("payType");
		String payAccount = map.get("payAccount");
		if(!ResponseUtil.paramsCanNotBeNull(new String[]{money,payType,payAccount}, new String[]{"money","payType","payAccount"}, responseData)){
			return responseData;
		}
		String userId = this.getCurrentUserId();
		Double moneyDouble = Double.valueOf(money);
		Byte payTypeByte = Byte.valueOf(payType);
		if(userId==null){
			responseData.parseErrorCode(ErrorCode.SHOULD_LOGIN);
			return responseData;
		}
		boolean flag = tradeService.recharge(userId, moneyDouble, payTypeByte,payAccount);
		if(flag){
			SysUser sysUser = sysUserService.loadSysUserById(userId);
			session.setAttribute("sysUser", sysUser);
		}
		return responseData;
	}

}
