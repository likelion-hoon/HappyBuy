<!-- 게시글 작성 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<title>글 작성 페이지</title>
<style>
	textarea {
		min-height: 250px;
	}
</style>
</head>
<body>
	<%@ include file="nav.jsp" %>
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div
				class="col-xs-offset-2 col-xs-8 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
				<form action="/create.jsp" method="POST">
					<div class="form-group">
						<label for="title">글 제목</label> 
						<input type="text" class="form-control" id="title" name="title" placeholder="글 제목" />
					</div>

					<div class="form-group">
						<label for="content">글 내용</label>
						<textarea class="form-control" id="content" name="content" placeholder="글 내용"></textarea>
					</div>
					
					<input type="hidden" id="name" name="name" value="<%= session.getAttribute("userID") %>" /> 
					
					<a href="/board.jsp" class="btn btn-info">돌아가기</a>
					<button type="submit" class="btn btn-primary">작성</button>
				</form>
			</div>
		</div>
	 </div>
</body>
</html>