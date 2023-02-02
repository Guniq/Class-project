package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CartDAO {
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
	
	// 수강신청
	public int cartInsert(CartDTO dto) {
		
		String sql = "INSERT INTO cart(className"
									+ ", classTeacher"
									+ ", classCategory"
									+ ", classMajor"
									+ ", classDate)"
								+ " VALUE(?, ?, ?, ?, ?)";
		
		getConnection();
		
		int n = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getClassName());
			ps.setString(2, dto.getClassTeacher());
			ps.setString(3, dto.getClassCategory());
			ps.setString(4, dto.getClassMajor());
			ps.setString(5, dto.getClassDate());
			
			n = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return n;
	}
	
	// 수강내역리스트
	public ArrayList<CartDTO> cartList(){
		
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		String sql = "SELECT * FROM cart ORDER BY cartNo DESC";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			list = getCartList(rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return list;
	}
	
	public ArrayList<CartDTO> getCartList(ResultSet rs){
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
			try {
				while(rs.next()) {
					int cartNo = Integer.parseInt(rs.getString("cartNo"));
					String className = rs.getString("className");
					String classTeacher = rs.getString("classTeacher");
					String classCategory = rs.getString("classCategory");
					String classMajor = rs.getString("classMajor");
					String classDate = rs.getString("classDate");
					
					CartDTO dto = new CartDTO(cartNo, className, classTeacher, classCategory, 
							classMajor, classDate);
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	// 강의삭제
	public int cartDelete(int cartNo) {
		
		int n = -1;
		String sql = "DELETE FROM cart "
					+ "WHERE cartNo = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cartNo);
			n = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return n;
	}
	
}
