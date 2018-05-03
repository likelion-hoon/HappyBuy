<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	
	<title>HappyBuy 메인페이지</title>
	
	
</head>

<body>
	<nav class="navbar navbar-default">
  
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"> HappyBuy </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">쇼핑<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">옷</a></li>
            <li><a href="#">음식</a></li>
            <li><a href="#">가구</a></li>
            <li><a href="#">기타</a></li>
          </ul>
        </li>
        <li><a href="#">QnA 게시판</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/logout.jsp">로그아웃</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">마이 프로필</a></li>
          </ul>
        </li>
      </ul>
    </div>
    
  </div>
</nav>
</body>
</html>