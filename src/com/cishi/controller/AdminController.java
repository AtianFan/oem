package com.cishi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AdminController {

	@RequestMapping(value="Admin/{PageName}.admin")
	public String page(@PathVariable("PageName")String PageName){
		return "jsp/admin/"+PageName;
	}
	
}
