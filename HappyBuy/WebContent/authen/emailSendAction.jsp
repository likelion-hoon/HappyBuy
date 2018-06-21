<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.util.SHA256"%>
<%@ page import="com.jonghoon.happybuy.util.Gmail"%>
<%@ page import="com.jonghoon.happybuy.user.UserDAO" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.Message"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	UserDAO userDAO = new UserDAO(); 
	String email = request.getParameter("email"); 
	boolean emailChecked = userDAO.getUserEmailChecked(email);
	
	if(emailChecked) {
		out.println("<script> alert('이미 인증 된 회원입니다.'); location.href='index.jsp' </script>");
		out.close(); 
		return;
	}

	// 사용자에게 보낼 메시지 기입
	String host = "http://127.0.0.1:8080/HappyBuy/";
	String from = "stonvcold@gmail.com";
	String to = email; 
	
	String subject = "회원가입을 위한 이메일 확인 과정입니다.";
	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + 
	"<a href ='" + host + "emailCheckAction?code=" + new SHA256().getSHA256(to)+"&email="+email+"'> 이메일 인증하기 </a>";
	
	// SMTP에 접속하기 위한 정보를 기입
	Properties p = new Properties(); 
	p.put("mail.smtp.user", from); 
	p.put("mail.smtp.host", "smtp.googlemail.com"); 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true"); 
	p.put("mail.smtp.auth", "true"); 
	p.put("mail.smtp.debug", "true"); 
	p.put("mail.smtp.socketFactory.port","465"); 
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false"); 
	
	try {
		Authenticator auth = new Gmail(); 
		Session ses = Session.getInstance(p, auth); 
		ses.setDebug(true); 
		
		MimeMessage msg = new MimeMessage(ses); 
		msg.setSubject(subject); 
		
		Address fromAddr = new InternetAddress(from); 
		msg.setFrom(fromAddr); 
		
		Address toAddr = new InternetAddress(to); 
		msg.addRecipient(Message.RecipientType.TO,toAddr); 
		msg.setContent(content, "text/html;charset=UTF-8"); 
		
		Transport.send(msg); 
	} catch(Exception e) {
		out.println("<script> alert('오류가 발생했습니다.'); location.href='registration.jsp'; </script>");
		out.close(); 
		return;
	}
	
	
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	
	<!--  jQuery이 bootstrap보다 먼저 로딩되어야 dropdown이 동작한다. -->
	<script src="<%= application.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/bootstrap-theme.min.css">
	<script src="<%= application.getContextPath() %>/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/nav.css">
	
	<title>이메일 보내기</title>
</head>
<body>
	<div class="container" style="margin-top:60px;">
	    <div class="jumbotron col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
		   <h3 style="margin-bottom:5px;"> 인증 메일 전송! </h3> 
		   <p>  <%= to %>에 들어가셔서 인증해주세요. </p>
		</div>
    </div>
</body>
</html>