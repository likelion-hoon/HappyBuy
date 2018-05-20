<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	
	<title>HappyBuy 로그인 페이지</title>
	
	<style>
		input {
			margin-bottom: 15px; 
		}
	</style>
</head>

<%
	PrintWriter pw = response.getWriter(); 
	if(session.getAttribute("userID")!=null) {
		pw.println("<script>");
		pw.println("alert('이미 로그인한 상태입니다.')");
		pw.println("location.href='index.jsp'");
		pw.println("</script>");
		pw.close(); 
		return; 
	}
%>

<body>
	<%@ include file="nav.jsp" %>
	<div class="container" style="margin-top:60px;"> 
		<div class="row">
			<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-offset-6">
			
				<h2 style="margin-bottom:30px;">로그인 페이지</h2>
				<hr />
				
				<!--  회원, 관리자 로그인 구분 radio button -->
				<div class="user_select">
			    	<label for="customer">
			    		<input type="radio" class="radio" name="user" id="customer" value="Y" checked> 회원
			    	</label>
			    	<label for="admin">
			    		<input type="radio" class="radio" name="user" id="admin" value="N" > 관리자
			    	</label>
	    		</div>
				
				<form action="loginProc" method="POST">
					<div class="form-group">
						<input type="email" class="form-control col-sm-3" id="email" name="email"
							placeholder="이메일" style="width:60%;">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="비밀번호" style="width:60%;">
					</div>
					
					<!-- 세션 객체의 시간을 늘린다. -->
					<div class="form-group">
						<input type="checkbox" id="checkbox" name="checkbox" value="checkbox" class="form-check-input"> 로그인 상태 유지<br>
					</div>
					
					<div class="links">
						<p> <a href="#">아이디 찾기</a>&nbsp; |&nbsp; <a href="#">비밀번호 찾기</a> &nbsp;|&nbsp; <a href="<%= application.getContextPath() %>/registration.jsp">회원가입</a></p>
					</div>
					
					<button style="margin-top:15px;" type="submit" class="btn btn-primary">로그인</button>
					
					<hr />
				</form>
			</div>
		</div>
	</div>
</body>
</html>