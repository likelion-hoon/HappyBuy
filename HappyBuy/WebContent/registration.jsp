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
	
	<!--  datepicker를 위한 import -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<title> 회원가입 페이지 </title>
	
	<style>
		input {
			width:50px;
		}
	</style>
	<script language="javascript">
	
		$(function() {
			$("#datepicker").datepicker({
				dateFormat: 'yyyy-mm-dd'	
			});
		});
	
		function goPopup(){
			var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		
		function jusoCallBack(roadAddrPart1,addrDetail){
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.addrDetail.value = addrDetail;
		}
		
		// jQuery 문법
		$(document).ready(function() {
			$("#emailLast").on("change", function() {
				$("#email2").val($(this).val());
			});
		});
		
	</script>
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
			<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
				<h2 style="margin-bottom:30px;"> 회원가입 페이지 </h2>
				
				<hr />
				
				<form name="form" id="form" action="registrationProc" method="POST" >
					<div class="form-group">
						<label for="title">이메일</label> 
						<br />
						<input type="text" class="form-control input-sm" style="width:100px;display:inline;" id="email1" name="email1" placeholder="이메일" />
						@
						<input type="text" class="form-control input-sm" style="width:100px;display:inline;" id="email2" name="email2" placeholder="회사" />
						
						<select id="emailLast" name="emailLast" style="display:inline;">
							<option value="" selected>직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.com">google.com</option>
						</select>
					</div>
	
					<div class="password row">
						<div class="form-group col-md-6 col-lg-6">
							<label for="password">비밀번호</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
						</div>
						<div class="form-group col-md-6 col-lg-6">
							<label for="passcheck">비밀번호 확인</label>
							<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="비밀번호 확인">
						</div>
					</div>
					
					<!-- 생년월일 설정 -->
					<div class="form-group">
						<label for="duedate">만료 날짜 : </label> <input type="text" style="width:150px;display:inline;" class="form-control" id="datepicker" name="datepicker" 
						placeholder="클릭 시 달력" autocomplete="off" />
					</div>
					
					<div class="form-group">
						<label for="gender">성별</label>&nbsp;
						<div class="radio" style="display:inline">
  							<label><input type="radio" name="gender" value="true" checked>남자</label>
  						</div>
						<div class="radio" style="display:inline;">
  							<label><input type="radio" name="gender" value="false">여자</label>
						</div>
					</div>
					
					<!-- 주소 -->
					<div class="form-group row">
						<div class="col-md-6 col-lg-6">
							<label>도로명주소</label>
							<input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1" placeholder="도로명 주소"/>
						</div>
						
						<div class="col-md-6 col-lg-6">
							<label>고객입력 상세주소</label> 
							<input type="text" class="form-control" id="addrDetail" name="addrDetail" placeholder="상세 주소"/>
						</div>
					</div>
					
					<div class="addrButton" style="margin-bottom:25px;">
						<a class="btn btn-sm btn-default" onclick="goPopup();">주소검색</a>
					</div>
					
					<!-- 핸드폰 번호 -->
					<div class="form-group">
						<label for="pnumber">핸드폰 번호</label>&nbsp;&nbsp;
						<input class="form-control" style="width:170px;display:inline;" id="pnumber" name="pnumber" placeholder="'-'표기 없이 숫자만 입력" />
					</div>
					
					<hr />
					
					<a href="index.jsp" class="btn btn-warning">메인화면</a>
					<button type="submit" class="btn btn-primary">제출</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>