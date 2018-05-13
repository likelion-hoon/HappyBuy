package com.jonghoon.happybuy.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String fileName = req.getParameter("file"); 
		String directory = "/Users/leejonghoon/desktop/HappyBuy/upload";
		File file = new File(directory + "/" + fileName); 
		
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			res.setContentType("applciation/octet-stream"); 
		}
		
		String downloadName = null; 
		if(req.getHeader("user-agent").indexOf("MSIE") == -1) { // 브라우저가 IE가 아니라
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		} else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		res.setHeader("Content-Disposition", "attachment;filename=\""+downloadName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = res.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0; 
		
		while((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.flush(); 
		servletOutputStream.close(); 
		fileInputStream.close(); 
	}
}
