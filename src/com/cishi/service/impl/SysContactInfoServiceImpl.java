package com.cishi.service.impl;

import java.util.Date;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cishi.beans.SysContactInfo;
import com.cishi.dao.SysContactInfoMapper;
import com.cishi.service.SysContactInfoService;
import com.cishi.util.TokenGenerator;

@Service("sysContactInfoService")
public class SysContactInfoServiceImpl implements SysContactInfoService {
	@Resource
	public SysContactInfoMapper sysContactInfoMapper;

	@Override
	public int addSysContactInfo(SysContactInfo sysContactInfo) {
		if(sysContactInfo.getId()==null){
			sysContactInfo.setId(TokenGenerator.generateKey());
		}
		sysContactInfo.setCreateDate(new Date());
		return sysContactInfoMapper.insertSelective(sysContactInfo);
	}

}
