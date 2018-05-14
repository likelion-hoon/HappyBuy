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

@WebServlet("/updateBoard")
public class updateBoard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
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
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = multipartRequest.getParameter("title"); 
		String content = multipartRequest.getParameter("content"); 
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		BoardDAO boardDAO = new BoardDAO(); 
		Board board = new Board(idx, title, content, fileName, fileRealName);
		
		
		
		if(boardDAO.updateBoard(board) != -1) {
			out.println("<script> alert('글이 성공적으로 수정되었습니다.'); location.href='board.jsp' </script>");
		} else {
			out.println("<script> alert('글 수정에 실패하였습니다.'); location.href='board.jsp' </script>");
		}
		
		// 자원반납
		boardDAO.close(); 
		out.close(); 
	}
}
