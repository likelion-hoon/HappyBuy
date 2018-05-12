<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	// setProperty 전에 인코딩 설정
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="board" class="com.jonghoon.happybuy.board.Board" scope="page" />
<jsp:setProperty name="board" property="title" />
<jsp:setProperty name="board" property="content" />
<jsp:setProperty name="board" property="idx" value="${param.idx}" />

<%
	PrintWriter pw = response.getWriter(); 
	BoardDAO boardDAO = new BoardDAO(); 
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	if(boardDAO.updateBoard(board) > 0) {
		pw.println("<script>");
		pw.println("alert('글이 성공적으로 수정되었습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	} else {
		pw.println("<script>");
		pw.println("alert('글 수정에 실패하였습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	}
	boardDAO.close(); 
%>
