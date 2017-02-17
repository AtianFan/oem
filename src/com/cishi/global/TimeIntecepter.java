package com.cishi.global;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TimeIntecepter implements HandlerInterceptor {
	private final static Logger logger = Logger.getLogger(TimeIntecepter.class);
	private Map<String,Date> map = new HashMap<String,Date>();

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
//		 HandlerMethod handler=(HandlerMethod) arg2; 
		logger.debug("["+arg2+"]:timer:"+new Date());
		Date date = ((Date)map.get(arg2+""));
		if(date==null){
			return;
		}
		long time = new Date().getTime()-date.getTime();
		System.out.println("-----------------"+time);
		logger.debug("["+arg2+"]耗时:"+time+"s");
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		Date nowDate = new Date();
		logger.debug("["+arg2+"]:timer:"+nowDate);
		map.put(arg2+"",nowDate);
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		return true;
	}

}
