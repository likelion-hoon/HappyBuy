<!-- 로그인 로직 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.jonghoon.happybuy.user.UserDAO"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		UserDAO userDAO = new UserDAO(); 

		String email = request.getParameter("email"); 
		String password = request.getParameter("password");
		
		
		if(userDAO.login(email,password)) {
			session.setAttribute("userID", email);
			response.sendRedirect("index.jsp"); 
		} else {
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>