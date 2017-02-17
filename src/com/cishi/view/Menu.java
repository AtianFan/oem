package com.cishi.view;

import java.util.List;
import java.util.Map;

public class Menu {

	private String name;
	private String url;
	private String permission;
	private String isParent;
	private List<Menu> menuList;
	private String styleClass;
	private String liClass;
	private String icon;
	private String param;

	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Menu(String name, String url, String permission, String isParent, List<Menu> menuList, String styleClass,
			String liClass) {
		super();
		this.name = name;
		this.url = url;
		this.permission = permission;
		this.isParent = isParent;
		this.menuList = menuList;
		this.styleClass = styleClass;
		this.liClass = liClass;
	}
	public Menu() {
		super();
	}
	public String getLiClass() {
		return liClass;
	}
	public void setLiClass(String liClass) {
		this.liClass = liClass;
	}
	public String getStyleClass() {
		return styleClass;
	}
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	public String getIsParent() {
		return isParent;
	}
	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	public Menu(String name, String url, String permission) {
		super();
		this.name = name;
		this.url = url;
		this.permission = permission;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
}
