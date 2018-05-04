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

	public User getUser(String email) {
		try {
			pstmt = conn.prepareStatement("select * from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setIdx(rs.getInt("idx"));
				user.setEmail(rs.getString("email"));
				user.setPasscheck(rs.getString("password"));
				user.setNumber(rs.getString("number"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("address"));
				user.setPnumber(rs.getString("pnumber"));
				user.setPoint(rs.getString("point"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}
