package com.jonghoon.happybuy.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.jonghoon.happybuy.common.JdbcHelper;

public class AdminDAO {
	
	// 맴버변수 설정
	private Connection conn = null; 
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 
	private DataSource dataSource = null;
	
	public AdminDAO() {
		try {
			InitialContext ic = new InitialContext();
			this.dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	public boolean login(String id, String password) {
		
		String sql = "select * from admin where identi = ? and password = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(id.equals(rs.getString("identi")) && password.equals(rs.getString("password"))) {
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
}
