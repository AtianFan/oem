package com.cishi.tag.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MessageControl extends SimpleTagSupport{

	private final static String template = "<div id='${id}' classs='form-message'>{msg}</div>";
	
	private String id;
	private String msg;
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		JspWriter out = getJspContext().getOut();
		String html = template.replaceAll("\\$\\{id\\}", this.getId()==null?"":this.getId())
							  .replaceAll("\\$\\{msg\\}", this.getMsg()==null?"":this.getMsg());
		out.write(html);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}