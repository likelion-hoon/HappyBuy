<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	<link rel="stylesheet" href="css/footer.css">
	
	<title>HappyBuy 메인페이지</title>
</head>

<body>
	<%@ include file="nav.jsp" %>
	
	
	
    <%@ include file="footer.jsp" %>
    <%
    	userDAO.close(); 
    %>
</body>
</html>