package com.jonghoon.happybuy.merchandise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.common.CheckNull;
import com.jonghoon.happybuy.user.User;
import com.jonghoon.happybuy.user.UserDAO;

@WebServlet("/toSellerProc")
public class toSellerProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// DB에 들어갈 변수
		String email = request.getParameter("email"); 
		String reason = request.getParameter("reason"); 
		
		// 확인용 변수
		String password = request.getParameter("password"); 
		String check = CheckNull.checkNull(request.getParameter("check")); 
		int user_id = Integer.parseInt(request.getParameter("id"));
		
		UserDAO userDAO = new UserDAO(); 
		MerchanDAO merchanDAO = new MerchanDAO(); 
		User user = userDAO.getUser(user_id);
		
		if(!user.getPassword().equals(password)) {
			out.println("<script> alert('비밀번호 값이 틀립니다.'); history.go(-1) </script>");
			return;
		}
		
		if(check.equals("")) {
			out.println("<script> alert('위 사항에 동의해야 신청 가능합니다.'); history.go(-1) </script>");
			return;
		}
		
		if(merchanDAO.insertSellerRegister(email, reason) > 0) {
			out.println("<script> alert('등록에 성공하였습니다.'); location.href='index.jsp' </script>");
		} else {
			out.println("<script> alert('등록에 실패하였습니다.'); history.go(-1) </script>");
		}
		
		out.close(); 
	}
}
