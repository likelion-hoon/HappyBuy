package com.jonghoon.happybuy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.jonghoon.happybuy.common.JdbcHelper;


public class BoardDAO {
	
	// 맴버변수 설정
	private Connection conn = null; 
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 
	private DataSource dataSource = null;
	
	public BoardDAO() {
		try {
			InitialContext ic = new InitialContext();
			dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	// create.jsp에서 실행 -> 게시판 글 등록
	public int insertBoard(Board board) {
		
		String sql = "insert into board(title, content, fileName, fileRealName, user_id) values (?,?,?,?,?)";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getFileName());
			pstmt.setString(4, board.getFileRealName());
			pstmt.setInt(5, board.getUser_id());
			
			return pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt); 
		}
		
		return -1; 
	}
	
	// 게시판 글 삭제 
	public int deleteBoard(int idx) {
		
		String sql = "delete from board where idx = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// 게시판 글 수정
	public int updateBoard(Board board) {
		
		String sql = "update board set title = ?, content = ?, fileName = ?, fileRealName = ? where idx = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getFileName());
			pstmt.setString(4, board.getFileRealName());
			pstmt.setInt(5, board.getIdx());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}

	// show.jsp에서 얻어오는 값 -> 게시판 글 조회
	public Board getBoard(int idx) {
		
		String sql = "select * from board where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Board board = new Board(); 
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setRecom(rs.getInt("recom"));
				board.setDate(rs.getString("date"));
				board.setFileName(rs.getString("fileName"));
				board.setFileRealName(rs.getString("fileRealName"));
				
				return board;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return null; 
	}
		
	// board.jsp에 나타날 List<Board> 값을 얻어온다.
	public List<Board> getBoardList(String opt, String keyword) {
		
		List<Board> list = new ArrayList<Board>();
		
		try {
			conn = dataSource.getConnection();
			StringBuffer sql = new StringBuffer();  
			
		// 제목 검색 일떄 
		if(opt.equals("searchTitle")) {
			sql.append("select * from board where title like ?"); 
			sql.append(" order by idx desc");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + keyword + "%");
		} else if(opt.equals("searchContent")) { // 내용 검색 일때 
			sql.append("select * from board where content like ?");
			sql.append(" order by idx desc");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + keyword + "%");
		} else { // 검색 아닌 일반적인 경우
			sql.append("select * from board order by idx desc"); 
			pstmt = conn.prepareStatement(sql.toString());
		}
	
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(); 
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setRecom(rs.getInt("recom"));
				board.setDate(rs.getString("date"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 게시글의 조회수를 올려주는 함수
	public void increaseHit(int idx)  {
		
		String sql = "update board set hit = hit + 1 where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
	}
	
	// 추천수를 올려주는 함수 
	public int increaseRecom(int idx) {
		
		String sql = "update board set recom = recom + 1 where idx = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// 추천 중복 체크 하는 함수 
	public int checkRecom(String email, int idx) {
		
		String sql = "insert into recommend values (?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, idx);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1;
	}
	
}
