<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO, com.jonghoon.happybuy.board.Board" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String email = request.getParameter("email"); 
	int idx = Integer.parseInt(request.getParameter("idx")); 
	
	PrintWriter pw = response.getWriter(); 
	BoardDAO boardDAO = new BoardDAO(); 
	Board board = boardDAO.getBoard(idx);
	
	if(email.equals(board.getName())) {
		pw.println("<script>");
		pw.println("alert('자신의 글은 추천할 수 없습니다!.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
		boardDAO.close(); 
		return;
	}
	
	if(boardDAO.checkRecom(email, idx)==-1) {
		pw.println("<script>");
		pw.println("alert('이미 추천한 글입니다!.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	} else {
		boardDAO.increaseRecom(idx);
		pw.println("<script>");
		pw.println("alert('이 글을 추천하였습니다.')");
		pw.println("location.href='board.jsp'");
		pw.println("</script>");
		pw.close();
	}

	boardDAO.close(); 
%>