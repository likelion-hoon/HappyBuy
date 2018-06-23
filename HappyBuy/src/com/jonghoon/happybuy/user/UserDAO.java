package com.jonghoon.happybuy.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

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
				user.setSeller(rs.getBoolean("isSeller"));
				user.setEmailHash(rs.getString("emailHash"));
				user.setEmailChecked(rs.getBoolean("emailChecked"));
				
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
		
		String sql = "insert into user(email, password, number, gender, address, pnumber, profilePath, emailHash, emailChecked) values (?,?,?,?,?,?,?,?,?)";
		
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
			pstmt.setString(8, user.getEmailHash()); 
			pstmt.setBoolean(9, user.isEmailChecked()); 
			
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
					return "http://127.0.0.1:8080/HappyBuy/profile/default.png"; 
				}
				return "http://127.0.0.1:8080/HappyBuy/profile/"+rs.getString(1);
			}
			
		} catch (SQLException e) {
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
	
	// 유저리스트 리턴 받는 함수('유저 목록 보기'에서 사용)
	public ArrayList<User> getUserList() {
		
		ArrayList<User> list = new ArrayList<>(); 
		String sql = "select * from user order by idx desc";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
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
				list.add(user); 
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 이메일 관련 함수 작성
	// 이메일 등록 여부 반환
	public boolean getUserEmailChecked(String email) {
		
		String sql = "select emailChecked from user where email = ?"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getBoolean(1); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
				
		return false; 
	}
	
	public boolean setUserEmailChecked(String email) {
		
		String sql = "update user set emailChecked = true where email = ?";
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate(); 
			
			return true;  // 이메일 등록 설정 성공
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return false; // 실패
	}
	
	// 파라미터와 같은 휴대폰 번호가 있을경우 email 리턴
	public String getEmailInPnum(String pnumber) {
		
		String sql = "select email from user where pnumber = ?";
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnumber);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString(1); 
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return "";
	}
	
	// 비밀번호 찾기 요청에서 맞는지 틀린지 반환
	public boolean findPasswordCheck(String email, String pnumber) {
		
		String sql = "select email, pnumber from user where email = ?"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(email) && rs.getString(2).equals(pnumber)) {
					return true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return false; 
	}
	
	// 임시 비밀번호 만드는 함수
	public String getTemporaryPassword() {
		String[] res = UUID.randomUUID().toString().split("-");
		return res[0]; 
	}
	
	// 해당 이메일의 비밀번호 임시 비밀번호로 바꾸기 
	public int setTemporaryPassword(String password, String email) {
		
		String sql = "update user set password = ? where email = ?"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			
			return pstmt.executeUpdate(); 
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// 전체 휴대폰 형식 얻어 오기 
	/*
	public String getTotalPnum(String num) { 
		
		int len = num.length(); 
		
		String fn = num.substring(0, 3); 
		String sn = num.substring(3, len-4); 
		String tn = num.substring(len-4);
		
		return fn+sn+tn; 
	}
	*/
}
