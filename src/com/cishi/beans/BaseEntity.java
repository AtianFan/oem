package com.cishi.beans;

import java.util.UUID;

public class BaseEntity {	
	public static String generatorUUID(){
		return UUID.randomUUID().toString().replaceAll("\\-","");
	}
	public static void main(String[] args) {
//		System.out.println(BaseEntity.generatorUUID());
//		System.out.println(BaseEntity.generatorUUID().length());
	}
}
