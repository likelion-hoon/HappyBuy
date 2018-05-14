package com.jonghoon.happybuy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/createBoard")
public class createBoard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		
		// 파일업로드 처리
		String directory = "/Users/leejonghoon/desktop/HappyBuy/upload/";
		int maxSize = 1024 * 1024 * 100; // 최대 100mb 까지 저장
		String encoding = "UTF-8"; 
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// input값 추출하기
		String title = multipartRequest.getParameter("title"); 
		String content = multipartRequest.getParameter("content"); 
		String name = multipartRequest.getParameter("name"); 
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		BoardDAO boardDAO = new BoardDAO(); 
		Board board = new Board(title, content, name, fileName, fileRealName);
		
		if(boardDAO.insertBoard(board) > 0) {
			out.println("<script> alert('글이 성공적으로 작성되었습니다.'); location.href='board.jsp' </script>");
		} else {
			out.println("<script> alert('글 작성에 실패하였습니다.'); location.href='new.jsp' </script>");
		}
		
		// 자원반납
		boardDAO.close(); 
		out.close(); 
	}
}
