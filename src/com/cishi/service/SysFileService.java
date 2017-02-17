package com.cishi.service;

import java.util.List;

import com.cishi.beans.SysFile;
import com.cishi.view.SysFileView;

public interface SysFileService {

	public int addFile(SysFile sysFile);
	
	public int addFileList(List<SysFile> sysFileList);
	
	public int addFileList(SysFileView sysFileView);
	
	public int addFile(SysFileView sysFileView);
	
	public int updateFilesOrderId(String id,Byte type,String fileIds);
	
	public SysFile downUserPicture(String userId);
	
	public int delFile(String id);
	
}
