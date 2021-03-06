package com.cishi.tag.form;

public class UIControl extends BaseControl {
	private String url = "";
	private String id;
	private String data;
	private String title;
	private String name;
	public String getTitle() {
		return title==null?"":title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name==null?"":name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id==null?"":id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	String getTemplate() {
		return "<ul id='{id}' name='{name}'></ul><script>renderData('{url}','{id}','{data}');</script>"
				.replaceAll("\\{url\\}", this.getUrl()).replaceAll("\\{id\\}", this.getId()).replaceAll("\\{data\\}", this.getData());
	}

	@Override
	void setContent(String html) {
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getData() {
		return data==null?"":data;
	}

	public void setData(String data) {
		this.data = data;
	}
	

}
