package com.cishi.util;

import java.util.Date;
import java.util.UUID;

public class TokenGenerator {

	public static String generateKey(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	public static String generateOrderNum(){
		Date date = new Date();
		String or = DateUtil.formatDate(DateUtil.YYYY_MM_DD_HH_MM_SS, date);
		or = "OR_"+or;
		return or;
	}
	public static void main(String[] args) {
		System.out.println(generateKey().length());
	}
}
