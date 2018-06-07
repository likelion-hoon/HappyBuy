package com.jonghoon.happybuy.merchandise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.jonghoon.happybuy.common.JdbcHelper;

public class MerchanDAO {

	// 맴버변수 설정
	private Connection conn = null; 
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 
	private DataSource dataSource = null;
	
	public MerchanDAO() {
		try {
			InitialContext ic = new InitialContext();
			this.dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	// 판매자 신청 로직 처리 
	public int insertSellerRegister(String email, String reason) {
		
		String sql = "insert into sellerRegister(email, reason) values (?,?)"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, reason);
			
			return pstmt.executeUpdate(); 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// 모든 신청자를 불러오는 함수 필요
	public ArrayList<sellerRegisterDTO> getRegisterList() {
		
		ArrayList<sellerRegisterDTO> list = new ArrayList<>(); 
		String sql = "select * from sellerRegister order by date desc"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				sellerRegisterDTO srd = new sellerRegisterDTO(); 
				srd.setEmail(rs.getString("email"));
				srd.setReason(rs.getString("reason"));
				srd.setDate(rs.getString("date"));
				
				list.add(srd); 
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt, rs);
		}
		
		return list; 
	}
	
	// 고객(0) -> 판매자(1)로 바꿔주는 함수(permitSeller)
	public int userToSeller(String idx)  {
		
		String sql = "update user set isSeller = ? where idx = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1); 
			pstmt.setInt(2, Integer.parseInt(idx));
			
			return pstmt.executeUpdate(); 
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt); 
		}
	
		return -1; 
	}
	
	// 판매자(1) -> 고객(0)으로 바꿔주는 함수(cancelSeller)
	public int sellerToUser(String idx)  {
		
		String sql = "update user set isSeller = ? where idx = ?"; 
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0); 
			pstmt.setInt(2, Integer.parseInt(idx));
			
			return pstmt.executeUpdate(); 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt); 
		}
		
		return -1; 
	}
	
	// 판매자 요청취소(cancelDemand) 
	public int deleteRegister(String email) {
		
		String sql = "delete from sellerRegister where email = ?"; 
		
		try {
			conn = dataSource.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			return pstmt.executeUpdate(); 
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JdbcHelper.close(conn, pstmt);
		}
		
		return -1; 
	}
	
	// 상품 등록
	// 상품 삭제 
	// 상품 수정
	// getMyMerchan() -> 내가 올린 물품을 볼수 있게 
	// 모든 물품을 내림차순으로 가져오는 함수 
	// 조회수가 가장 높은 순으로 정렬 
	// 구매수가 가장 높은 순으로 정렬
	
}
