package com.jonghoon.happybuy.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jonghoon.happybuy.user.UserDAO;

@WebServlet("/emailCheckAction")
public class emailCheckAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code"); 
		String email = request.getParameter("email"); 
		
		System.out.println(email); 
		
		UserDAO userDAO = new UserDAO(); 
		
		boolean rightCode = (new SHA256().getSHA256(email).equals(code)) ? true : false;
		
		if(rightCode) {
			userDAO.setUserEmailChecked(email);
			out.println("<script> alert('인증에 성공했습니다.'); location.href='index.jsp' </script>"); 
		} else {
			out.println("<script> alert('유효하지 않은 코드입니다.'); location.href='index.jsp' </script>");
		}
	
		out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
