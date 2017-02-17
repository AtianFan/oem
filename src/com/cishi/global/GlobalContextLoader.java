package com.cishi.global;

import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class GlobalContextLoader extends ContextLoader{

	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext
			servletContext) {
		// TODO Auto-generated method stub
		return super.initWebApplicationContext(servletContext);
	}
	
	public static void main(String[] args) {
		System.out.println(new Date().getTime());
	}
}

