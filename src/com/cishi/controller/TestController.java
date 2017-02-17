package com.cishi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cishi.service.SysUserService;

@Controller
public class TestController {

	@Resource
	public SysUserService userService;
	
	@ResponseBody
	@RequestMapping("/test")
	public String[] test(){
		userService.login();
		return new String[]{"1","2","3"};
	}
}
