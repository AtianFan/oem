package com.cishi.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.cishi.beans.SysUser;
import com.cishi.constant.ErrorCode;
import com.cishi.global.GlobalMenu;
import com.cishi.global.SettingProperties;
import com.cishi.param.ResponseData;
import com.cishi.util.DataToClassUtil;
import com.cishi.util.JacksonUtil;
import com.cishi.view.Menu;
import com.cishi.view.PageView;
public class BaseController {

	@Resource
	public SettingProperties settingProperties;	
	
	protected HttpServletRequest request;  
    protected HttpServletResponse response;  
    protected HttpSession session;  
    protected String requestList;
    

    public String getRequestList() {
		return requestList;
	}

	public void setRequestList(String requestList) {
		this.requestList = requestList;
	}

	public boolean validRequest(String requestList){
    	ResponseData responseData = this.getNewResponseData();
    	Map<String,String> map = this.parseRequestList(requestList);
    	String accessToken = map.get("accessToken");
    	if(accessToken==null){
    		responseData.setRetcode(ErrorCode.VLIAD_SESSION_ERROR.getRetcode());
    		responseData.setRetmsg(ErrorCode.VLIAD_SESSION_ERROR.getRetmsg());
    		return false;
    	}
    	return true;
    }
    
    public String getUploadPath(HttpServletRequest request){
    	return (request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort()+"/"+settingProperties.getUploadPath()+"/").replace("localhost:8080", "103.233.5.188:8000");
    }
    
    private Map<String,String> map = null;
    
    public String getParamValue(String name,String defaultValue){
    	String value = defaultValue;
    	if(map!=null && map.get(name)!=null){
    		value = map.get(name);
    	}
    	return value;
    }
    
    @SuppressWarnings("unchecked")
	public Map<String,String> parseRequestList(String requestList) {
    	Map<String,String> pMap = null;
    	try {
    		pMap = (Map<String,String>)JacksonUtil.jsonToBean(requestList, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	map = pMap;
    	return pMap;
    }
    
    @ModelAttribute  
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "requestList",required=false)String requestList){  
        this.request = request;  
        this.response = response;  
        this.session = request.getSession();  
        this.requestList = requestList;
    }  
    
	@SuppressWarnings("rawtypes")
	private ResponseData responseData;
	@SuppressWarnings("rawtypes")
	private ResponseData getResponseDataNotNull(){
		if(responseData==null){
			responseData = new ResponseData();
		}
		return responseData;
	}
	
	@SuppressWarnings("rawtypes")
	public ResponseData getNewResponseData(){
		ResponseData responseData = new ResponseData();
		responseData.parseErrorCode(ErrorCode.SUCCESS);
		responseData.setCreateDate(new Date());
		return responseData;
	}
	
	public Object loadObjectByJSON(String requestList,Class<?> clzz){
		return DataToClassUtil.toClassData(this.parseRequestList(requestList), clzz);
	}
	
	public void setUserId(String userId){
		this.getResponseDataNotNull().setUserId(userId);
	}
	
	public int getIntParam(String name){
		String value = (String)request.getParameter(name);
		if(value==null){
			value="1";
		}
		return Integer.valueOf(value);
	}
	
	public SysUser getSessionUser(boolean flag){
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		return sysUser;
	}
	
	public String getCurrentUserId(){
		SysUser sysUser = this.getSessionUser(false);
		if(sysUser==null){
			return null;
		}
		return sysUser.getId();
	}
}
