<!-- new.jsp 로직 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title"); 
	String content = request.getParameter("content"); 
	
	// write(title, content) : boolean 
	
	if() { // 성공
		
	} else {
		response.sendRedirect("new.jsp"); 
	}
%>