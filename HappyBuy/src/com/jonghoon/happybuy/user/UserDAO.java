package com.jonghoon.happybuy.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public UserDAO() {
		try {
			InitialContext ic = new InitialContext();
			DataSource dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
			conn = dataSource.getConnection();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	// 로그인 유효성 체크
	public boolean login(String email, String password) {
		try {
			
			pstmt = conn.prepareStatement("select * from user where email = ? and password = ?");
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	// 해당 email을 가지고 있는 user를 return 해주는 함수
	public User getUser(int user_id) {
		try {
			pstmt = conn.prepareStatement("select * from user where idx = ?");
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
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// registrationProc.java에서 user정보를 db에 insert하는 함수
	public int insertUser(User user) {
		
		try {
			pstmt = conn.prepareStatement("insert into user(email, password, number, gender, address, pnumber, profilePath) values (?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getNumber());
			pstmt.setBoolean(4, user.isGender());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPnumber());
			pstmt.setString(7, "");
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 값을 집어넣고 return true를 실행함
		
		return -1; 
	}
	
	// email을 파라메타로 받아서 idx를 리턴하는 함수 만들기 
	public int getUserIdx(String email) {
		try {
			pstmt = conn.prepareStatement("select idx from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getInt(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1; 
	}
	
	// board_id를 파라메타로 받아서 email을 리턴하는 함수 만들기 
	public String getUserEmail(int board_id) {
		
		try {
			pstmt = conn.prepareStatement("select email from user where idx = (select user_id from board where idx = ?)");
			pstmt.setInt(1, board_id); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString(1); // 해당 email 값 리턴
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return null; // 값을 찾을 수 없을 때 null리턴
	}
	
	public String getProfile(int user_id) {
		try {
			pstmt = conn.prepareStatement("select profilePath from user where idx = ?");
			pstmt.setInt(1,user_id); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				if(rs.getString(1).equals("")) {
					return "http://localhost:8080/HappyBuy/images/default.png"; 
				}
				return "http://localhost:8080/HappyBuy/images".concat(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return "http://localhost:8080/HappyBuy/images/default.png"; 
	}
	
	// 유저 정보 바꾸는 메소드 
	public void changeUserInformation() {
		
	}
	
	// 모든 연결자원 접속종료 
	public void close()  {
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
