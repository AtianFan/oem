package com.cishi.global;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;

public class ParamIntecepter implements HandlerInterceptor {

	private final static Logger logger = Logger.getLogger(ParamIntecepter.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		if(arg2 instanceof HandlerMethod){
			HandlerMethod handler = (HandlerMethod)arg2;
			logger.debug("--------------------------"+handler.getMethod().getName());
		}
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			
			throws Exception {
		if(arg2 instanceof HandlerMethod){
			HandlerMethod handler = (HandlerMethod)arg2;
			logger.debug("--------------------------"+handler.getMethod().getName());
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		System.out.println("methodName="+methodNameResolver.getHandlerMethodName(arg0));
		if(arg2 instanceof HandlerMethod){
			HandlerMethod handler = (HandlerMethod)arg2;
			logger.debug("--------------------------"+handler.getMethod().getName());
		}
		return true;
	}

}
