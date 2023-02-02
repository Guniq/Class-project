package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// db연결
	public void getConnection() {
		String url = "jdbc:mysql://localhost:3306/sample?serverTimeZone=Asia/Seoul";
		String user = "testUser";
		String pw = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("데이터베이스 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연결 실패...");
		}
	}
	
	// 자원 반납
	public void dbClose() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public int adminLogin(String adminId, String adminPw) {
		
		int n = -1;
		String sql = "SELECT adminPw "
					+ " FROM c_admin "
					+ " WHERE adminId = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, adminId);
			rs = ps.executeQuery();
			
			if(rs.next()) { // 아이디가 존재
				String dbPw = rs.getString("adminPw");
				if(dbPw.equals(adminPw)) { // 로그인 성공
					n = 1;
				}else { // 비밀번호 틀림
					n = 0;
				}
			}else { // 아이디가 존재 x
				n = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return n;
	}
	
}
