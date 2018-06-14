package com.jonghoon.happybuy.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminLoginProc")
public class adminLoginProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		AdminDAO adminDAO = new AdminDAO(); 
		
		String id = request.getParameter("identi"); 
		String password = request.getParameter("addpasswd"); 
		
		if(adminDAO.login(id, password)) {
			request.getSession().setAttribute("adminID", id);
			response.sendRedirect(request.getContextPath()+"/admin/main.jsp");
		} else {
			out.println("<script> alert('입력값이 틀렸습니다.'); location.href='login.jsp' </script>");
		}
		
		out.close(); 
	}
}
