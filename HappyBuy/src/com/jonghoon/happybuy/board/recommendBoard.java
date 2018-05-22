package com.jonghoon.happybuy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.user.UserDAO;

@WebServlet("/recommendBoard")
public class recommendBoard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String email = request.getParameter("email"); 
		int idx = Integer.parseInt(request.getParameter("idx")); 
		PrintWriter out = response.getWriter(); 
		BoardDAO boardDAO = new BoardDAO(); 
		UserDAO userDAO = new UserDAO(); 
		Board board = boardDAO.getBoard(idx);
		
		// 본인글 추천 방지
		if(email.equals(userDAO.getEmailInBoardId(board.getIdx()))) {
			out.println("<script> alert('자신의 글은 추천할 수 없습니다.'); location.href='show.jsp?idx="+idx+"'</script>");
			out.close(); 
			return; 
		}
		
		// 추천 중복 방지
		if(boardDAO.checkRecom(email, idx)==-1) {
			out.println("<script> alert('이미 추천한 글입니다.'); location.href='show.jsp?idx="+idx+"'</script>");
		} else {
			boardDAO.increaseRecom(idx);
			out.println("<script> alert('이 글을 추천하였습니다.'); location.href='show.jsp?idx="+idx+"'</script>");
		}
		
		out.close(); 
	}
}
