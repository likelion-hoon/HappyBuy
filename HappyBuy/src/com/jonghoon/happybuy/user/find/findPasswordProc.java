package com.jonghoon.happybuy.user.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.user.UserDAO;

@WebServlet("/findPasswordProc")
public class findPasswordProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		UserDAO userDAO = new UserDAO();
		PrintWriter out = response.getWriter(); 
		
		String pnumber = request.getParameter("pnumber"); 
		
		String email1 = request.getParameter("email1"); 
		String email2 = request.getParameter("email2"); 
		
		String email = email1.concat("@").concat(email2);
		
		// 값이 일치하면 임시비밀번호를 해당 이메일로 보낸다
		if(userDAO.findPasswordCheck(email, pnumber)) {
			out.println("<script> location.href='responsePassword.jsp?email="+email+"'; </script>");
		} else { // 값이 일치하지 않으면
			out.println("<script> alert('값이 일치하지 않습니다.'); history.go(-1) </script>"); 
		}
		
		out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
