package com.jonghoon.happybuy.merchandise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/permitSeller")
public class permitSeller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter(); 
		
		String context = request.getContextPath();
		String idx = request.getParameter("idx"); 
		MerchanDAO merchanDAO = new MerchanDAO(); 
		
		if(merchanDAO.userToSeller(idx) > 0) {
			out.println("<script> alert('승인처리 하였습니다.'); location.href='"+context+"/admin/manageSeller.jsp' </script>");
		} else {
			out.println("<script> alert('승인에 실패하였습니다.'); </script>");
			response.sendRedirect(request.getContextPath()+"/admin/manageSeller.jsp");
		}
		
		out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
