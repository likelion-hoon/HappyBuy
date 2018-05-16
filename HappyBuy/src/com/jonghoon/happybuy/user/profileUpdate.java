package com.jonghoon.happybuy.user;

import java.io.IOException;
import java.io.PrintWriter;

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
		 String directory = request.getServletContext().getRealPath("/images").replaceAll("\\\\", "/"); 
		 
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
		 
		 // 현재 비밀번호 에러처리
		 if(now_password.isEmpty() || !userDAO.getUser(user_id).getPassword().equals(now_password)) {
			 out.println("<script> alert('현재 비밀번호가 제대로 입력되지 않았습니다.'); location.href='profileEdit.jsp' </script>");
			 out.close(); 
			 return; 
		 }
		 // 새로운 비밀번호 같음 확인
		 if(!new_password.equals(new_passcheck)) {
			 out.println("<script> alert('새로운 비밀번호 값이 맞지 않습니다.'); location.href='profileEdit.jsp' </script>");
			 out.close(); 
			 return; 
		 }
		 
		 
		 
		 
		 
	}
}
