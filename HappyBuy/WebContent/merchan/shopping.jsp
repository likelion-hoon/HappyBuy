<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	
	<title> 의류 쇼핑 페이지 </title>
	
	<style>
		label[class=merchan] {
			margin-right:23px;
		}
		
		.merchan_list li {
			margin:10px 10px;
			height:300px;
			width:31%;
			float:left;
			border:1px solid black;
			border-radius:15px;
		}
	</style>
</head>
<body>
	<%
		if(session.getAttribute("userID")==null) {
			out.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='../login.jsp' </script>");
			out.close();  
		}
	%>
	
	<%@ include file="../nav.jsp" %> 
	
	<div class="container" style="margin-top:60px;">
		<div class="distribute" style="margin-bottom:50px;margin-left:50px;">
			<h2 style="margin-bottom:30px;"> HappyBuy </h2>
			
			<div class="all" style="margin-bottom:10px;">
				<label><input type="checkbox" name="cloth" checked/> 전체 </label>
			</div>
			
			<hr />
			
			<div style="margin-bottom:10px;">
				<p> 대분류 </p>
				<label class="category"><input type="checkbox" name="cloth" /> 의류 </label>
				<label class="category"><input type="checkbox" name="cloth" /> 음식 </label>
				<label class="category"><input type="checkbox" name="cloth" /> 주거 </label>
			</div>
			
			<hr />
			
			<div class="others">
				<p> 중분류 </p>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT1" /> 남성상의 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT2" /> 여성상의 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT3" /> 남성신발 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT4" /> 여성신발 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT5" /> 스카프  </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT6" /> 모자 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="CLOT7" /> 양말 </label>
				
				<br>
				
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD1" /> 과자 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD2" /> 라면 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD3" /> 냉동식품 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD4" /> 정육 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD5" /> 과일  </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD6" /> 생선 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="FOOD7" /> 야채 </label>
				
				<br>
				
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE1" /> 에어컨 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE2" /> 냉장고 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE3" /> TV </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE4" /> 세탁기 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE5" /> 식탁  </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE6" /> 컴퓨터 </label>
				<label class="merchan"><input name="cloth" type="checkbox" value="LIVE7" /> 침대 </label>
			</div>
			
			<hr />
		</div>
		
		
		<!--  밑에는 반복문으로 상품이 보여진다 -->
		
		<div>
			<ul style="list-style:none;" class="merchan_list">
				<li>
					   <div class="merchan_box">
							<div class="info">
								<img src="#" />
								<p> 제목제목제목1 </p>
								<p> 가격가격가격1 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목2 </p>
								<p> 가격가격가격2 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목3 </p>
								<p> 가격가격가격3 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목4 </p>
								<p> 가격가격가격4 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목5 </p>
								<p> 가격가격가격5 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목5 </p>
								<p> 가격가격가격5 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
				
				
				<li>
					   <div class="merchan_box">
					   		<div class="info">
								<img src="#" />
								<p> 제목제목제목6 </p>
								<p> 가격가격가격6 </p>
								<hr />
								<p> 2018-06-21 </p>
							</div>
					   </div>
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>