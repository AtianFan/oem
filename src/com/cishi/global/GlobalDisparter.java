package com.cishi.global;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.DispatcherServlet;

import com.cishi.beans.SysUser;
import com.cishi.util.GlobalContextUtil;

public class GlobalDisparter extends DispatcherServlet {
	

	@Override
	protected void doService(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		SysUser sysUser = (SysUser)arg0.getSession().getAttribute("sysUser");
		String currentLoginName = (String)arg0.getSession().getAttribute("currentLoginName");
		if(sysUser!=null){
			if(currentLoginName!=null){
				sysUser.setCurrentLoginName(currentLoginName);
			}
			GlobalSession.set(sysUser);
		}
		if(GlobalContextUtil.basePath==null){
			GlobalContextUtil.basePath = GlobalContextUtil.getUploadPath(arg0).replace("localhost:8080", "103.233.5.188:8000");
		}
		super.doService(arg0, arg1);
	}
	
	@Override
	protected void noHandlerFound(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		super.noHandlerFound(request, response);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print("{\"retcode\":\"-2\",\"retmsg\":\"page can not find!\"}");
		out.flush();
		out.close();
	}
}
