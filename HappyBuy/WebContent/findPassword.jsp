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
	<title> 비밀번호 찾기 </title>
	
	<script language="javascript">
		// jQuery 문법
		$(document).ready(function() {
			$("#emailLast").on("change", function() {
				$("#email2").val($(this).val());
			});
		});
	</script>
</head>
<body>
	<%@ include file="nav.jsp" %>
	
	<div class="container" style="margin-top:80px;"> 
		<!-- 이메일, 휴대폰 번호 입력하면 해당 이메일로 임시 비밀번호 알려주기 -->
		<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
			<h3> 비밀번호 찾기 </h3>
			
			<hr />
			
			<!--  form tag  -->
			<form action="findPasswordProc" method="GET">
				
				<div class="form-group">
					<label> 이메일을 입력하세요 </label><br />
					<input type="text" class="form-control input-sm" style="width:100px;display:inline;" id="email1" name="email1" />
					@
					<input type="text" class="form-control input-sm" style="width:100px;display:inline;"id="email2" name="email2" />
					
					<select id="emailLast" name="emailLast" style="display:inline;">
							<option value="" selected>직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.com">google.com</option>
					</select>
				</div>
				
				<div class="form-group">
					<label style="margin-bottom:10px;"> 휴대폰 번호 </label><br />
					<input class="form-control input-sm" style="width:170px;display:inline;" id="pnumber" name="pnumber" placeholder="'-'표기 없이 숫자만 입력" />
				</div>
				
				<button type="submit" class="btn btn-primary" style="margin-left:5px;"> 확인 </button>
			</form>
		</div>
	</div>
</body>
</html>