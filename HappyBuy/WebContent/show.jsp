<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.BoardDAO" %>

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
	
	<title> view 페이지 </title>
</head>
<%
	int p = Integer.parseInt(request.getParameter("page")); 
	BoardDAO boardDAO = new BoardDAO(); 
	Board board = boardDAO.getBoard(p);
%>

<body>
	<p><%= p %></p>
</body>
</html>


