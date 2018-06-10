<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="com.jonghoon.happybuy.user.User" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 상품 등록 사이트 -->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	<title>상품 등록 페이지</title>
	
	
	<script type="text/javascript">
		function doChange(srcE, targetId){
		    var val = srcE.options[srcE.selectedIndex].value;
		    var targetE = document.getElementById(targetId);
		    removeAll(targetE);
			
			if(val == 1) {
				addOption('남성상의', targetE, val, 1);
				addOption('여성상의', targetE, val, 2);
				addOption('남성신발', targetE, val, 3);
				addOption('여성신발', targetE, val, 4);
				addOption('스카프', targetE, val, 5);
				addOption('모자', targetE, val, 6);
				addOption('양말', targetE, val, 7);
			} else if(val == 2) {
				addOption('과자', targetE, val, 1);
				addOption('라면', targetE, val, 2);
				addOption('냉동식품', targetE, val, 3);
				addOption('정육', targetE, val, 4);
				addOption('과일', targetE, val, 5);
				addOption('생선', targetE, val, 6);
				addOption('야채', targetE, val, 7);
			} else if(val == 3) {
				addOption('에어컨', targetE, val, 1);
				addOption('냉장고', targetE, val, 2);
				addOption('TV', targetE, val, 3);
				addOption('세탁기', targetE, val, 4);
				addOption('식탁', targetE, val, 5);
				addOption('컴퓨터', targetE, val, 6);
				addOption('침대', targetE, val, 7);
			}
		}	
		
		function addOption(value, e, val, num){
		    var o = new Option(value);
		    o.value = val+num;
		    e.add(o);
		}

		function removeAll(e){
		    for(var i =  e.options.length-1; i>=0; i--) {
		    	e.remove(i);
		    }
		}
	</script>
</head>

<body>
	<%@ include file="../nav.jsp" %> 
	<%
		if(session.getAttribute("userID")==null) {
			out.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='../login.jsp' </script>");
			out.close();  
		}
		
		User user = userDAO.getUser(userDAO.getUserIdx((String)session.getAttribute("userID")));
		if(!user.isSeller()) {
			out.println("<script> alert('권한이 없습니다.'); location.href='toSeller.jsp' </script>");
			out.close(); 
			return; 
		}
	%>
	
	<div class="container" style="margin-top:60px;">
			<!-- desktop만 고려 -->
			<div class="col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
				<h2 style="margin-bottom:30px;"> 상품 등록 페이지 </h2>
				<form action="../uploadMerchanProc" method="POST" enctype="multipart/form-data">
				
					<!--  idx값 히든으로 넘기기 -->
					<input type="hidden" name="idx" value="<%= userDAO.getUserIdx((String)session.getAttribute("userID")) %>" />
					
					<!-- 첫 분류(옷, 음식, 주거) -->
					<div class="form-group">
						<label for="big">대분류 &nbsp;:&nbsp;</label> 
						<select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
							<option value="1" selected>옷</option>
							<option value="2">음식</option>
							<option value="3">주거</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="middle">중분류 &nbsp;:&nbsp;</label> 
						<select name="selTwo" id="selTwo">
							<option value="FOOD1">남성상의</option>
							<option value="FOOD2">여성상의</option>
							<option value="FOOD3">남성신발</option>
							<option value="FOOD4">여성신발</option>
							<option value="FOOD5">스카프</option>
							<option value="FOOD6">모자</option>
							<option value="FOOD7">양말</option>
						</select>
					</div>
				
					<div class="form-group row">
						<div class="col-md-6 col-lg-6">
							<label for="title">상품명</label> 
							<input type="text" class="form-control" id="title" name="title" placeholder="상품명" >
						</div>
						<div class="col-md-6 col-lg-6">
							<label for="price">가격</label>
							<input type="text" class="form-control" id="price" name="price" placeholder="가격">
						</div>
					</div>
					
					<!-- 상품 설명 -->
					<div class="form-group">
						<label for="address">상품 설명</label>
						<textarea style="min-height:250px" class="form-control" id="address" name="address" placeholder="상품 설명"></textarea>
					</div>
					
					<!-- 상품 등록 마감 날짜(DueDate) -->
					<div class="form-group">
						<label for="duedate"> 마감 날짜 &nbsp;:&nbsp; </label>
						<!--  년  -->
						<select name="year" id="year">
							<%
								int year = Integer.parseInt(new SimpleDateFormat("yyyy").format(new Date()));
								for(int i=year; i<=year+2; i++) {
							%> <option value="<%= i %>"><%= i %>년</option>
							<% } %>
						</select>
						
						<!--  월  -->
						<select name="month" id="month">
							<%
								for(int i=1; i<=12; i++) {
							%> <option value="<%= i %>"><%= i %>월</option>
							<% } %>
						</select>
						
						<!--  일  -->
						<select name="day" id="day">
							<%
								for(int i=1; i<=31; i++) {
							%> <option value="<%= i %>"><%= i %>일</option>
							<% } %>
						</select>
					</div>
					
					<!-- 사진 업로드 -->
					<div class="form-group">
						<label for="picUrl">사진업로드</label>
						<input type="file" name="file">
					</div>
					
					<button type="submit" class="btn btn-primary">작성</button>
				</form>
			</div>
	</div>
	
</body>
</html>