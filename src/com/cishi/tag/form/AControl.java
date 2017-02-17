package com.cishi.tag.form;

public class AControl extends BaseControl{
	private String href;
	
	public boolean isShowTitle() {
		return false;
	}
	
	public String getHref() {
		return href==null?"":href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Override
	String getTemplate() {
		return "<a href={href}>{title}</a>".replaceAll("\\{href\\}", this.getHref());
	}

	@Override
	void setContent(String html) {
		
	}
	
}
