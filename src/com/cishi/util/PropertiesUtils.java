package com.cishi.util;
import java.io.InputStreamReader;
import java.util.Properties;

public class PropertiesUtils {
	
	public static Properties loadProperties(String path){
		Properties properties = null;
		InputStreamReader fis;
		try {
			fis = new InputStreamReader(PropertiesUtils.class.getClassLoader().getResourceAsStream(path), "UTF-8");
			properties.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return properties;
	}
	
	public static void main(String[] args) {
		Properties properties = new Properties();
		try {
			System.out.println(Properties.class.getResource("/").getPath());
			InputStreamReader fis = new InputStreamReader(PropertiesUtils.class.getClassLoader().getResourceAsStream("lang/cn.properties"), "UTF-8");
			properties.load(fis);
			String name = properties.getProperty("name");
			System.out.println(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
