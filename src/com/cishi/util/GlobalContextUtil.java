package com.cishi.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.cishi.global.SettingProperties;

@Repository
public class GlobalContextUtil implements ApplicationContextAware{
	public SettingProperties settingProperties;	
	
	public static String basePath = null;
	
	public static ApplicationContext getApplicationContext(HttpServletRequest request){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext()); 
		return ctx;
	}
	
	public static String getUploadPath(HttpServletRequest request){
		ApplicationContext ac = GlobalContextUtil.getApplicationContext(request);
		SettingProperties settingProperties = (SettingProperties)ac.getBean("settingProperties");
		String path =  request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort()+"/"+settingProperties.getUploadPath()+"/";
		return path;
	}
	
	 private static ApplicationContext applicationContext; // Spring应用上下文环境

     /*

      * 实现了ApplicationContextAware 接口，必须实现该方法；

      *通过传递applicationContext参数初始化成员变量applicationContext

      */

     public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
    	 GlobalContextUtil.applicationContext = applicationContext;
     }


//GlobalContextUtil.getBean("baseService")
     public static ApplicationContext getApplicationContext() {
            return applicationContext;
     }
//

      @SuppressWarnings("unchecked")
      public static <T> T getBean(String name) throws BeansException {
                 return (T) applicationContext.getBean(name);
       }
}
