package com.cishi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;


/**
 * Servlet implementation class Download
 */
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Resource resource = ResourceUtils.getFile("file/磁石平台合同模板V1.0.doc")
        /*读取文件*/
//        File file = ResourceUtils.getFile("file/磁石平台合同模板V1.0.doc");
		 Resource res3 = new ServletContextResource(request.getSession().getServletContext(),
			        "file/磁石平台合同模板V1.0.doc");
		 if(res3==null){
			 return;
		 }
		 File file = res3.getFile();
        /*如果文件存在*/
        if (file.exists()) {
//            String filename = URLEncoder.encode(file.getName(), enc);
            response.reset();
//            response.setContentType(contentType);
            response.addHeader("Content-Disposition", "attachment; filename=\"磁石平台合同模板V1.0.doc\"");
            int fileLength = (int) file.length();
            response.setContentLength(fileLength);
            /*如果文件长度大于0*/
            if (fileLength != 0) {
                /*创建输入流*/
                InputStream inStream = new FileInputStream(file);
                byte[] buf = new byte[4096];
                /*创建输出流*/
                ServletOutputStream servletOS = response.getOutputStream();
                int readLength;
                while (((readLength = inStream.read(buf)) != -1)) {
                    servletOS.write(buf, 0, readLength);
                }
                inStream.close();
                servletOS.flush();
                servletOS.close();
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
