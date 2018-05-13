<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jonghoon.happybuy.board.BoardDAO,com.jonghoon.happybuy.board.Board" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%-- <jsp:useBean id="board" class="com.jonghoon.happybuy.board.Board" scope="page" />
<jsp:setProperty name="board" property="*" /> --%>

<%
	PrintWriter pw = response.getWriter(); 

	// 파일업로드 처리
	String directory = "/Users/leejonghoon/desktop/HappyBuy/upload/";
	int maxSize = 1024 * 1024 * 100; // 최대 100mb 까지 저장
	String encoding = "UTF-8"; 
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String title = multipartRequest.getParameter("title"); 
	String content = multipartRequest.getParameter("content"); 
	String name = multipartRequest.getParameter("name"); 
	
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	
	BoardDAO boardDAO = new BoardDAO(); 
	Board board = new Board(title, content, name, fileName, fileRealName);
	
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