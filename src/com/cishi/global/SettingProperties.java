package com.cishi.global;

public class SettingProperties {
private String uploadPath;
private String isDualIdentity;
//is_dual_identity
public String getUploadPath() {
	return uploadPath;
}

public boolean isDualIdentity() {
	return isDualIdentity.equals("1")?true:false;
}

public void setIsDualIdentity(String isDualIdentity) {
	this.isDualIdentity = isDualIdentity;
}

public void setUploadPath(String uploadPath) {
	this.uploadPath = uploadPath;
}

}
