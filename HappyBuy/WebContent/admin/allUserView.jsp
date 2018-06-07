<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO, com.jonghoon.happybuy.user.User" %>
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
	<title> 유저 목록 </title>
</head>
<%
	UserDAO userDAO = new UserDAO(); 
	ArrayList<User> list = userDAO.getUserList(); 
	System.out.println(list.size());
%>
<body>
	<%@ include file="nav.jsp" %>
	
	<div class="container" style="margin-top:80px;">
		<h2 style="text-align:center;"> HappyBuy 유저 목록 </h2>
		<table class="table table-hover" style="margin-top:40px;">
			<thead>
				<tr>
				   <td>프로필 사진</td>
				   <td>유저번호</td>
				   <td>이메일</td>
				   <td>주민등록번호</td>
				   <td>성별</td>
				   <td>주소</td>
				   <td>핸드폰 번호</td>
				   <td>활동점수</td>
				</tr>
		  	</thead>
		  	<tbody>
		  		<% for(int i=0; i<list.size(); i++) { %>
		  			<tr>
		  				<td><%= list.get(i).getProfilePath() %></td>
		  				<td><%= list.get(i).getIdx() %></td>
		  				<td><%= list.get(i).getEmail() %></td>
		  				<td><%= list.get(i).getNumber() %></td>
		  				<% if(list.get(i).isGender()) { %> 
		  				<td>남자</td>
		  				<% } else { %>
		  				<td>여자</td>
		  				<% } %>
		  				<td><%= list.get(i).getAddress() %></td>
		  				<td><%= list.get(i).getPnumber() %></td>
		  				<td><%= list.get(i).getPoint() %></td>
		  			</tr>
		  		<% } %>
		  	</tbody>
		</table>
	</div>
</body>
</html>