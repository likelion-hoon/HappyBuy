package com.jonghoon.happybuy.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteBoard")
public class deleteBoard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		BoardDAO boardDAO = new BoardDAO(); 
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// 글 삭제될때 파일도 삭제하기
		String directory = request.getSession().getServletContext().getRealPath("/upload");
		String prevFileName = boardDAO.getBoard(idx).getFileRealName();
		File prevFile = new File(directory + "/" + prevFileName); 
		if(prevFile.exists()) {
			prevFile.delete(); 
		}
		
		if(boardDAO.deleteBoard(idx) > 0) {
			out.println("<script> alert('글이 성공적으로 삭제되었습니다.'); location.href='board.jsp' </script>");
		} else {
			out.println("<script> alert('글 삭제에 실패하였습니다.'); location.href='board.jsp' </script>");
		}
		
		// 자원반납
		boardDAO.close(); 
		out.close(); 
	}
}
