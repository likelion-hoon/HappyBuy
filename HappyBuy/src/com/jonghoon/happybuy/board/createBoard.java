package com.jonghoon.happybuy.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.user.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/createBoard")
public class createBoard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		
		// 파일업로드 처리
		MultipartRequest multipartRequest = null; 
		String directory = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 100; // 최대 100mb 까지 저장
		
		BoardDAO boardDAO = new BoardDAO(); 
		UserDAO userDAO = new UserDAO();
		
		try {
			multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch(Exception e) {
			e.printStackTrace(); 
			response.sendRedirect("new.jsp");
			return; 
		}
		
		File file = multipartRequest.getFile("file");
		// input값 추출하기
		String email = multipartRequest.getParameter("email"); 
		String title = multipartRequest.getParameter("title"); 
		String content = multipartRequest.getParameter("content"); 
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");  // 실제 서버에 저장되는 파일명(중복될 경우 바뀐다.)
		int user_id = userDAO.getUserIdx(email); // 외래키 user_id
		 
		// 파일이 존재하는 경우
		if(file != null) { 
			String extension = file.getName().substring(file.getName().lastIndexOf(".")+1);
			// 확장자 조건을 만족시키지 못하면
			if(!extension.equals("jpg") && !extension.equals("jpeg") && !extension.equals("png") &&
					!extension.equals("pdf") && !extension.equals("xls") && !extension.equals("doc") && !extension.equals("ppt")) {
				if(file.exists()) {
					file.delete();
				}
				out.println("<script> alert('업로드 할 수 없는 확장자입니다.'); history.go(-1) </script>");
				out.close(); 
				return; 
			} 
		}
		
		Board board = new Board(title, content, fileName, fileRealName, user_id);
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
