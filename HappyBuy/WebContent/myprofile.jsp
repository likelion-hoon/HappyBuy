<!--  자신이 정보를 볼수 있는 페이지 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	PrintWriter pw = response.getWriter();

	if (session.getAttribute("userID") == null) {
		pw.println("<script> alert('로그인 하셔야 이용할 수 있습니다.'); location.href='login.jsp' </script>");
		pw.close();
		return;
	}
%>
<body>
	<h2>
		<%=session.getAttribute("userID")%>님의 페이지 입니다.
	</h2>

</body>
</html>