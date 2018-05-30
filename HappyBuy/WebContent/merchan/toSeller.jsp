<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 판매자 신청 페이지 -->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	<title>판매자 신청</title>
</head>
<body>
	<%@ include file="../nav.jsp" %> 
	<h2> 판매자 신청 페이지 입니다.  </h2>
</body>
</html>