package com.cishi.tag.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

public class I18NTag extends BaseTag{

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		JspWriter jw = getJspContext().getOut();
		jw.write(this.getProperties(this.getName()));
	}
}
