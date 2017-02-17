package com.cishi.tag.form;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.sun.org.apache.regexp.internal.recompile;

public class FormControl extends SimpleTagSupport{

	private final static String template = "<div class='form-control-ui'><span>{name}</span></div>";
	private String name;
	private String type;
	private String defaultValue;
	private String controlName;
	
	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getControlName() {
		return controlName;
	}

	public void setControlName(String controlName) {
		this.controlName = controlName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public void doTag() throws JspException, IOException {
//		super.doTag();
		JspWriter out = getJspContext().getOut();
		String html = template.replaceAll("\\{name\\}", this.getName()+"");
		out.write(html);
	}

	@Override
	protected JspFragment getJspBody() {
		return super.getJspBody();
	}

	@Override
	protected JspContext getJspContext() {
		return super.getJspContext();
	}

	@Override
	public JspTag getParent() {
		return super.getParent();
	}

	@Override
	public void setJspBody(JspFragment jspBody) {
		super.setJspBody(jspBody);
	}

	@Override
	public void setJspContext(JspContext pc) {
		super.setJspContext(pc);
	}

	@Override
	public void setParent(JspTag parent) {
		super.setParent(parent);
	}

	
}
