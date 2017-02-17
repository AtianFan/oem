package com.cishi.global;

import com.cishi.beans.SysUser;

public class GlobalSession {
	
	public final static ThreadLocal<SysUser> threadLocal = new ThreadLocal<>(); 
	
	public static void set(SysUser sysUser) {
		threadLocal.set(sysUser);
	}
	
	public static SysUser get(){
		return threadLocal.get();
	}
	
	public static void remove(){
		threadLocal.remove();
	}
	
}
