package com.jonghoon.happybuy.user;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.jonghoon.happybuy.common.JdbcHelper;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource dataSource = null;

	public UserDAO() {
		try {
			InitialContext ic = new InitialContext();
			dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 로그인 유효성 체크
	public boolean login(String email, String password) {
		
		String sql = "select * from user where email = ? and password = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			// 존재한다면
			if (rs.next()) {
				if (email.equals(rs.getString("email")) && password.equals(rs.getString("password"))) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}

		return false;
	}

	// 해당 email을 가지고 있는 user를 return 해주는 함수
	public User getUser(int user_id) {
		
		String sql = "select * from user where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setIdx(rs.getInt("idx"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setNumber(rs.getString("number"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("address"));
				user.setPnumber(rs.getString("pnumber"));
				user.setPoint(rs.getString("point"));
				user.setProfilePath(rs.getString("profilePath"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return null;
	}
	
	public int insertUser(User user) {
		
		String sql = "insert into user(email, password, number, gender, address, pnumber, profilePath) values (?,?,?,?,?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getNumber());
			pstmt.setBoolean(4, user.isGender());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPnumber());
			pstmt.setString(7, ""); // 처음 회원가입 할때 profile image 없음
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// Reply의 user_id를 파라메타로 받아서 email을 리턴하는 함수 만들기
	public String getEmailInUserId(int user_id) {
		
		String sql = "select email from user where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return null;
	}
	
	// email을 파라메타로 받아서 idx를 리턴하는 함수 만들기 
	public int getUserIdx(String email) {
		
		String sql = "select idx from user where email = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getInt(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return -1; 
	}
	
	// board_id를 파라메타로 받아서 email을 리턴하는 함수 만들기 
	public String getEmailInBoardId(int board_id) {
		
		String sql = "select email from user where idx = (select user_id from board where idx = ?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString(1); // 해당 email 값 리턴
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return null; // 값을 찾을 수 없을 때 null리턴
	}
	
	public String getProfile(int user_id) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select profilePath from user where idx = ?");
			pstmt.setInt(1,user_id); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				if(rs.getString(1).equals("")) {
					return "http://localhost:8080/HappyBuy/images/default.png"; 
				}
				return "http://localhost:8080/HappyBuy/images/"+URLEncoder.encode(rs.getString(1),"UTF-8");
			}
			
		} catch (SQLException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn,pstmt,rs); 
		}
		
		return "http://localhost:8080/HappyBuy/images/default.png"; 
	}
	
	// 유저 정보 바꾸는 메소드 
	// 바꿔야 될 값은 new_password, address, pnumber, fileName, fileRealName
	public int changeUserInformation(User user) {
		
		String sql = "update user set password = ?, address = ?, pnumber = ?, profilePath = ? where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getAddress());
			pstmt.setString(3,  user.getPnumber());
			pstmt.setString(4, user.getProfilePath());
			pstmt.setInt(5,  user.getIdx());
			
			return pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
}
