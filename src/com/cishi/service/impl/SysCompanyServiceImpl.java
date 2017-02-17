package com.cishi.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cishi.beans.SysCompany;
import com.cishi.dao.SysCompanyMapper;
import com.cishi.service.SysCompanyService;
import com.cishi.util.TokenGenerator;


@Service("sysCompanyService")
public class SysCompanyServiceImpl implements SysCompanyService {
	
	@Resource
	public SysCompanyMapper sysCompanyMapper;

	@Override
	public String addCompany(String company) {
		String sysId = TokenGenerator.generateKey();
		SysCompany sysCompany = new SysCompany();
		sysCompany.setCompanyName(company);
		sysCompany.setId(sysId);
		int i =  sysCompanyMapper.insertSelective(sysCompany);
		if(i==0){
			return null;
		}
		return sysId;
	}

}
