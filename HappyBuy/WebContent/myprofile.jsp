<!--  자신의 정보를 볼수 있는 페이지 -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	<title> 나의 프로필 </title>
	
	<style>
		.borderless td, .borderless th {
    		border: none;
		}
		
		ul {
			list-style: none; 
		}
	</style>
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
		
		if(!email.equals(user.getEmail())) {
			pw.println("<script> alert('접근 할 수 없습니다.'); location.href='index.jsp' </script>"); 
			pw.close(); 
			return;
		}
	%>
	<div class="container"> 
		<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
			
			<h2> 프로필 페이지 </h2>
			 
			<%-- <%= userDAO.getProfile(user_id) %> --%>
			<table class="table borderless" style="margin-top:30px;">
				<tr>
					<th>프로필 이미지</th>
					<td><img src="<%= userDAO.getProfile(user_id) %>" width="100px" height="100px" alt="error"/></td>
				</tr>
			
				<tr>
					<th>이메일</th>
					<td><%= user.getEmail() %></td>
				</tr>
				
				<tr>
					 <th>주민번호</th> 
					 <td><%= user.getNumber().concat("-*******") %></td>
				</tr>
				
				<tr>
					 <th> 성별 </th>
					 <td><%= user.isGender() ? "남자" : "여자" %></td>
				</tr>
				
				<tr>
					<th> 주소 </th> 
					<td><%= user.getAddress() %></td>
				</tr>
				
				<tr>
					<th> 핸드폰번호 </th> 
					<td> <%= user.getPnumber() %> </td>
				</tr>
				
				<tr>
					<th> 포인트 점수 </th> 
					<td> <%= user.getPoint() %> point </td>
				</tr>
			</table>
			
			<div class="user_info" style="margin-left:20px;margin-right:15px;margin-top:30px;">
				<div class="row">
					<div class="write col-xs-6 col-sm-6 col-md-6 col-lg-6" style="min-height:100px;border:1px solid black;border-radius:3px;">
						<h4> 작성한 게시글 </h4>
						<ul>
							<li> 1 </li>
							<li> 2 </li>
						</ul>
					</div>
					<div class="reply col-xs-6 col-sm-6 col-md-6 col-lg-6" style="min-height:100px;border:1px solid black;border-radius:3px;">
						<h4> 작성한 댓글 </h4>
						<ul>
							<li> 1 </li>
							<li> 2 </li>
						</ul>
					</div>
				</div>
			</div>
			<div class="btn_list" style="margin-top:30px;">
				<a href="<%= application.getContextPath() %>/board.jsp" class="btn btn-info">돌아가기</a>
				<a href="<%= application.getContextPath() %>/profileEdit.jsp" class="btn btn-primary"> 회원정보 수정</a>
			</div>
		</div>
	</div>
</body>
</html>

