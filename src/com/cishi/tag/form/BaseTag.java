package com.cishi.tag.form;

import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.cishi.util.PropertiesUtils;

public abstract class BaseTag extends SimpleTagSupport{
	
	
	private  final static Map<String,Properties> map= new HashMap<String,Properties>();
	
	static {
		URL url = BaseTag.class.getResource("/lang");
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
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	protected String getProperties(String name){
		String lang = (String)getSession().getAttribute("lang");
		if(lang==null){
			lang="cn";
		}
		Properties properties = map.get(lang);
		if(name==null){
			return name;
		}
		String value = properties.getProperty(name);
		return value==null||value.isEmpty()?name:value;
	}

	public static void main(String[] args) {
		
	}
	
	protected PageContext getPageContext(){
		return (PageContext)this.getJspContext();
	}
	
	protected ServletRequest getRequest(){
		PageContext pc = getPageContext();
		return pc.getRequest();
	}
	
	protected HttpSession getSession(){
		return getPageContext().getSession();
	}
	
}
