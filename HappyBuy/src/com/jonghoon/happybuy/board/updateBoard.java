package com.jonghoon.happybuy.board;

import java.io.File;
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
		
		// 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		BoardDAO boardDAO = new BoardDAO();
		// 파일업로드 처리
		MultipartRequest multipartRequest = null;
		String directory = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 100; // 최대 100mb 까지 저장
		
		try {
			multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch(Exception e) {
			e.printStackTrace(); 
			response.sendRedirect("edit.jsp");
			return; 
		}
		
		// input값 추출하기(fileName은 밑에서 초기화)
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = multipartRequest.getParameter("title"); 
		String content = multipartRequest.getParameter("content"); 
		String fileRealName = multipartRequest.getFilesystemName("file");
		String fileName = ""; 
		
		File file = multipartRequest.getFile("file"); 
		
		// file을 수정했다면 
		if(file != null) {
			String extension = file.getName().substring(file.getName().lastIndexOf(".")+1);
			
			// 확장자 확인 if문
			if(extension.equals("jpg") || extension.equals("jpeg") || extension.equals("png") ||
					extension.equals("pdf") || extension.equals("xls") || extension.equals("doc") || extension.equals("doc")) {
				// 이전파일 지우는 코드
				String prevFileName = boardDAO.getBoard(idx).getFileRealName();
				File prevFile = new File(directory + "/" + prevFileName); 
				if(prevFile.exists()) {
					prevFile.delete(); 
				}
				fileName = file.getName(); 
			} else {
				out.println("<script> alert('업로드 할 수 없는 확장자 입니다.'); history.go(-1) </script>"); 
				out.close(); 
				return; 
			}
		}
		
		// 처리과정 이후 update구문
		Board board = new Board(idx, title, content, fileName, fileRealName);
		if(boardDAO.updateBoard(board) != -1) {
			out.println("<script> alert('글이 성공적으로 수정되었습니다.'); location.href='board.jsp' </script>");
		} else {
			out.println("<script> alert('글 수정에 실패하였습니다.'); location.href='board.jsp' </script>");
		}
		
		// 자원반납
		out.close(); 
	}
}
