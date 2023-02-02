package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ClassDAO {
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
	
	// 강의등록
	public int classInsert(ClassDTO dto) {
		
		String sql = "INSERT INTO class(className"
									+ ", classCategory"
									+ ", classMajor"
									+ ", classTeacher"
									+ ", classPeople"
									+ ", classDate)"
								+ " VALUE(?, ?, ?, ?, ?, ?)";
		
		getConnection();
		
		int n = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getClassName());
			ps.setString(2, dto.getClassCategory());
			ps.setString(3, dto.getClassMajor());
			ps.setString(4, dto.getClassTeacher());
			ps.setInt(5, dto.getClassPeople());
			ps.setString(6, dto.getClassDate());
			
			n = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return n;
	}
	
	// 강의리스트
	public ArrayList<ClassDTO> classList(){
		
		ArrayList<ClassDTO> list = new ArrayList<ClassDTO>();
		String sql = "SELECT * FROM class ORDER BY classNo DESC";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			list = getClassList(rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return list;
	}
	
	public ArrayList<ClassDTO> getClassList(ResultSet rs){
		ArrayList<ClassDTO> list = new ArrayList<ClassDTO>();
			try {
				while(rs.next()) {
					int classNo = Integer.parseInt(rs.getString("classNo"));
					String className = rs.getString("className");
					String classTeacher = rs.getString("classTeacher");
					String classCategory = rs.getString("classCategory");
					String classMajor = rs.getString("classMajor");
					int classPeople = rs.getInt("classPeople");
					String classDate= rs.getString("classDate");
					
					ClassDTO dto = new ClassDTO(classNo, className, classTeacher, classCategory, 
							classMajor, classPeople, classDate);
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	// 강의삭제
	public int classDelete(int classNo) {
		
		int n = -1;
		String sql = "DELETE FROM class "
					+ "WHERE classNo = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, classNo);
			n = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return n;
	}
	
	// 강의상세보기
	public ClassDTO classView(int classNo) {
		
		ClassDTO dto = new ClassDTO();
		String sql = "SELECT * FROM class "
					+ "WHERE classNo = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, classNo);
			rs = ps.executeQuery();
			
			ArrayList<ClassDTO> list = getClassList(rs);
			
			if(list.size() != 0 && list != null) {
				dto = list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return dto;
	}
}
