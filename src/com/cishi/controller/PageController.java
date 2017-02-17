package com.cishi.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cishi.beans.OrderTask;
import com.cishi.beans.SysConfirm;
import com.cishi.beans.SysUser;
import com.cishi.collection.SysConfirmCollection;
import com.cishi.constant.TaskFlowStatus;
import com.cishi.global.GlobalMenu;
import com.cishi.service.OrderTaskService;
import com.cishi.service.SysConfirmService;
import com.cishi.service.SysUserService;
import com.cishi.view.Menu;
import com.sun.org.apache.bcel.internal.generic.StoreInstruction;

@Controller
@RequestMapping("/")
public class PageController extends BaseController {

	@Resource
	public SysUserService sysUserService;

	@Resource
	public SysConfirmService sysConfirmService;

	@Resource
	public OrderTaskService orderTaskService;
	
	
	
	public void refreshUser(){
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		if(sysUser!=null){
			String id = sysUser.getId();
			if(StringUtils.isEmpty(id+"")){
				sysUser = sysUserService.loadSysUserById(id);
				session.setAttribute("sysUser", sysUser);
			}
		}
	}
	
	private static List<String> authUrlList = new ArrayList<>();
	static{
		authUrlList.add("orderModify");
		authUrlList.add("orderTaskAdd");
		authUrlList.add("myReceiveTask");
		authUrlList.add("modifyUserInfo");
		authUrlList.add("modifyPwd");
	}

	@RequestMapping("logout")
	public String logout(Model model) {
		sysUserService.logout(request, null);
		loadMenu(model);
		return "jsp/login";
	}
	
	private void loadMenu(Model model) {
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		Map<String, List<Menu>> map = GlobalMenu.getMap();
		List<Menu> menuList = null;
		if (sysUser == null) {
			menuList = map.get(GlobalMenu.NO_LOGIN_TYPE);
		} else {
			String type = sysUser.getType();
			if (type != null && type.equals("1")) {
				menuList = map.get(GlobalMenu.LAUNCH_TYPE);
			} else {
				menuList = map.get(GlobalMenu.RECEIVE_TYPE);
			}
		}
		model.addAttribute("menuList", menuList);
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		loadMenu(model);
		if (sysUser != null) {
			String page = (String) session.getAttribute("RedirectURL");
			if(null != page)
			{
				String pageName = (String) session.getAttribute("pageName");
				String orderId = (String) session.getAttribute("orderId");
				model.addAttribute("id", orderId);
				session.removeAttribute("RedirectURL");
				return detail(pageName, orderId, model);
			}
			else
			{
				model.addAttribute("pageName", "homePage");
				return "jsp/homePage";
			}
			
		}
		model.addAttribute("pageName", "login");
		return "jsp/login";
	}

	@RequestMapping(value = "loginNew", method = RequestMethod.GET)
	public String loginNew() {
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		if (sysUser != null) {
			return "newJsp/homePage";
		}
		return "newJsp/login";
	}

	@RequestMapping("{pageName}")
	public String page(@PathVariable String pageName, Model model) {
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		loadMenu(model);
		String pageType = "2";
		if (sysUser != null) {
			String type = sysUser.getType();
			if (type != null) {
				if (type.equals("1")) {
					pageType = "2";
				}
				if (type.equals("2")) {
					pageType = "1";
				}
			}
		}else{
			if(authUrlList.contains(pageName)){
				return "jsp/login";
			}
		}
		model.addAttribute("pageType", pageType);
		model.addAttribute("keyWord", request.getParameter("keyWord"));
		refreshUser();
		String page = (String) session.getAttribute("RedirectURL");
		if(null != sysUser && null != page)
		{
			String pageName1 = (String) session.getAttribute("pageName");
			String orderId = (String) session.getAttribute("orderId");
			session.removeAttribute("RedirectURL");
			return detail(pageName1, orderId, model);

		}
		else
		{
			model.addAttribute("pageName", pageName);
			return "jsp/" + pageName;
		}
	}

	@RequestMapping("/{pageName}/{orderId}")
	public String detail(@PathVariable String pageName, @PathVariable String orderId,Model model) {
		if(!pageName.equals("newStyle")||!orderId.equals("img")){
			
			if(orderId != null && !"".equals(orderId.trim()) && orderId.indexOf("iconFile") > 0){
				return null;
			}
			String path = "receiver";
			OrderTask orderTask = orderTaskService.loadOrderTaskById(orderId);
			session.setAttribute("orderId", orderId);
			request.setAttribute("id", orderId);
			session.setAttribute("pageName", pageName);
			SysUser sysUser = (SysUser) session.getAttribute("sysUser");
			loadMenu(model);
			model.addAttribute("pageName", pageName);
			System.out.println("--------------------------------------------");
			System.out.println(pageName);
			if (sysUser == null) {
				model.addAttribute("pageName", "login");
				session.setAttribute("RedirectURL", pageName+"/"+orderId);
				return "jsp/login";
			}
			String userId = sysUser.getId();
			if (orderTask == null || sysUser == null || userId == null) {
				model.addAttribute("pageName", "login");
				session.setAttribute("RedirectURL", pageName+"/"+orderId);
				return "jsp/login";
			} else {
				String launcherId = orderTask.getLauncherId();
				if (launcherId != null && launcherId.equals(sysUser.getId())) {
					path = "launcher";
				}
				if(!"-1".equals(orderTask.getParentId())&&"orderModify".equals(pageName)){
					request.setAttribute("subOrderTask", orderTask);
					pageName = "modifySubTask";
				}
			}
			refreshUser();
			if (!path.contains("launcher")) {
				String receiverId = orderTask.getReceiverId();
				if (receiverId != null && receiverId.equals(userId)) {
					return "jsp/" + path + "/" + pageName;
				}
				List<SysConfirmCollection> sysConfirmList = sysConfirmService.loadSysConfirmList(orderId,
						TaskFlowStatus.WAIT_FOR_DETAIL.getCode(), true, sysUser.getId());
				if (sysConfirmList == null || sysConfirmList.size() == 0) {
					//TODO 暂时注释掉，应该是如果此任务和该用户无关则不予许查看任务详情
	//				model.addAttribute("pageName", "login");
	//				session.setAttribute("RedirectURL", pageName+"/"+orderId);
	//				return "jsp/login";
				}
			}
			return "jsp/" + path + "/" + pageName;
		}else{
			return null;
		}
	}
	
	@RequestMapping("/{pageName}/{orderId}/{subTaskFlag}")
	public String subdetail(@PathVariable String pageName, @PathVariable String orderId,@PathVariable String subTaskFlag,Model model) {
		request.setAttribute("subTaskFlag", subTaskFlag);
		return detail(pageName, orderId, model);
	}
}
