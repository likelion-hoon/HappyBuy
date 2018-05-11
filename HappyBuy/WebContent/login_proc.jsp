<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Bean 객체 등록 -->
<jsp:useBean id="user" class="com.jonghoon.happybuy.user.User" scope="page" /> 

<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="password" />

<%
	request.setCharacterEncoding("UTF-8");
	
	PrintWriter pw = response.getWriter(); 
	UserDAO userDAO = new UserDAO(); 
	
	// 값이 빈 곳이 있으면 이전 페이지로 돌려보낸다.
	if(user.getEmail()==null || user.getPassword()==null ) {
		pw.println("<script>");
		pw.println("alert('입력하지 않은 값이 있습니다.')");
		pw.println("history.go(-1)");
		pw.println("</script>");
		pw.close(); 
		return;
	}
	
	
	if(userDAO.login(user.getEmail(),user.getPassword())) {
		session.setAttribute("userID", user.getEmail());
		pw.println("<script>");
		pw.println("alert('로그인에 성공하였습니다.')");
		pw.println("location.href='index.jsp'");
		pw.println("</script>");
		pw.close(); 
	} else {
		pw.println("<script>");
		pw.println("alert('입력값이 틀렸습니다.')");
		pw.println("history.go(-1)");
		pw.println("</script>");
		pw.close(); 
	}
%>
