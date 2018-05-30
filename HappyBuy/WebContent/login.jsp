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
	
	<script>
        function chooseForm(radioName) {
            var radios = document.getElementsByName(radioName); 
            for(var i=0, len = radios.length; i < len; i++) {
                document.getElementById('form_' + radios[i].value).style.display = 'none';
                if(radios[i].checked) {
                    document.getElementById('form_' + radios[i].value).style.display = 'block';
                }
            }
        }
    </script>
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
	<div class="container" style="margin-top:80px;"> 
	
		<div class="col-md-offset-4 col-md-6 col-lg-offset-4 col-lg-offset-6">
			<!--  회원, 관리자 로그인 구분 radio button -->
		    <label for="customer"><input type="radio" name="formType" id="customer" value="1" onclick="chooseForm(this.name)" checked> 회원 </label>
		    <label for="admin"><input type="radio" name="formType" id="admin" value="2" onclick="chooseForm(this.name)"> 관리자 </label>
		</div>
		
		<!-- 회원 로그인 -->
		<div id="form_1">
			<div class="col-md-offset-4 col-md-6 col-lg-offset-4 col-lg-offset-6">
				<h2 style="margin-bottom:30px;"> 회원 로그인 </h2>
				
				<form action="loginProc" method="POST">
					<div class="form-group">
						<input type="email" class="form-control col-sm-3" id="email" name="email" placeholder="이메일" style="margin-bottom:10px;width:60%;">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" style="width:60%;">
					</div>
					
					<div class="form-group">
						<input type="checkbox" id="checkbox" name="checkbox" value="checkbox" class="form-check-input"> 로그인 상태 유지<br>
					</div>
					
					<div class="links">
						<p> <a href="#">아이디 찾기</a>&nbsp; |&nbsp; <a href="#">비밀번호 찾기</a> &nbsp;|&nbsp; <a href="<%= application.getContextPath() %>/registration.jsp">회원가입</a></p>
					</div>
					
					<button style="margin-top:15px;" type="submit" class="btn btn-primary">로그인</button>
					
				</form>
			</div>
		</div>
		
		<!-- 관리자 로그인 -->
		<div id="form_2" style="display:none;">
			<div class="col-md-offset-4 col-md-6 col-lg-offset-4 col-lg-offset-6">
				<h2 style="margin-bottom:30px;"> 관리자 로그인 </h2>
		
				<form action="adminLoginProc" method="POST">
					<div class="form-group">
						<input type="text" class="form-control col-sm-3" id="identi" name="identi" placeholder="아이디" style="margin-bottom:10px;width:60%;">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" style="width:60%;">
					</div>
					
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>