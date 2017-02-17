package com.cishi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.cishi.beans.SysFile;
import com.cishi.constant.FileType;
import com.cishi.dao.SysFileMapper;
import com.cishi.service.BaseService;
import com.cishi.service.SysFileService;
import com.cishi.view.SysFileView;

@Service("sysFileService")
public class SysFileServiceImpl  implements SysFileService{
	
	@Resource
	public BaseService baseService;
	
	@Resource
	public SysFileMapper sysFileMapper;

	@Override
	public int addFile(SysFile sysFile) {
		return sysFileMapper.insertSelective(sysFile);
	}

	@Override
	public int addFileList(List<SysFile> sysFileList) {
		int i = 0;
		for(SysFile sysFile:sysFileList){
			int j = sysFileMapper.insert(sysFile);
			if(j>0){
				i++;
			}
		}
		return i;
	}

	@Override
	public int addFile(SysFileView sysFileView) {
		if(sysFileView==null){
			return 0;
		}
		return this.addFile(toSysFile(sysFileView));
	}
	
	public SysFile toSysFile(SysFileView sysFileView){
		SysFile sysFile = new SysFile();
		sysFile.setCreateDate(sysFileView.getCreateDate());
		sysFile.setFileName(sysFileView.getName());
		sysFile.setOriginName(sysFileView.getOriginName());
		sysFile.setName(sysFileView.getName());
		sysFile.setId(sysFileView.getId());
		return sysFile;
	}

	@Override
	public int addFileList(SysFileView sysFileView) {
		// TODO Auto-generated method stub
		return 0;
	}

	//添加任务过后需要修改上传文件的id
	@Override
	public int updateFilesOrderId(String id,Byte type,String fileIds) {
		if(fileIds==null){
			return 0;
		}
		StringBuffer sb = new StringBuffer();
		String[] fileIdArray = fileIds.split("\\,");
		sb.append("(");
		for(int i=0;i<fileIdArray.length;i++){
			if(i<fileIdArray.length && i>0){
				sb.append(",");
			}
			String fileId = fileIdArray[i];
			sb.append("'");
			sb.append(fileId);
			sb.append("'");
		}
		sb.append(")");
		String str = null;
		if(type==FileType.ORDER_FILE.getId()){
			str = "order_id='"+id+"',";
		}
		if(type == FileType.USER_ICON.getId() || type == FileType.VALID_FILE.getId()){
			str = "user_id='"+id+"',";
		}
		String sql = "update sys_file set "+str+" type="+type+" where id in "+sb.toString();
		return baseService.update(sql, null);
	}

	@Override
	public SysFile downUserPicture(String userId) {
		SysFile sysFile = sysFileMapper.selectByUserId(userId);
		if(sysFile!=null){
			String fileUrl = sysFile.getFileUrl();
			sysFile.setFileUrl(fileUrl);
		}
		return sysFile;
	}

	@Override
	public int delFile(String fileIds) {
		if(fileIds==null){
			return 0;
		}
		StringBuffer sb = new StringBuffer();
		String[] fileIdArray = fileIds.split("\\,");
		sb.append("(");
		for(int i=0;i<fileIdArray.length;i++){
			if(i<fileIdArray.length && i>0){
				sb.append(",");
			}
			String fileId = fileIdArray[i];
			sb.append("'");
			sb.append(fileId);
			sb.append("'");
		}
		sb.append(")");
		String sql = "update sys_file set del_flag=1 where id in "+sb.toString();
		return baseService.update(sql, null);
	}
}
