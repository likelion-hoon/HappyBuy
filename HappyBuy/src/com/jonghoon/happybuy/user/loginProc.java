package com.jonghoon.happybuy.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginProc")
public class loginProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserDAO userDAO = new UserDAO(); 
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email"); 
		String password = request.getParameter("password");
		
		// 빈 값 입력시
		if(email.isEmpty() || password.isEmpty()) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.go(-1) </script>");
			return;
		}
		
		if(userDAO.login(email, password)) {
			session.setAttribute("userID", email);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			out.println("<script> alert('입력값이 틀렸습니다.'); history.go(-1) </script>");
		}
		
		// 사용한 자원반납
		userDAO.close(); 
		out.close();
	}
}
