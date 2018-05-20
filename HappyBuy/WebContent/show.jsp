<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.Board" %>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="com.jonghoon.happybuy.reply.ReplyDAO, com.jonghoon.happybuy.reply.Reply" %>
<%@ page import="java.util.ArrayList" %>
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
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
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
	
	int board_id = Integer.parseInt(request.getParameter("idx")); 
	BoardDAO boardDAO = new BoardDAO(); 
	boardDAO.increaseHit(board_id); // 조회수 증가
	Board board = boardDAO.getBoard(board_id);
	
	String fileRealName = board.getFileRealName();
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
			<label> 작성자 </label>&nbsp; : &nbsp;<%= userDAO.getEmailInBoardId(board.getIdx()) %> &nbsp;&nbsp;|&nbsp;&nbsp;
			<label> 조회수 </label>&nbsp; : &nbsp;<%= board.getHit() %> &nbsp;&nbsp;|&nbsp;&nbsp;
			<label> 추천수 </label>&nbsp; : &nbsp;<%= board.getRecom()%>
		  </div>
		</div>
	  
		<div class="row" style="margin-top:2px;">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<label> 파일명 </label>&nbsp; : &nbsp;
				<% if(fileRealName != null) { %>
					<a href="<%= application.getContextPath() %>/downloadAction?file=<%= URLEncoder.encode(fileRealName,"UTF-8") %>">
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
	      <div class="recommend col-md-offset-4 col-md-4 col-lg-offset-4 col-lg-4" style="font-size:30px;text-align:center;">
	      	  <a href="<%= application.getContextPath() %>/recommendBoard?email=<%= session.getAttribute("userID") %>&idx=<%= board.getIdx() %>"><i class="fa fa-thumbs-up"></i></a>
	      </div>
	      
	      <% if(session.getAttribute("userID").equals(userDAO.getEmailInBoardId(board.getIdx()))) { %>
		      <div class="buttongroup col-md-offset-1 col-md-3 col-lg-offset-1 col-md-3" style="float:right;">
				  <a href="<%= application.getContextPath() %>/edit.jsp?idx=<%= board.getIdx() %>" class="btn btn-info">수정</a>
				  <a href="<%= application.getContextPath() %>/deleteBoard?idx=<%= board.getIdx() %>" class="btn btn-info"
				  onclick="return confirm('게시글을 삭제하시겠습니까?');">삭제</a>
			      <a href="<%= application.getContextPath() %>/board.jsp" class="btn btn-info">목록</a>
		      </div>
		  <% } else {%>
		      <div class="buttongroup col-md-offset-2 col-md-2" style="float:right;">
			      <a href="<%= application.getContextPath() %>/board.jsp" class="btn btn-info">목록</a>
		      </div>
	      <% } %>
      </div>
     
      <div class="divisor" style="margin-top:60px;">
      	<hr />
      </div>
      
      <!--  댓글 부분 시작 -->
      <div class="reply_info" style="margin-bottom:15px;">
     	 <span style="background-color:#f8f8f8;border:1px solid #ededed;font-weight:700;"> 댓글을 남겨주세요 </span>
      </div>
      
	  <!-- 댓글 form 추가하기  -->
	  <form action="createReply" method="POST" id="reply_form" >
	  	<input type="hidden" id="user_id" name="user_id" value="<%= userDAO.getUserIdx((String)session.getAttribute("userID")) %>" />
	  	<input type="hidden" id="board_id" name="board_id" value="<%= board_id %>" />
	  	<div class="form-group">
	  		<p>작성자 : <%= session.getAttribute("userID") %> </p>
	  	</div>
	  	<div class="form-group">
	  		<textarea id="reply_content" class="form-control" name="content" style="width:80%;min-height:100px;" placeholder="상호 욕설과 비방은 관리자에 의해 삭제 됩니다."></textarea> 
	  	</div>
	  	<div class="form-group">
	  		<button type="submit" class="btn btn-primary">작성</button>
	  	</div>
	  </form>
	  
	  <hr />
	  
	  <!--  해당 board의 댓글 리스트 출력 --> 
	  <% 
	  	  ReplyDAO replyDAO = new ReplyDAO(); 
	  	  ArrayList<Reply> list = replyDAO.getReplyList(board_id);
	  	  
	  	  for(int i=0; i<list.size(); i++) {
	  %>
		 <div class="well" style="width:80%">
		 	<div class="up_info">
		 		<span> 작성자 : <%= userDAO.getEmailInUserId(list.get(i).getUser_id()) %> </span>
		 		<span style="float:right;"> 작성시간 : <%= list.get(i).getDate().substring(0,19) %></span>
		 	</div>
		 	<p style="margin-top:5px;"> 작성 내용 : <%= list.get(i).getContent() %></p>
		 </div>
	  <% } %>
	</div> <!-- container의 끝 -->
	
	 <% 
	     // 자원 반납
	     pw.close(); 
	 	 replyDAO.close(); 
	 	 boardDAO.close(); 
      	 userDAO.close(); 
     %>
</body>
</html>


