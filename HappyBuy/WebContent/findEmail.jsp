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
	<title> 아이디 찾기 </title>
</head>
<body>
	<div class="container" style="margin-top:30px;"> 
		<!-- 휴대폰 번호 입력하면 email 알려주기 -->
		<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
			<h3> 아이디 찾기 </h3>
			<hr />
			<form action="#" method="GET">
				<label style="margin-bottom:10px;"> 휴대폰 번호를 입력하세요 </label><br />
				010 - <input type="text" class="form-control" name="fpnum" style="width:50px;display:inline"> - <input type="text" class="form-control" name="spnum" style="width:50px;display:inline">
				<a type="submit" class="btn btn-primary" > 확인 </a>
			</form>
		</div>
	</div>
</body>
</html>