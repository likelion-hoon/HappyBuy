<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="com.jonghoon.happybuy.user.User" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 상품 등록 사이트 -->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	<title>상품 등록 페이지</title>
</head>

<body>
	<%@ include file="../nav.jsp" %> 
	<%
		if(session.getAttribute("userID")==null) {
			out.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='../login.jsp' </script>");
			out.close();  
		}
		
		User user = userDAO.getUser(userDAO.getUserIdx((String)session.getAttribute("userID")));
		if(!user.isSeller()) {
			out.println("<script> alert('권한이 없습니다.'); </script>");
			out.close(); 
			return; 
		}
	%>
	<h3> 상품 등록 페이지</h3>
	
	
</body>
</html>