<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	<title> 프로필 수정 페이지 </title>
</head>
<%
	PrintWriter pw = response.getWriter();
	
	if (session.getAttribute("userID") == null) {
		pw.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='login.jsp' </script>");
		pw.close();
		return;
	}
%>

<body>
	<%@ include file="nav.jsp" %>
	<%
		String email = (String) session.getAttribute("userID");
		int user_id = userDAO.getUserIdx(email);
		User user = userDAO.getUser(user_id); 
	%>

</body>
</html>