<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="com.jonghoon.happybuy.util.Gmail"%>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String email = request.getParameter("email"); 
	UserDAO userDAO = new UserDAO(); 
	String temPassword = userDAO.getTemporaryPassword(); 
	
	// 사용자에게 보낼 메시지 기입
	String host = "http://127.0.0.1:8080/HappyBuy/"; 
	String from = "no-reply@happybuy.com";
	String to = email; 
	
	String subject = "임시 비밀번호가 발급되었습니다."; 
	String content = "회원님의 임시 비밀번호는 <strong>" + temPassword + "</strong> 입니다. <br> 로그인 하신 후에 프로필 수정 페이지에서 비밀번호를 바꿔주시기 바랍니다.";

	// SMTP에 접속하기 위한 정보를 기입
	Properties p = new Properties(); 
	p.put("mail.smtp.user", from); 
	p.put("mail.smtp.host", "smtp.googlemail.com"); 
	p.put("mail.smtp.port", "465"); 
	p.put("mail.smtp.starttls.enable", "true"); 
	p.put("mail.smtp.auth", "true"); 
	p.put("mail.smtp.debug", "true"); 
	p.put("mail.smtp.socketFactory.port", "465"); 
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	p.put("mail.smtp.socketFactory.fallback", "false"); 
	
	try {
		Authenticator auth = new Gmail(); 
		Session ses = Session.getInstance(p, auth); 
		ses.setDebug(true); 
		
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		
		Address fromAddr = new InternetAddress(from); 
		msg.setFrom(fromAddr);
		
		Address toAddr = new InternetAddress(to); 
		msg.addRecipient(Message.RecipientType.TO, toAddr); 
		msg.setContent(content, "text/html;charset=UTF-8"); 
		
		Transport.send(msg);
	} catch(Exception e) {
		out.println("<script> alert('전송 오류가 발생했습니다.'); location.href='findPassword.jsp'; </script>");
		out.close(); 
		return;
	}
	
	// 메시지 보낸후에 바로 해당 이메일의 비밀번호를 임시 비밀번호로 바꾸기 
	
	if(userDAO.setTemporaryPassword(temPassword, email) == -1) {
		out.println("<script> alert('데이터베이스 오류가 발생했습니다.'); location.href='findPassword.jsp'; </script>");
		out.close(); 
		return;
	}
	
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/nav.css">
	
	<title> 비밀번호 찾기 </title>
</head>
<body>
	<div class="container" style="margin-top:80px;"> 
		<div class="col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
			<h3> 비밀번호 찾기 </h3>
			
			<hr />
			
			<div class="jumbotron" style="padding-top:20px">
				<h3 style="margin-bottom:20px;"> 이메일 : <strong><%= email %></strong></h3>
				
			     위 메일로 임시비밀번호가 전송되었습니다. <br />
				 임시 비밀번호로 로그인 후에 '마이 프로필' -> '프로필 수정' 페이지에서 비밀번호를 바꾸어주세요. 
				 
			</div>
			<a href="<%= application.getContextPath() %>/login.jsp" id="login" class="btn btn-primary" style="display:inline;margin-left:15px;"> 로그인 </a>
		</div>
	</div>
</body>
</html>