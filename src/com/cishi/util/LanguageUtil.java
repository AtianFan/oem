package com.cishi.util;

import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cishi.beans.PropertiesEntity;
import com.cishi.tag.form.BaseTag;

public class LanguageUtil {

private  final static Map<String,Properties> map= new HashMap<String,Properties>();
private final static List<String> list = new ArrayList<>();
public static String lastLanguage = "cn";
	
	static {
		URL url = LanguageUtil.class.getResource("/lang");
//		System.out.println(url+"--------");
		File file = new File(url.getPath());
		if(file.exists()){
			File[] files = file.listFiles();
			for(File f:files){
				String name = f.getName();
				if(name==null){continue;};
				String type = name.split("\\.")[0];
				try {
					Properties properties = new Properties();
					InputStreamReader isr = new InputStreamReader(PropertiesUtils.class.getClassLoader().getResourceAsStream("lang/"+name), "UTF-8");
					properties.load(isr);
					map.put(type,properties);
					list.add(type);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static Map<String,String> loadMap(String lang){
		Properties properties = map.get(lang);
		Map<String,String> map = new HashMap<>();
		Iterator iterator = properties.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
			map.put(key, properties.getProperty(key));
		}
		return map;
	}
	public static List<PropertiesEntity> loadList(String lang){
		Properties properties = map.get(lang);
		List<PropertiesEntity> list  = new ArrayList<>();
		Iterator iterator = properties.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
			PropertiesEntity p = new PropertiesEntity();
			p.setKey(key);
			p.setValue((String)properties.getProperty(key));
			list.add(p);
		}
		return list;
	}
	public static String getProperties(String name,HttpSession httpSession){
		String lang = (String)httpSession.getAttribute("lang");
		if(lang==null){
			lang="cn";
		}
		System.out.println("lang:"+lang);
		Properties properties = map.get(lang);
		String value = properties.getProperty(name);
		return value==null||value.isEmpty()?name:value;
	}
	
	public static String getCurrentLanguage(HttpServletRequest request){
		return (String)request.getSession().getAttribute("lang");
	}
	
	
	public static List<String> getList() {
		return list;
	}
}
