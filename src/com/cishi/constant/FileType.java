package com.cishi.constant;

import java.util.HashMap;
import java.util.Map;

public enum FileType {

	ORDER_FILE((byte)1,"任务文件","task"),
	ORDER_ICON((byte)3,"任务logo","task_icon"),
	VALID_FILE((byte)4,"验证文件","file"),
	USER_ICON((byte)2,"用户头像","icon");
	
	private Byte id;
	private String name;
	private String path;
	
	private FileType(Byte id, String name,String path) {
		this.id = id;
		this.name = name;
		this.path = path;
	}
	public Byte getId() {
		return id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public void setId(Byte id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFilePathByType(Byte id){
		for(FileType fileType:FileType.values()){
			if(fileType.getId().equals(id)){
				return fileType.getPath();
			}
		}
		return "default";
	}
	
	public static Map<String,String> loadMap(){
		 Map<String, String> map = new HashMap<>();
		for(FileType fileType:FileType.values()){
			map.put(fileType.getId()+"",fileType.getPath());
		}
		return map;
	}
}
