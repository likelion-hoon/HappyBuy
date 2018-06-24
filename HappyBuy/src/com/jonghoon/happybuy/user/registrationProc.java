package com.jonghoon.happybuy.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.util.SHA256;

@WebServlet("/registrationProc")
public class registrationProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserDAO userDAO = new UserDAO(); 
		
		// email은 email1과 email2를 합친다.
		
		String email1 = request.getParameter("email1"); 
		String email2 = request.getParameter("email2"); 
		String email = email1 + "@" + email2; 
		
		String password = request.getParameter("password"); 
		String passcheck = request.getParameter("passcheck");
		
		String number = request.getParameter("datepicker"); 
		
		boolean gender = request.getParameter("gender").equals("1") ? true : false;
		
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String addrDetail = request.getParameter("addrDetail");
		String address = roadAddrPart1 +" "+ addrDetail;
		
		String pnumber = request.getParameter("pnumber"); 
		
		User user = new User(email,password,number,gender,address,pnumber," ",SHA256.getSHA256(email), false);
		
		// 입력값 체크 조건문
		if(email.isEmpty() || password.isEmpty() || passcheck.isEmpty() || number.isEmpty() ||
				address.isEmpty() || pnumber.isEmpty()) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.go(-1) </script>");
			out.close(); 
			return;
		}
		
		// 비밀번호 일치확인 조건문
		if(!password.equals(passcheck)) {
			out.println("<script> alert('비밀번호 값이 다릅니다.'); history.go(-1) </script>");
			out.close(); 
			return;
		}
		
		// 입력값 DB에 저장
		if(userDAO.insertUser(user) != -1) {
			out.println("<script>");
			out.println("location.href='authen/emailSendAction.jsp?email="+email+"'");
			out.println("</script>"); 
		} else {
			out.println("<script> alert('회원가입에 실패하였습니다.'); history.go(-1) </script>");
		}
		
		out.close(); 
	}
}
