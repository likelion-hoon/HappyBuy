<!-- 회원가입 로직 페이지 -->

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ page import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User" %>
<%@ page import="java.io.PrintWriter" %>


<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- Bean 객체 등록 -->
<jsp:useBean id="user" class="com.jonghoon.happybuy.user.User" scope="page" /> 
<!-- Bean 객체의 모든 setter 함수 실행 값을 주입 -->
<jsp:setProperty name="user" property="*" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	PrintWriter pw = response.getWriter();
	
	String passcheck = request.getParameter("passcheck"); // passcheck는 DB에 저장되지는 않는다.
	
/* 	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	String number = request.getParameter("number");
	//  value=1 이면 남자, value=2 이면 여자
	boolean gender = Boolean.valueOf(request.getParameter("gender")); 
	String address = request.getParameter("address");
	String pnumber = request.getParameter("pnumber"); */
	
	// 값이 빈 곳이 있으면 이전 페이지로 돌려보낸다.
	if(user.getEmail()==null || user.getPassword()==null || user.getNumber()==null ||
			 user.getAddress()==null || user.getPnumber()==null) {
		pw.println("<script>");
		pw.println("alert('입력하지 않은 값이 있습니다.')");
		pw.println("history.go(-1)");
		pw.println("</script>");
		pw.close(); 
		return;
	}
	
	// 비밀번호 값이 체크값과 다르면 registration.jsp로 다시 보낸다.
	if(!user.getPassword().equals(passcheck)) {
		pw.println("<script>");
		pw.println("alert('비밀번호가 값이 다릅니다.')");
		pw.println("history.go(-1)");
		pw.println("</script>");
		pw.close(); 
		return;
	}
	
	// insertUser() 필요 
	UserDAO userDAO = new UserDAO(); 
	if(userDAO.insertUser(user)!=-1) {
		pw.println("<script>");
		pw.println("alert('회원가입이 완료되었습니다.')");
		pw.println("location.href='index.jsp'");
		pw.println("</script>");
		pw.close(); 
	} else {
		pw.println("<script>");
		pw.println("alert('회원가입에 실패하였습니다.')");
		pw.println("location.href='registration.jsp'");
		pw.println("</script>");
		pw.close(); 
	}
	
	userDAO.close(); 
%>