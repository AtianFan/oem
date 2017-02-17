package com.cishi.tag.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

public abstract class BaseControl extends BaseTag{
	private final static String template = "<div class='form-control'><span>{title}</span>"
			+ "{template}</div>";
	private final static String template_notitle = "<div class='form-control'>"
			+ "{template}</div>";
	public String defaultValue;
	private String name;
	private String id;
	private String type;
	private String title;
	private Integer size;
	private boolean showTitle = true;
	
	public boolean isShowTitle() {
		return showTitle;
	}

	public void setShowTitle(boolean showTitle) {
		this.showTitle = showTitle;
	}
	abstract String getTemplate();
	
	abstract void setContent(String html);
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		JspWriter out = getJspContext().getOut();
		String content = this.renderTemplate(this.getTemplate());
		String html = this.renderTemplate(isShowTitle()?template:template_notitle).replaceAll("\\{template\\}",content);
		out.write(html);
	}

	public String renderTemplate(String template){
		String html =  template.replaceAll("\\{title\\}", this.getTitle()).replaceAll("\\{type\\}", this.getType())
		.replaceAll("\\{name\\}", this.getName())
		.replaceAll("\\{defaultValue\\}", this.getDefaultValue()).replaceAll("\\{id\\}", this.getId());
		if(this.getSize()!=null && this.getSize()!=0){
			html = html.replaceAll("\\{size\\}", this.getSize()+"");
		}	
		return html;
	}
	
	public String getTitle() {
		return getProperties(title==null?"":title);
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getDefaultValue() {
		return defaultValue==null?"":defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getName() {
		return name==null?"":name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id==null?id:"";
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type==null?"text":type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

}
