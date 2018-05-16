<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User"%>

<%
	UserDAO userDAO = new UserDAO(); 
%>

 <nav class="navbar navbar-default">
  
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"> HappyBuy </a>
    </div>

    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">쇼핑<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li>
            	<div class="mega-menu-content">
            		<div class="container">
            			<div class="row"> 
	           				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	            					<ul class="list-unstyled">
	            						<li><h3>의류</h3></li>
	            						<li role="separator" class="divider"></li>
	            						<li><a href="#">&gt;&nbsp;남성상의</a></li>
	            						<li><a href="#">&gt;&nbsp;여성상의</a></li>
	            						<li><a href="#">&gt;&nbsp;남성신발</a></li>
	            						<li><a href="#">&gt;&nbsp;여성신발</a></li>
	            						<li><a href="#">&gt;&nbsp;스카프</a></li>
	            						<li><a href="#">&gt;&nbsp;모자</a></li>
	            						<li><a href="#">&gt;&nbsp;양말</a></li>
	            					</ul>
	           				</div>
	           				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	           					<ul class="list-unstyled">
	           						<li><h3>음식</h3></li>
	           						<li role="separator" class="divider"></li>
	           						<li><a href="#">&gt;&nbsp;과자</a></li>
	           						<li><a href="#">&gt;&nbsp;라면</a></li>
	           						<li><a href="#">&gt;&nbsp;남성신발</a></li>
	           						<li><a href="#">&gt;&nbsp;여성신발</a></li>
	           						<li><a href="#">&gt;&nbsp;스카프</a></li>
	           						<li><a href="#">&gt;&nbsp;모자</a></li>
	           						<li><a href="#">&gt;&nbsp;양말</a></li>
	           					</ul>
	           				</div>
	           				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	           					<ul class="list-unstyled">
	           						<li><h3>주거</h3></li>
	           						<li role="separator" class="divider"></li>
	           						<li><a href="#">&gt;&nbsp;가구</a></li>
	           						<li><a href="#">&gt;&nbsp;이불</a></li>
	           						<li><a href="#">&gt;&nbsp;남성신발</a></li>
	           						<li><a href="#">&gt;&nbsp;여성신발</a></li>
	           						<li><a href="#">&gt;&nbsp;스카프</a></li>
	           						<li><a href="#">&gt;&nbsp;모자</a></li>
	           						<li><a href="#">&gt;&nbsp;양말</a></li>
	           					</ul>
	           				</div>
           				</div> 
            		</div>
            	</div>
            </li>
          </ul>
        </li>
        <li><a href="<%= application.getContextPath() %>/board.jsp">QnA 게시판</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <% if(session.getAttribute("userID") == null) { %>
        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-align-justify"></span></a> 
          <% } else { %>
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= session.getAttribute("userID") %><span class="caret"></span></a>
          <% } %>
          <ul class="dropdown-menu">
           <% if(session.getAttribute("userID") == null) { %>
              <li><a href="<%= application.getContextPath() %>/login.jsp">로그인</a></li>
              <li><a href="<%= application.getContextPath() %>/registration.jsp">회원가입</a></li>
           <% } else { %>
           	  <li><a href="<%= application.getContextPath() %>/logoutProc">로그아웃</a></li>
              <li><a href="<%= application.getContextPath() %>/cart.jsp">장바구니</a></li>
              <li><a href="<%= application.getContextPath() %>/myprofile.jsp?idx=<%= userDAO.getUserIdx((String)session.getAttribute("userID")) %>">마이 프로필</a></li>
           <% } %>
          </ul>
        </li>
      </ul>
    </div>
    
  </div>
</nav>