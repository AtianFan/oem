package com.cishi.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String YYYY_MM_DD_HH_MM_SS="yyyyMMddHHmmss";
	public static String YYYY_MM_DD="yyyyMMdd";
   //yyyyMMddHHmmss
	public static Date getCurrentDate(){
		return new Date();
	}
	
	public static String getStringDate(Date date){
		if(date==null){
			date = getCurrentDate();
		}
		return "";
	}
	
	public static String formatDate(String pattern,Date date){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String dateString = sdf.format(date);
		return dateString;
	}
	
	public static String getCurrentStringDate(String pattern){
		String result = formatDate(pattern, getCurrentDate());
		return result;
	}
	public static void main(String[] args) {
		long date = new Date().getTime();
		System.out.println(new Date(date));
	}
}
