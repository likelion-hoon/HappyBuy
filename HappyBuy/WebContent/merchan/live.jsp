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
	
	<title>주거 쇼핑 페이지</title>
</head>
<body>
	<%@ include file="../nav.jsp" %> 
	
	<div class="container" style="margin-top:60px;">
		<div class="col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10" style="margin-bottom:50px;">
			<h2 style="margin-bottom:30px;"> 의류 </h2>
			
			<div class="all" style="margin-bottom:10px;">
				<label><input type="checkbox" name="cloth" /> 전체 </label>
			</div>
			
			<div class="others">
				<label class="others"><input name="cloth" type="checkbox" value="CLOT1" /> 남성상의 </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT2" /> 여성상의 </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT3" /> 남성신발 </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT4" /> 여성신발 </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT5" /> 스카프  </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT6" /> 모자 </label>
				<label class="others"><input name="cloth" type="checkbox" value="CLOT7" /> 양말 </label>
			</div>
		</div>
		
		<hr /> <!--  밑에는 반복문으로 상품이 보여진다 -->
		
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