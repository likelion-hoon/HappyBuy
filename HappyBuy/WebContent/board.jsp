<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.Board" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
</head>

<%
	PrintWriter pw = response.getWriter(); 
	if(session.getAttribute("userID")==null) {
		pw.println("<script>");
		pw.println("alert('로그인 하셔야 이용할 수 있습니다.')");
		pw.println("location.href='login.jsp'");
		pw.println("</script>");
		pw.close(); 
		return; 
	}
%>

<body>
	<%@ include file="nav.jsp" %>
	
	
	<div class="container" style="margin-top:50px;"> 
	
		<div class="search" style="margin-bottom:40px;">
			<div class="col-xs-offset-8 col-xs-4 col-sm-offset-8 col-sm-4 col-md-offset-8 col-md-4 col-lg-offset-8 col-lg-4">
				<form action="/board.jsp" method="POST" id="searchForm">
					<input type="text" name="searchKeyword" class="form-control col-xs-2 col-sm-2" style="width:180px;" placeholder="제목, 내용을 입력하세요"/> 
					<button type="submit" class="btn btn-primary" style="margin-left:8px">검색</button> 
				</form>
			</div>
		</div>
	
			<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
				<table class="table table-striped">
				  <thead>
					<tr>
						<th> 글 번호 </th>
						<th> 글 제목 </th>
						<th> 작성자 </th>
						<th> 조회수 </th>
						<th> 추천수 </th>
						<th> 작성 날짜 </th>
					</tr>
				  </thead>
				  <tbody>
						<%	
							BoardDAO boardDAO = new BoardDAO(); 
							List<Board> list = boardDAO.getBoardList();
							System.out.println(list.get(0).getTitle());
							for(int i=0; i<list.size(); i++) { 
						%>
							<tr>
								<td> <%= list.get(i).getIdx() %> </td>
								<td> <a href="/show.jsp?page=<%= list.get(i).getIdx() %>"> <%= list.get(i).getTitle() %> </a></td>
								<td> <%= list.get(i).getName() %> </td>
								<td> <%= list.get(i).getHit() %> </td>
								<td> <%= list.get(i).getRecom() %> </td>
								<td> <%= list.get(i).getDate() %></td>
							</tr>
						<% } %>
				   </tbody>
				</table>
				<a href="/new.jsp" class="btn btn-primary" style="float:right;">글 쓰기</a>
			</div>
	</div>
</body>
</html>