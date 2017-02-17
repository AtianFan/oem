package com.cishi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysUser;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.service.OrderTaskService;
import com.cishi.service.SysConfirmService;
import com.cishi.service.SysUserService;

@Controller
@RequestMapping("/new")
public class PageNewController extends BaseController {

	@Resource
	public SysUserService sysUserService;
	
	@Resource
	public SysConfirmService sysConfirmService;
	
	@Resource
	public OrderTaskService orderTaskService;
	@RequestMapping("logout")
	public String logout(){
		sysUserService.logout(request, null);
		return "newJsp/login";
	}
	
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(){
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		if(sysUser!=null){
			return "newJsp/homePage";
		}
		return "newJsp/login";
	}
	
	@RequestMapping("{pageName}")
	public String page(@PathVariable String pageName,Model model) {
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		String pageType = "2";
		if(sysUser!=null){
			String type = sysUser.getType();
			if(type!=null){
				if(type.equals("1")){
					pageType = "2";
				}
				if(type.equals("2")){
					pageType = "1";
				}
			}
		}
		model.addAttribute("pageType", pageType);
		return "newJsp/"+pageName;
	}
	
	@RequestMapping("/{pageName}/{orderId}")
	public String detail(@PathVariable String pageName,@PathVariable String orderId) {
		String path = "receiver";
		OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
		request.setAttribute("id", orderId);
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		if(sysUser==null){
			return  "newJsp/login";
		}
		String userId = sysUser.getId();
		if(orderTask==null || sysUser==null || userId==null){
			return  "newJsp/login";
		}else{
			String launcherId = orderTask.getLauncherId();
			if(launcherId!=null && launcherId.equals(sysUser.getId())){
				path = "launcher";
			}
		}
		if(!path.contains("launcher")){
			String receiverId = orderTask.getReceiverId();
			if(receiverId!=null && receiverId.equals(userId)){
				return "newJsp/"+path+"/"+pageName;
			}
			List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadSysConfirmList(orderId, TaskFlowStatus.WAIT_FOR_DETAIL.getCode(), true,sysUser.getId());
			if(sysConfirmList==null || sysConfirmList.size()==0){
				return  "newJsp/login";
			}
		}
		return "newJsp/"+path+"/"+pageName;
	}
}
