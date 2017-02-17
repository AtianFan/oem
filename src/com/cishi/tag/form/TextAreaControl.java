package com.cishi.tag.form;

public class TextAreaControl extends BaseControl{
	private final static String template = "<textarea name='{name}' text-size='{size}'></textarea>";
	
	public TextAreaControl() {
	}

	@Override
	String getTemplate() {
		return template;
	}

	@Override
	void setContent(String html) {
	}
	
}
