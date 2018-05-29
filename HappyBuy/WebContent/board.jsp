<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.Board" %>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="com.jonghoon.happybuy.common.CheckNull" %>
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
	<title> 게시판 </title>

</head>

<%
	// 로그인 확인 코드
	PrintWriter pw = response.getWriter(); 
	if(session.getAttribute("userID")==null) {
		pw.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='login.jsp' </script>");
		pw.close(); 
	}
	
	// null 값이면 ""를 리턴한다.
	String opt = CheckNull.checkNull(request.getParameter("opt")); 
	String keyword = CheckNull.checkNull(request.getParameter("keyword")); 
%>

<body>
	<%@ include file="nav.jsp" %>
	<div class="container" style="margin-top:50px;"> 
		<div class="upper_board">
			<div class="col-xs-2 col-sm-2 col-md-offset-1 col-md-2 col-lg-offset-1 col-lg-2" style="margin-top:15px;">
				<select name="setDefaultPg" onchange="location.href = this.value;">
	 				<option value="<%= application.getContextPath() %>/board.jsp" selected>글 수 설정</option>
	 				<option value="<%= application.getContextPath() %>/board.jsp?default=5">5개씩 보기</option>
	 				<option value="<%= application.getContextPath() %>/board.jsp?default=10">10개씩 보기</option>
	 				<option value="<%= application.getContextPath() %>/board.jsp?default=20">20개씩 보기</option>
				</select>
			</div>
			
			<div class="search row col-xs-offset-5 col-xs-5 col-sm-offset-5 col-sm-5 col-md-offset-4 col-md-5 col-lg-offset-4 col-lg-5" style="margin-bottom:10px;">
				<form action="<%= application.getContextPath() %>/board.jsp" method="GET" id="searchForm">
					<div class="col-md-offset-1 col-md-1">
						<select name="opt" style="margin-top:7px;margin-right:20px;">
						  <option value="searchTitle" selected>제목</option>
						  <option value="searchContent">내용</option>
						</select>
					</div>
					<div class="col-md-offset-1 col-md-3" style="padding-left:7px;padding-right:5px;">
						<input type="text" name="keyword" class="form-control col-xs-2 col-sm-2" style="width:180px;" placeholder="검색어를 입력하세요"/>
					</div> 
					<div class="col-md-offset-2 col-md-2">
						<button type="submit" class="btn btn-primary" style="margin-left:3px">검색</button>
					</div> 
				</form>
			</div>
		</div>
	</div>
	
	<div class="container">
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
						String viewCountStr = CheckNull.checkNull(request.getParameter("default"));
						int viewCount = 5; 
						
						if(!viewCountStr.equals("")) {
							viewCount = Integer.parseInt(viewCountStr); 
						}
						
						int defaultPg = viewCount;  // 한 페이지당 기본 게시글 수
						BoardDAO boardDAO = new BoardDAO(); 
						List<Board> list = boardDAO.getBoardList(opt, keyword);
						int boardCount = list.size(); 
						int pageCount = (boardCount - 1) / defaultPg + 1; 
						int rest = boardCount % defaultPg;
						
						String pg = CheckNull.checkNull(request.getParameter("page"));
						int pgNum = 0; 
						// 값이 안들어왔다는 얘기
						if(pg.equals("")) {
							pgNum = 1; 
						} else {
							pgNum = Integer.parseInt(pg);
						}
						
						int start = (pgNum - 1)*defaultPg + 1; 
						int end = pgNum * defaultPg; 
						if(pgNum==pageCount) {
							end = boardCount;
						}
						
						// page == pageCount && rest > 0 이면  page==pageCount일 때 나머지 rest값이 출력 되어야 함
						// page == pageCount && rest == 0 이면 page==pageCount일 때 마지막 defaultPg 개수 만큼 출력 되어야 함
						
						for(int i=start; i<=end; i++) { 
					%>
						<tr>
							<td> <%= list.get(i-1).getIdx() %> </td>
							<td> <a href="<%= application.getContextPath() %>/show.jsp?idx=<%= list.get(i-1).getIdx() %>"> <%= list.get(i-1).getTitle() %> </a></td>
							<td> <%= userDAO.getEmailInBoardId(list.get(i-1).getIdx()) %> </td>
							<td> <%= list.get(i-1).getHit() %> </td>
							<td> <%= list.get(i-1).getRecom() %> </td>
							<td> <%= list.get(i-1).getDate().substring(0,19) %></td>
						</tr>
					<% 
						} 
					%>
			   </tbody>
			</table>
			<!-- 검색이 되었을때 돌아가는 메뉴 -->
			<% if(!keyword.equals("")) { %>
				  <a href="<%= application.getContextPath() %>/board.jsp" class="btn btn-primary" style="float:left;"> 검색취소 </a>
			<% } %>
			<a href="<%= application.getContextPath() %>/new.jsp" class="btn btn-primary" style="float:right;">글 쓰기</a>
		</div>		
	</div> <!--  container의 끝 -->
	
	<div class="container">
		<div class="row" style="text-align:center;">
		    <ul class="pagination">
		    	<% for(int i=1; i<=pageCount; i++) { %>
			    	<li id="page<%= i %>"><a onclick="changeActive(this);" href="<%= application.getContextPath() %>/board.jsp?page=<%= i %>&default=<%= defaultPg %>"><%= i %></a></li>
			    	<%-- <li><a id="page<%= i %>" onclick="changeActive(this);"><%= i %></a></li> --%>
			    <% } %>
			</ul>
		</div>
	</div>
</body>
</html>