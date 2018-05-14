<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.Board" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.jonghoon.happybuy.file.downloadAction" %>
<%@ page import="java.io.PrintWriter" %> 

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-labeleme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	
	<title> view 페이지 </title>
</head>
<%
	// 로그인 확인 코드
	PrintWriter pw = response.getWriter(); 
	if(session.getAttribute("userID")==null) {
		pw.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='login.jsp' </script>");
		pw.close(); 
		return; 
	}
	int num = Integer.parseInt(request.getParameter("idx")); 
	BoardDAO boardDAO = new BoardDAO(); 
	boardDAO.increaseHit(num); // 조회수 증가
	Board board = boardDAO.getBoard(num);
	
	String fileRealName = board.getFileRealName();
	boardDAO.close(); 
%>

<body>
    <%@ include file="nav.jsp" %>
	<div class="container" style="margin-top:80px;">
	  <div class="upper">
		<div class="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<label> 글 번호 </label>&nbsp; : &nbsp;<%= board.getIdx() %>
			</div>
			<div class="col-xs-offset-4 col-xs-4 col-sm-offset-5 col-sm-4 col-md-offset-6 col-md-3 col-lg-offset-6 col-lg-3">
				<label> 작성 시간 </label>&nbsp; : &nbsp;<%= board.getDate().substring(0,19)  %>
			</div>
		</div>
	  </div>
	  <div class="lower">
		<div class="row" style="margin-top:2px;">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<label> 글 제목 </label>&nbsp; : &nbsp;<%= board.getTitle() %>
			</div>
		</div>
		
		<div class="row" style="margin-top:2px;">
		  <div class="col-md-5">
			<label> 작성자 </label>&nbsp; : &nbsp;<%= board.getName() %> &nbsp;&nbsp;|&nbsp;&nbsp;
			<label> 조회수 </label>&nbsp; : &nbsp;<%= board.getHit() %> &nbsp;&nbsp;|&nbsp;&nbsp;
			<label> 추천수 </label>&nbsp; : &nbsp;<%= board.getRecom()%>
		  </div>
		</div>
	  
		<div class="row" style="margin-top:2px;">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<label> 파일명 </label>&nbsp; : &nbsp;
				<% if(fileRealName != null) { %>
					<a href="/downloadAction?file=<%= URLEncoder.encode(fileRealName,"UTF-8") %>">
					<%= fileRealName %></a>
				<% } else { %>
					파일없음
				<% } %>
			</div>
		</div>
	  </div>
	  
	  <hr />
	
      <div class="content">
 	     <p><%= board.getContent() %></p>
      </div>
	
	  <div class="lower">
		  <!--  추천 버튼 -->
	      <div class="recommend" style="font-size:30px;text-align:center;">
	      	  <a href="/recommendBoard?email=<%= session.getAttribute("userID") %>&idx=<%= board.getIdx() %>"><i class="fa fa-thumbs-up"></i></a>
	      </div>
	      
	      <% if(session.getAttribute("userID").equals(board.getName())) { %>
		      <div class="buttongroup" style="float:right;">
				  <a href="/edit.jsp?idx=<%= board.getIdx() %>" class="btn btn-info">수정</a>
				  <a href="/deleteBoard?idx=<%= board.getIdx() %>" class="btn btn-info">삭제</a>
			      <a href="/board.jsp" class="btn btn-info">목록</a>
		      </div>
		  <% } else {%>
		      <div class="buttongroup" style="float:right;">
			      <a href="/board.jsp" class="btn btn-info">목록</a>
		      </div>
	      <% } %>
      </div>
     
	  댓글 기능 추가 예정
	</div>
</body>
</html>


