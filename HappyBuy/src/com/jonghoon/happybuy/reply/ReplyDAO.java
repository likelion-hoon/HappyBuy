package com.jonghoon.happybuy.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.jonghoon.happybuy.common.JdbcHelper;


public class ReplyDAO {
	
	private Connection conn = null; 
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 
	private DataSource dataSource = null;

	public ReplyDAO() {
		try {
			InitialContext ic = new InitialContext();
			dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	// DB에 댓글을 넣는 함수
	public int insertReply(Reply reply) {
		
		String sql = "insert into reply(content, board_id, user_id) values (?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reply.getContent());
			pstmt.setInt(2,reply.getBoard_id());
			pstmt.setInt(3,reply.getUser_id());
			
			return pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	public ArrayList<Reply> getReplyList(int board_id) {
		
		ArrayList<Reply> list = new ArrayList<>(); 
		String sql = "select * from reply where board_id = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply(); 
				reply.setIdx(rs.getInt("idx"));
				reply.setContent(rs.getString("content"));
				reply.setDate(rs.getString("date"));
				reply.setBoard_id(rs.getInt("board_id"));
				reply.setUser_id(rs.getInt("user_id"));
				list.add(reply); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return list; 
	}
}
