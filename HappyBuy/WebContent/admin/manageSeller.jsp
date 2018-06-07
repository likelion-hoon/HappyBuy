<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.merchandise.MerchanDAO, com.jonghoon.happybuy.merchandise.sellerRegisterDTO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	
	<title>판매자 관리</title>
</head>
<%
	MerchanDAO merchanDAO = new MerchanDAO(); 
	UserDAO userDAO = new UserDAO();  
	ArrayList<sellerRegisterDTO> list = merchanDAO.getRegisterList(); 
%>
<body>
	<%@ include file="nav.jsp" %>
	<div class="container" style="margin-top:80px;">
		<h2 style="text-align:center;"> 판매자 신청 목록 </h2>
		<table class="table table-hover" style="margin-top:40px;">
			<thead>
				<tr>
				   <th>회원 이메일</th>
				   <th>신청 사유</th>
				   <th>날짜</th>
				   <th>승인</th>
				   <th>취소</th>
				</tr>
		  	</thead>
		  	<tbody>
		  		<% for(int i=0; i<list.size(); i++) { %>
		  			<tr>
				 	  <td><%= list.get(i).getEmail() %></td>
				 	  <td><%= list.get(i).getReason() %></td>
				 	  <td><%= list.get(i).getDate() %></td>
				 	  <% if(!userDAO.getUser(userDAO.getUserIdx(list.get(i).getEmail())).isSeller()) { %>
				 	  <td><a href="../permitSeller?idx=<%= userDAO.getUserIdx(list.get(i).getEmail()) %>" class="btn btn-success">승인</a></td>
				 	  <td><a href="../cancelDemand?idx=<%= userDAO.getUserIdx(list.get(i).getEmail()) %>" class="btn btn-warning">요청취소</a></td>
				 	  <% } else { %>
				 	  <td><a href="../cancelSeller?idx=<%= userDAO.getUserIdx(list.get(i).getEmail()) %>" class="btn btn-success">판매자 취소</a></td>
				 	  <% } %>
					</tr>
				<% } %>
		  	</tbody>
		</table> 
	</div>
</body>
</html>