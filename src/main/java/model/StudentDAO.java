package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {
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
	
	// 회원가입
	public int studentInsert(StudentDTO dto) {
		
		String sql = "INSERT INTO student(studentNo"
									+ ", studentName"
									+ ", studentId"
									+ ", studentPw"
									+ ", studentEmail)"
								+ " VALUE(?, ?, ?, ?, ?)";
		
		getConnection();
		
		int n = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getStudentNo());
			ps.setString(2, dto.getStudentName());
			ps.setString(3, dto.getStudentId());
			ps.setString(4, dto.getStudentPw());
			ps.setString(5, dto.getStudentEmail());
			
			n = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return n;
	}
	
	// 로그인
	public int studentLogin(String studentId, String studentPw) {
		
		int n = -1;
		String sql = "SELECT studentPw "
					+ " FROM student "
					+ " WHERE studentId = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, studentId);
			rs = ps.executeQuery();
			
			if(rs.next()) { // 아이디가 존재
				String dbPw = rs.getString("studentPw");
				if(dbPw.equals(studentPw)) { // 로그인 성공
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
	
	// 아이디 찾기
	public StudentDTO findId(int studentNo, String studentName) {
		
		StudentDTO dto = new StudentDTO();
		
		String sql = "SELECT studentId "
				+ "FROM student "
				+ "WHERE studentNo = ? "
				+ "AND studentName = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, studentNo);
			ps.setString(2, studentName);
			rs = ps.executeQuery();
			
			if(rs.next()) { 
				dto.setStudentId(rs.getString("studentId"));
			}else {
				dto = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return dto;
	}
	
	// 비밀번호 찾기
	public StudentDTO findPw(int studentNo, String studentId) {
		
		StudentDTO dto = new StudentDTO();
		
		String sql = "SELECT studentPw "
				+ "FROM student "
				+ "WHERE studentNo = ? "
				+ "AND studentId = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, studentNo);
			ps.setString(2, studentId);
			rs = ps.executeQuery();
			
			if(rs.next()) { 
				dto.setStudentPw(rs.getString("studentPw"));
			}else {
				dto = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return dto;
	}
	
}
