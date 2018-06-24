package com.jonghoon.happybuy.merchandise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jonghoon.happybuy.user.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/uploadMerchanProc")
public class uploadMerchanProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); 
		MultipartRequest multi = null; 
		int fileSize = 1024*1024*10; // 최대 10mb
		String directory = request.getSession().getServletContext().getRealPath("/goods");
		
		try {
			 multi = new MultipartRequest(request, directory, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		 } catch(Exception e) {
			 e.printStackTrace();
			 response.sendRedirect("merchan/profileEdit.jsp");
			 return;
		 }
		
		String identiChar = multi.getParameter("selTwo"); // 판별번호
		String title = multi.getParameter("title");  // 제목
		String description = multi.getParameter("description"); // 설명
		int price = Integer.parseInt(multi.getParameter("price"));  // 가격
		String dueDate = multi.getParameter("datepicker"); // 날짜(dueDate)
		String picUrl = multi.getFilesystemName("file"); 
		int user_id = Integer.parseInt(multi.getParameter("idx"));
		
		System.out.println(identiChar);
		System.out.println(title);
		System.out.println(description);
		System.out.println(price);
		System.out.println(dueDate);
		System.out.println(picUrl);
		System.out.println(user_id);
		
		MerchanDAO merchanDAO = new MerchanDAO(); 
		Merchan merchan = new Merchan(identiChar, title, description, price, dueDate, picUrl, user_id);
		
		// 상품 insert하는 함수 만들어야 함
		if(merchanDAO.uploadGoods(merchan) > 0) {
			out.println("<script> alert('상품 업로드에 성공하였습니다.'); location.href='/HappyBuy/merchan/shopping.jsp' </script>"); 
		} else {
			out.println("<script> alert('상품 업로드에 실패하였습니다.'); history.go(-1) </script>"); 
		}
	}
}
