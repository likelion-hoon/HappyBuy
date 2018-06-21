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
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">쇼핑<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li>
            	<div class="mega-menu-content">
            		<div class="container">
            			<div class="row"> 
	           				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	            					<ul class="list-unstyled">
	            						<li><h3><a href="<%= application.getContextPath() %>/merchan/cloth.jsp">의류</a></h3></li>
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
	           						<li><h3><a href="<%= application.getContextPath() %>/merchan/food.jsp">음식</a></h3></li>
	           						<li role="separator" class="divider"></li>
	           						<li><a href="#">&gt;&nbsp;과자</a></li>
	           						<li><a href="#">&gt;&nbsp;라면</a></li>
	           						<li><a href="#">&gt;&nbsp;냉동식품</a></li>
	           						<li><a href="#">&gt;&nbsp;정육</a></li>
	           						<li><a href="#">&gt;&nbsp;과일</a></li>
	           						<li><a href="#">&gt;&nbsp;생선</a></li>
	           						<li><a href="#">&gt;&nbsp;야채</a></li>
	           					</ul>
	           				</div>
	           				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	           					<ul class="list-unstyled">
	           						<li><h3><a href="<%= application.getContextPath() %>/merchan/live.jsp">주거</a></h3></li>
	           						<li role="separator" class="divider"></li>
	           						<li><a href="#">&gt;&nbsp;에어컨</a></li>
	           						<li><a href="#">&gt;&nbsp;냉장고</a></li>
	           						<li><a href="#">&gt;&nbsp;TV</a></li>
	           						<li><a href="#">&gt;&nbsp;세탁기</a></li>
	           						<li><a href="#">&gt;&nbsp;식탁</a></li>
	           						<li><a href="#">&gt;&nbsp;컴퓨터</a></li>
	           						<li><a href="#">&gt;&nbsp;침대</a></li>
	           					</ul>
	           				</div>
           				</div> 
            		</div>
            	</div>
            </li>
          </ul>
        </li>
        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">판매<span class="caret"></span></a>
        	<ul class="dropdown-menu">
        		<li><a href="<%= application.getContextPath() %>/merchan/toSeller.jsp">판매자 신청</a></li>
       	 		<li><a href="<%= application.getContextPath() %>/merchan/new.jsp">상품올리기</a></li>
        	</ul>
        </li>
       
        <li><a href="<%= application.getContextPath() %>/board.jsp">QnA 게시판</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <%  UserDAO userDAO = new UserDAO();  
          	if(session.getAttribute("userID") == null) { %>
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