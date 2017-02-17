package com.cishi.controller;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;
import com.cishi.service.SysFileService;
import com.cishi.util.DateUtil;
import com.cishi.util.TokenGenerator;
import com.cishi.view.SysFileView;
import com.cishi.view.UploadFileView;

@Controller
@RequestMapping("/SysFile/")
public class SysFileController extends BaseController {
	
	@Resource
	public SysFileService sysFileService;
	
	
	public SysFileView fileUploadFile(HttpServletRequest request){
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		String dateStr = DateUtil.getCurrentStringDate(DateUtil.YYYY_MM_DD);
		String fileServerPath = getUploadPath(request)+dateStr+"/";
		String fileName =  null;
		String originName = null;
		String fileServerNamePath = null;
		SysFileView sysFileView = new SysFileView();
		String projectName = request.getContextPath().replace("/", "");
		try 
        {  
            List<FileItem> items = upload.parseRequest(request);  
            Iterator<FileItem> itr = items.iterator();  
            while (itr.hasNext())  
            {  
                FileItem item = (FileItem) itr.next();  
                if (item.isFormField())  
                {  
//                    System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));  
                	sysFileView.add(item.getFieldName(), item.getString("UTF-8"));
                }   
                else  
                {  
                    if (item.getName() != null && !item.getName().equals(""))  
                    {
                    	
                    	String path = request.getSession().getServletContext().getRealPath("/").replace(projectName,
        						settingProperties.getUploadPath())+dateStr+"/";
                    	originName = item.getName();
                    	int index = originName.lastIndexOf(".");
                    	String type = originName.substring(index);
                    	String id= TokenGenerator.generateKey();
                    	fileName = id+type;
                    	originName = new String(originName.getBytes(),"utf-8");
                    	File filePath = new File(path);
                    	if(!filePath.exists()){
                    		filePath.mkdirs();
                    	}
                    	sysFileView.setOriginName(originName);
                        File file = new File(path, fileName);  
                        item.write(file);  
                        sysFileView.setName(fileName);
                        fileServerNamePath = fileServerPath+fileName;
                        sysFileView.setPath(fileServerNamePath);
                        sysFileView.setFlag(true);
                        sysFileView.setId(id);
                        sysFileView.setCreateDate(new Date());
                        sysFileService.addFile(sysFileView);
                    } else  
                    {  
                    }  
                }  
            }  
        }catch(Exception e){
        	e.printStackTrace();
        	sysFileView.setFlag(true);
        }
		return sysFileView;
	}
	
	@RequestMapping(value="clientUpload",method=RequestMethod.POST)
	public ResponseData<SysFileView> clientUpload(HttpServletRequest request){
		ResponseData responseData = this.getNewResponseData();
		SysFileView sysFileView = fileUploadFile(request);
		if(sysFileView.isFlag()){
			responseData.parseErrorCode(ErrorCode.UPLOAD_FAIL);
		}else{
			responseData.parseErrorCode(ErrorCode.UPLOAD_SUCCESS);
			responseData.setData(sysFileView);
		}
		return responseData;
	}
 	
	@RequestMapping(value="commonUpload",method=RequestMethod.POST)
	public String commonUpload(HttpServletRequest request){
		SysFileView sysFileView = fileUploadFile(request);
		request.setAttribute("data", sysFileView);
		request.setAttribute("callback", sysFileView.get("callback"));
		return "jsp/uploadFile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ResponseData<Object> upload(@RequestParam(value = "file", required = false) MultipartFile file) {
		ResponseData responseData = this.getNewResponseData();
		responseData.parseErrorCode(ErrorCode.UPLOAD_SUCCESS);
		String projectName = request.getContextPath().replace("/", "");
		String fileServerPath = getUploadPath(request);
		if (file == null) {
			responseData.parseErrorCode(ErrorCode.UPLOAD_FAIL);
		} else {
			try {
				String path = request.getSession().getServletContext().getRealPath("/").replace(projectName,
						settingProperties.getUploadPath());
				String fileName = file.getOriginalFilename();
				File filePath = new File(path);
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.createNewFile();
				}
				file.transferTo(targetFile);
				UploadFileView uploadFileView = new UploadFileView();
				uploadFileView.setName(fileName);
				uploadFileView.setPath(fileServerPath+fileName);
				responseData.setData(uploadFileView);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return responseData;
	}
}
