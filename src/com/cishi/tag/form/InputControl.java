package com.cishi.tag.form;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

public class InputControl extends BaseTag {
	private final static String template1 = "<div class='form-control-ui {class_tag}'><span>{title}</span>"
			+ "<input type='{type}' onfocus='{inputFocus}' onblur='{inputBlur}' value='{defaultValue}' name='{name}' style='{style}'/><span class='msg'></span></div>";
	private final static String template2 = "<div class='form-control-ui {class_tag}'><span>{title}</span>"
			+ "<input type='{type}'  value='{defaultValue}' name='{name}' style='{style}'/><span class='msg'></span></div>";
	private String defaultValue;
	private String name;
	private String id;
	private String type;
	private String title;
	private String style;
	private String class_tag;
	private String on_focus;
	private String on_blur;
	
	

	public String getOn_focus() {
		return on_focus==null?"":on_focus;
	}

	public void setOn_focus(String on_focus) {
		this.on_focus = on_focus;
	}

	public String getOn_blur() {
		return on_blur==null?"":on_blur;
	}

	public void setOn_blur(String on_blur) {
		this.on_blur = on_blur;
	}

	public String getClass_tag() {
		return class_tag==null?"":class_tag;
	}

	public void setClass_tag(String class_tag) {
		this.class_tag = class_tag;
	}

	public String getStyle() {
		return style==null?"":style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		String template = this.getOn_blur()!=null?template2:template1;
		JspWriter out = getJspContext().getOut();
		String html = template.replaceAll("\\{title\\}", this.getTitle()).replaceAll("\\{type\\}", this.getType())
				.replaceAll("\\{name\\}", this.getName())
				.replaceAll("\\{style\\}",this.getStyle())
				.replaceAll("\\{class_tag\\}", this.getClass_tag())
				.replaceAll("\\{inputBlur\\}", this.getOn_blur())
				.replaceAll("\\{onfocus\\}", this.getOn_focus())
				.replaceAll("\\{defaultValue\\}", this.getDefaultValue()).replaceAll("\\{id\\}", this.getId());
		out.write(html);
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

}
