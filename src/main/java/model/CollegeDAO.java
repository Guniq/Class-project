package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollegeDAO {
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
	
	// 학번확인
	public int numberCheck(int studentNo) {
		
		String sql = "SELECT c.studentNo "
				   + " FROM college c "
				   + " RIGHT JOIN student s "
				   + " ON c.studentNo = ?";
		
		getConnection();
		
		int n = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, studentNo);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				int dbNo = rs.getInt("studentNo");
				
				if(dbNo == studentNo) { // 학번 일치
					n = 1;
					
				}else { // 학번 불일치
					n = -1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return n;
	}
	
}
