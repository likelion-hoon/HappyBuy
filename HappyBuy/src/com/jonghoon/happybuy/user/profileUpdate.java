package com.jonghoon.happybuy.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/profileUpdate")
public class profileUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
		 PrintWriter out = response.getWriter(); 
		 MultipartRequest multi = null; 
		 int fileSize = 1024*1024*10; // 최대 10mb
		 String directory = request.getSession().getServletContext().getRealPath("/profile");
		 
		 try {
			 multi = new MultipartRequest(request, directory, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		 } catch(Exception e) {
			 e.printStackTrace();
			 response.sendRedirect("/profileEdit.jsp");
			 return;
		 }
		 
		 // input값 출력 저장.
		 UserDAO userDAO = new UserDAO(); 
		 int user_id = Integer.parseInt(multi.getParameter("idx")); 
		 String now_password = multi.getParameter("now_password"); 
		 String new_password = multi.getParameter("new_password"); 
		 String new_passcheck = multi.getParameter("new_passcheck"); 
		 String address = multi.getParameter("address"); 
		 String pnumber = multi.getParameter("pnumber"); 
		 String fileRealName = URLEncoder.encode(multi.getFilesystemName("file")); 
		 
		 // System.out.println(multi.getFilesystemName("file")); 
		 // System.out.println(URLEncoder.encode(multi.getFilesystemName("file"),"utf-8"));
		 
		 File file = multi.getFile("file"); 
		 
		 // 현재 비밀번호 에러처리
		 if(now_password.isEmpty() || !userDAO.getUser(user_id).getPassword().equals(now_password)) {
			 if(file != null) {
				 file.delete(); 
			 }
			 out.println("<script> alert('현재 비밀번호가 제대로 입력되지 않았습니다.'); location.href='profileEdit.jsp' </script>");
			 out.close(); 
			 return; 
		 }
		 // 새로운 비밀번호 같음 확인
		 if(!new_password.equals(new_passcheck)) {
			 if(file != null) {
				 file.delete(); 
			 }
			 out.println("<script> alert('새로운 비밀번호 값이 맞지 않습니다.'); location.href='profileEdit.jsp' </script>");
			 out.close(); 
			 return; 
		 }
		 
		 // 새로운 비밀번호 값이 없으면 원래 비밀번호 넣기
		 if(new_password.isEmpty()) {
			 new_password = now_password; 
		 }
		 
		 // file을 수정했다면 
		 if(file != null) {
			 String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			 
			 // 이미지 파일만 업로드 하게 만듬 
			 if(ext.equals("jpg") || ext.equals("jpeg") || ext.equals("png") || ext.equals("gif"))  {
				 
				 String prevFileName = userDAO.getUser(user_id).getProfilePath();
				 
				 // 이전에 업로드한 파일이 있다면
				 if(!prevFileName.isEmpty()) {
					 File prevFile = new File(directory + "/" + prevFileName); 
					 // 지운다
					 if(prevFile.exists()) {
						 prevFile.delete(); 
					 }
				 }
			 } else {
				// 해당 확장자가 아니므로 지운다. 
				if(file != null)
					file.delete();
				
				out.println("<script> alert('업로드 할 수 없는 확장자 입니다.'); history.go(-1) </script>"); 
				out.close(); 
				return; 
			 }
		 }
		 
		 // 바꿔야 될 값은 new_password, address, pnumber, ProfilePath
		 User user = new User(user_id, new_password, address, pnumber, fileRealName);
		 if(userDAO.changeUserInformation(user) != -1) {
			 out.println("<script> alert('프로필이 성공적으로 수정되었습니다.'); location.href='myprofile.jsp' </script>");
		 } else {
			 if(file != null) {
				file.delete();
			 }
			 out.println("<script> alert('프로필 수정에 실패하였습니다.'); location.href='myprofile.jsp' </script>");
		 }
		 
	}
}
