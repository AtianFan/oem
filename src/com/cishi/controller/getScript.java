package com.cishi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.cishi.beans.PropertiesEntity;
import com.cishi.constant.FileType;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.global.SettingProperties;
import com.cishi.util.GlobalContextUtil;
import com.cishi.util.JacksonUtil;
import com.cishi.util.LanguageUtil;

public class getScript extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public getScript() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/javascript;charset=utf-8");
		String lang = request.getParameter("lang");
		if(lang==null){
			lang="cn";
		}
		String path = GlobalContextUtil.getUploadPath(request);
		List<PropertiesEntity> list = LanguageUtil.loadList(lang);
		if(list==null){
			lang="cn";
		}
		list = LanguageUtil.loadList(lang);
		Map<String,String> map = new HashMap<>();
		for(PropertiesEntity p:list){
			map.put(p.getKey(), p.getValue());
		}
		Map<String,String> fileType = FileType.loadMap();
		PrintWriter out = response.getWriter();
		try {
			String value = JacksonUtil.beanToJson(map);
			String fileMap = JacksonUtil.beanToJson(fileType);
			out.write("var message ="+value+",fileMap="+fileMap+";");
			out.write("window.i18n = function(msg){return message[msg]||message[msg.toLowerCase()] || msg;};");
			out.write("var TASK_FILE ="+FileType.ORDER_FILE.getId()+",ICON="+FileType.USER_ICON.getId()+",path='"+path+"';");
			out.write("Utils.getFilePath = function(type,date,name){if(!type || !date || !name){return '';}return path+''+Utils.dateTimeToString(date,'yyyyMMdd')+'/'+name;};");
			out.write("var TaskFlowStatus={");
			for(int i=0,length=TaskFlowStatus.values().length;i<length;i++){
				TaskFlowStatus taskFlowStatus = TaskFlowStatus.values()[i];
				out.write(taskFlowStatus.getMsg()+":'"+taskFlowStatus.getCode()+"',");
				out.write(taskFlowStatus.getCode()+""+":'"+taskFlowStatus.getMsg()+"'");
				if(i<(length-1)){
					out.write(",");
				}
			}
			out.write("}");
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
