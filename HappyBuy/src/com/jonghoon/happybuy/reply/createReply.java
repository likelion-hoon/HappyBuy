package com.jonghoon.happybuy.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createReply")
public class createReply extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		String content = request.getParameter("content"); 
		int board_id = Integer.parseInt(request.getParameter("board_id")); 
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		PrintWriter out = response.getWriter(); 
		ReplyDAO replyDAO = new ReplyDAO(); 
		Reply reply = new Reply(content, board_id, user_id); 
		
		String context = request.getSession().getServletContext().getContextPath();
		
		if(replyDAO.insertReply(reply) > 0) {
			out.println("<script> alert('댓글이 작성되었습니다.'); location.href='"+context+"/show.jsp?idx="+board_id+"'</script>"); 
		} else {
			out.println("<script> alert('댓글 작성에 실패하였습니다.'); location.href='"+context+"/show.jsp?idx="+board_id+"'</script>");
		}
		
		out.close(); 
		replyDAO.close(); 
	}
}
