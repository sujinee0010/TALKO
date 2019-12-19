package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginController {
	
	
	//로그인
	public static boolean isUser(String email,String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		
		try {
			
		String pass;
		Connection conn =null;
		PreparedStatement stmt = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
		 
		String sql = "select * from user where email = ? ";
		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,email);
			ResultSet rs  = stmt.executeQuery();
			rs.next();
			pass = rs.getString("password");
	
			if(pass.equals(password)) {
				return true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	
	//이메일 중복 검사 
	public static boolean isUsed(String email) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		
		try {

		Connection conn =null;
		PreparedStatement stmt = null;
	
		System.out.println("make lesson 연결전 ");

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
			
		
		String sql = "select email from user";
		
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("email").equals(email)) {
					return true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
}
