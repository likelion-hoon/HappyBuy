package com.jonghoon.happybuy.merchandise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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
	
	// 상품 등록
	// 상품 삭제 
	// 상품 수정
	// getMyMerchan() -> 내가 올린 물품을 볼수 있게 
	// 모든 물품을 내림차순으로 가져오는 함수 
	// 조회수가 가장 높은 순으로 정렬 
	// 구매수가 가장 높은 순으로 정렬
	
	
}
