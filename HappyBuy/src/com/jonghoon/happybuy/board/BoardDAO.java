package com.jonghoon.happybuy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardDAO {
	
	// 맴버변수 설정
	private Connection conn = null; 
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 
	
	public BoardDAO() {
		try {
			InitialContext ic = new InitialContext();
			DataSource dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
			conn = dataSource.getConnection();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} 
	}
	
	// create.jsp에서 실행 -> 게시판 글 등록
	public int insertBoard(Board board) {
		try {
			pstmt = conn.prepareStatement("insert into board(title, content, name) values (?,?,?)");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getName());
			
			return pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1; 
	}
	
	// 게시판 글 삭제 
	public boolean deleteBoard(int idx) {
		return true; 
	}
	
	// 게시판 글 수정
	public boolean updateBoard(Board board) {
		return true; 
	}

	// show.jsp에서 얻어오는 값 -> 게시판 글 조회
	public Board getBoard(int idx) {
		return null; 
	}
	
	// board.jsp에 나타날 List<Board> 값을 얻어온다.
	public List<Board> getBoardList() {
		
		List<Board> list = new ArrayList<Board>(); 
		try {
			pstmt = conn.prepareStatement("select * from board order by idx desc");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(); 
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setName(rs.getString("name"));
				board.setHit(rs.getInt("hit"));
				board.setRecom(rs.getInt("recom"));
				board.setDate(rs.getString("date"));
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void close() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}