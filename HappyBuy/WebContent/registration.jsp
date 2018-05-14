<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
    
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
	
	<style>
		input {
			width:50px;
		}
	</style>
</head>

<%
	PrintWriter pw = response.getWriter(); 
	if(session.getAttribute("userID")!=null) {
		pw.println("<script> alert('로그인된 상태입니다.'); location.href='index.jsp' </script>");
		return;
	}
%>

<body>
	<%@ include file="nav.jsp" %>
	<div class="container" style="margin-top:60px;">
		<div class="row">
			<div class="col-xs-offset-2 col-xs-8 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
				<h2 style="margin-bottom:30px;"> 회원가입 페이지 </h2>
				<form action="registrationProc" method="POST">
					<div class="form-group">
						<label for="title">이메일</label> 
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일" >
					</div>
	
					<div class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
					</div>
					
					<div class="form-group">
						<label for="passcheck">비밀번호 확인</label>
						<input  type="password" class="form-control" id="passcheck" name="passcheck" placeholder="비밀번호 확인">
					</div>
					
					<div class="form-group">
						<label for="number">주민등록번호 앞 6자리</label>
						<input class="form-control" id="number" name="number" placeholder="주민등록번호 앞 6자리">
					</div>
					
					<div class="form-group">
						<label for="gender">성별</label>
						<div class="radio">
  							<label><input type="radio" name="gender" value="true" checked>남자</label>
						</div>
						<div class="radio">
  							<label><input type="radio" name="gender" value="false">여자</label>
						</div>
					</div>
					
					<!-- 주소 -->
					<div class="form-group">
						<label for="address">주소(시, 구, 동)</label>
						<input class="form-control" id="address" name="address" placeholder="주소(시, 구, 동)">
					</div>
					
					<!-- 핸드폰 번호 -->
					<div class="form-group">
						<label for="pnumber">핸드폰 번호</label>
						<input class="form-control" id="pnumber" name="pnumber" placeholder="핸드폰 번호">
					</div>
					
					<button type="submit" class="btn btn-primary">작성</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>