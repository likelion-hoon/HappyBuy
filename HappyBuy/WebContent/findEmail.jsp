<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	<title> 이메일 찾기 </title>
</head>
<body>
	<%@ include file="nav.jsp" %>
	
	<div class="container" style="margin-top:80px;"> 
		<!-- 휴대폰 번호 입력하면 email 알려주기 -->
		<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
			<h3> 이메일 찾기 </h3>
			
			<form action="findEmailProc" method="GET">
				<hr />
				<label style="margin-bottom:10px;"> 휴대폰 번호를 입력하세요 </label><br />
				<input class="form-control" style="width:170px;display:inline;" id="pnumber" name="pnumber" placeholder="'-'표기 없이 숫자만 입력" />
				<button type="submit" class="btn btn-primary" style="margin-left:5px;"> 확인 </button>
			</form>
		</div>
	</div>
</body>
</html>