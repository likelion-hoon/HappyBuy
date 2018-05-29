package com.jonghoon.happybuy.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardSearchProc")
public class boardSearchProc extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String opt = request.getParameter("opt");
		String keyword = request.getParameter("searchKeyword"); 
		
		HashMap<String, String> map = new HashMap<>(); 
		map.put("opt", opt); 
		map.put("keyword", keyword);
		request.setAttribute("map", map);
	}
}
