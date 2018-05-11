<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	// setProperty 전에 인코딩 설정
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="com.jonghoon.happybuy.board.Board" scope="page" />
<jsp:setProperty name="board" property="*" />


<%
	PrintWriter pw = response.getWriter(); 
	BoardDAO boardDAO = new BoardDAO(); 
	
	if(boardDAO.insertBoard(board) > 0) { // 성공
		pw.println("<script>");
		pw.println("alert('글이 성공적으로 작성되었습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	} else {
		pw.println("<script>");
		pw.println("alert('글 작성에 실패하였습니다.')");
		pw.println("location.href='new.jsp'");
		pw.println("</script>");
		pw.close();
	}
	
	boardDAO.close(); 
%>