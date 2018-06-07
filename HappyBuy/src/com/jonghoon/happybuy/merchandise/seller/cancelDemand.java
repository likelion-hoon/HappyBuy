package com.jonghoon.happybuy.merchandise.seller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.merchandise.MerchanDAO;
import com.jonghoon.happybuy.user.UserDAO;

// 요청 취소 서블릿
@WebServlet("/cancelDemand")
public class cancelDemand extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		String context = request.getContextPath();
		UserDAO userDAO = new UserDAO(); 
		MerchanDAO merchanDAO = new MerchanDAO(); 
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String email = userDAO.getEmailInUserId(idx); 
		
		if(merchanDAO.deleteRegister(email) > 0) {
			out.println("<script> alert('취소처리 하였습니다.'); location.href='"+context+"/admin/manageSeller.jsp' </script>");
		} else  {
			out.println("<script> alert('취소실패 했습니다.'); history.go(-1) </script>");
		}
		
		out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
