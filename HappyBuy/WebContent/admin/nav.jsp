<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO,com.jonghoon.happybuy.user.User"%>

 <nav class="navbar navbar-default">
  
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%= application.getContextPath() %>"> HappyBuy </a>
    </div>

    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="<%= application.getContextPath() %>/admin/allUserView.jsp">유저 관리</a></li>
        <li><a href="<%= application.getContextPath() %>/admin/manageSeller.jsp">판매자 등업 관리</a></li>
        <li><a href="<%= application.getContextPath() %>/admin/getDeclaration.jsp">신고관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-align-justify"></span></a> 
          <ul class="dropdown-menu">
           	  <li><a href="<%= application.getContextPath() %>/adminLogoutProc">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div>
    
  </div>
</nav>