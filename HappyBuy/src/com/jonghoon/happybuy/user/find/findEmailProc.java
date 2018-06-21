package com.jonghoon.happybuy.user.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.user.UserDAO;

@WebServlet("/findEmailProc")
public class findEmailProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		UserDAO userDAO = new UserDAO();
		PrintWriter out = response.getWriter(); 
		String first = request.getParameter("fpnum"); 
		String second = request.getParameter("spnum");
		
		String email = userDAO.getEmailInPnum(first, second);
		
		if(!email.equals("")) {
			out.println("<script> location.href='responseEmail.jsp' </script>");
		} else {
			out.println("<script> alert('일치하는 값이 없습니다.'); location.href='findEmail.jsp' </script>");
		}
		
		out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
