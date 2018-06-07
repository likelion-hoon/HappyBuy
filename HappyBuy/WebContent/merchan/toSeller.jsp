<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 판매자 신청 페이지 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
<script src="<%=application.getContextPath()%>/js/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="<%=application.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=application.getContextPath()%>/css/bootstrap-theme.min.css">
<script src="<%=application.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/css/nav.css">
<title>판매자 신청</title>

<style>
	#reason {
		padding: 0 40 0 0;
		min-height: 250px;
	}
	
	#guide {
		text-align: justify;
		white-space: normal;
	}
</style>
</head>
<% 
	if(session.getAttribute("userID")==null) {
		out.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='../login.jsp' </script>");
		out.close();  
	}
%>

<body>
	<%@ include file="../nav.jsp"%>
	<% 
	 	User user = userDAO.getUser(userDAO.getUserIdx((String)session.getAttribute("userID")));
	 	if(user.isSeller()) {
	 		out.println("<script> alert('이미 판매자 입니다.'); location.href='new.jsp' </script>");
			out.close();  
	 	}
	%> 
	
	<div class="container">
		<form action="../toSellerProc" method="POST">
			<!-- DB 테이블에 저장하고 관리자 페이지에서 볼수 있게 설정하기 -->
			<div class="form col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
				<h2 style="margin-bottom:20px;">판매자 신청 페이지</h2>
				
				<hr />
				<input type="hidden" class="form-control" name="id" value="<%=  userDAO.getUserIdx((String)session.getAttribute("userID")) %>" />
				
				<!-- 판매자 이름 -->
				<div class="form-group">
					<label for="email">유저 Email</label>
					<input type="email" class="form-control" id="email" name="email" value="<%= session.getAttribute("userID") %>" readonly>
				</div>
				
				<!-- 신청 이유  -->
				<div class="form-group">
					<label for="reason">신청 이유</label>
					<textarea id="reaseon" rows="10" cols="80" style="margin-bottom:20px;" name="reason" class="form-control">
					</textarea>
				</div>
				
				<!-- 본인 비밀번호 입력 -->
				<div class="form-group">
					<label for="password"> 비밀번호 확인 </label>
					<input type="password" class="form-control" id="password" placeholder="비밀번호 입력" name="password">
				</div>
		
				<div class="guide" style="margin-bottom:20px;">
					<label for="reason">신청 이유</label>
					<textarea id="guide" rows="10" cols="80" style="margin-bottom:20px;" class="form-control" readonly> 
						판매자의 자격을 얻게 되면, HappyBuy에 물품을 올릴수 있습니다. 
						가격과 마감기한 설정은 판매자 자유이며, 법으로 금지된 물품을 올릴 시에 
						관리자에 의해 탈퇴처리 될 수 있습니다. 또한, 관리자 판단하에 불합리한 행동과 태도에 대해서는
					    적절한 조치가 있을 예정이니 주의 바랍니다.
					</textarea>
					
					<div class="checkbox">
					    <label> <input type="checkbox" name="check" value="YES"> 위 글을 모두 읽었으며, 동의합니다. </label>
				 	</div>
				</div>
				
				<button type="submit" class="btn btn-primary">신청</button>
			</div>
		</form>
	</div>
</body>
</html>