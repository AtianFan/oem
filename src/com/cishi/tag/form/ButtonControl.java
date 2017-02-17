package com.cishi.tag.form;

public class ButtonControl extends BaseControl {
	
	public String defaultValue;
	private String name;
	private String id;
	private String type;
	private String title;
	private Integer size;
	
	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public boolean isShowTitle() {
		return false;
	}

	@Override
	String getTemplate() {
		return "<button type='{type}' id='{id}'>{title}</button>";
	}

	@Override
	void setContent(String html) {

	}

}
