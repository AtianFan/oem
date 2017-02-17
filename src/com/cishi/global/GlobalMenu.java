package com.cishi.global;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;

import com.cishi.view.Menu;

public class GlobalMenu {
	private  static Map<String,List<Menu>> map = new HashMap();
	private static  Boolean isLoadSuccess = false;
	public final static String LAUNCH_TYPE="1";
	public final static String RECEIVE_TYPE="2";
	public final static String NO_LOGIN_TYPE="3";
	public static Map<String, List<Menu>> getMap() {
		if(isLoadSuccess){
			return map;
		}
		return loadMenu();
	}
	public synchronized static  Map<String,List<Menu>> loadMenu() {
		map = new HashMap();
		SAXReader sr = new SAXReader();
		map = new HashMap<>();
		try {
			File file = ResourceUtils.getFile("classpath:menus.xml");  
			Document document = sr.read(file);
			Element element = document.getRootElement();
			List<Element> list = element.elements();
			for(Element e:list){
				Menu menu = initMenu(e);
				List<Element> sonList = e.elements();
				List<Menu> menuList = new ArrayList<>();
				for(Element el:sonList){
					menuList.add(initMenu(el));
				}
				menu.setMenuList(menuList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		isLoadSuccess = true;
		return map;
	}
	
	private synchronized static Menu initMenu(Element e) {
		Menu menu = new Menu();
		String permission = e.attributeValue("permission");
		String name = e.attributeValue("name");
		String url = e.attributeValue("url");
		String isParent = e.attributeValue("isparent");
		String styleClass = e.attributeValue("styleclass");
		String icon = e.attributeValue("icon");
		String liClass = e.attributeValue("liClass");
		String param = e.attributeValue("param");
		if(permission!=null && permission.length()>0){
			String[] permissions = permission.split(",");
			for(String permiss:permissions){
				List<Menu> l = map.get(permiss);
				if(l==null){
					l = new ArrayList<>();
					map.put(permiss, l);
				}
				l.add(menu);
			}
		}
		menu.setParam(param);
		menu.setName(name);
		menu.setUrl(url);
		menu.setPermission(permission);
		menu.setLiClass(liClass);
		menu.setIsParent(isParent);
		menu.setStyleClass(styleClass);
		menu.setIcon(icon);
		return menu;
	}
}
