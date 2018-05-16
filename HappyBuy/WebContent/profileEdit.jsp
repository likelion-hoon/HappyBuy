<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User"%>
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
	<title>프로필 수정 페이지</title>
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
	<%@ include file="nav.jsp"%>
	<%
		String email = (String) session.getAttribute("userID");
		int user_id = userDAO.getUserIdx(email);
		User user = userDAO.getUser(user_id);
	%>

	<div class="container">
		<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
			<h2 style="margin-bottom:40px;"> 프로필 수정 페이지</h2>
			
			<form action="profileUpdate?idx=<%= user_id %> %>" method="POST" enctype="multipart/form-data">
				<div class="form-group"> 
					<img src="<%= userDAO.getProfile(user_id) %>" width="100px" height="100px" alt="error"/><br>
					<label for="now_password"> 현재 프로필 사진 </label>
					<input type="file" name="file" /> 
				</div>
				<div class="form-group">
					<label for="now_password"> 현재 비밀번호 (현재 비밀번호를 입력하셔야 수정이 가능합니다.)</label> 
					<input type="password" class="form-control" id="now_password" name="now_password"  />
				</div>
	
				<div class="form-group">
					<label for="new_password"> 새로운 비밀번호 (변경하고 싶지 않으시다면, 빈칸으로 남겨두세요.) </label> 
					<input type="password" class="form-control" id="new_password" name="new_password"  />
				</div>
	
				<div class="form-group">
					<label for="new_passcheck"> 새로운 비밀번호 확인 </label> 
					<input type="password" class="form-control" id="new_passcheck" name="new_passcheck"  />
				</div>
	
				<div class="form-group">
					<label for="address"> 주소 </label> 
					<input type="text" class="form-control" id="address" name="address" value="<%= user.getAddress() %>" />
				</div>
				
				<div class="form-group">
					<label for="pnumber"> 전화번호  </label> 
					<input type="text" class="form-control" id="pnumber" name="pnumber" value="<%= user.getPnumber() %>"  />
				</div>
	
				 <a href="<%= application.getContextPath() %>/myprofile.jsp" class="btn btn-info">돌아가기</a>
				<button type="submit" class="btn btn-primary">수정하기</button>
			</form>
		</div>
	</div>
	
	<%
		userDAO.close(); 
	%>
</body>
</html>