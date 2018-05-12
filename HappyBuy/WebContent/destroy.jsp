<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	PrintWriter pw = response.getWriter(); 

	int idx = Integer.parseInt(request.getParameter("idx"));

	BoardDAO boardDAO = new BoardDAO(); 
	if(boardDAO.deleteBoard(idx) > 0) {
		pw.println("<script>");
		pw.println("alert('글이 성공적으로 삭제되었습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	} else {
		pw.println("<script>");
		pw.println("alert('글이 삭제에 실패하였습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	}
	
	boardDAO.close(); 
%>