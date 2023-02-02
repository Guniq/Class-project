package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;


public class NoticeDAO {
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
	
	// 공지등록
	public int noticeInsert(NoticeDTO dto) {
		
		String sql = "INSERT INTO notice(noticeTitle "
									+ ", noticeWriter "
									+ ", noticeContents)"
								+ " VALUE(?, ?, ?)";
		
		getConnection();
		
		int n = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getNoticeTitle());
			ps.setString(2, dto.getNoticeWriter());
			ps.setString(3, dto.getNoticeContents());
			
			n = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return n;
	}
	
	// 공지리스트
	public ArrayList<NoticeDTO> noticeList(){
		
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		String sql = "SELECT * FROM notice ORDER BY noticeNo DESC";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			list = getNoticeList(rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return list;
	}
	
	public ArrayList<NoticeDTO> getNoticeList(ResultSet rs){
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
			try {
				while(rs.next()) {
					int noticeNo = Integer.parseInt(rs.getString("noticeNo"));
					String noticeTitle = rs.getString("noticeTitle");
					String noticeWriter = rs.getString("noticeWriter");
					String noticeContents = rs.getString("noticeContents");
					Date noticeDate= rs.getDate("noticeDate");
					
					NoticeDTO dto = new NoticeDTO(noticeNo, noticeTitle, noticeWriter, noticeContents, noticeDate);
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	// 공지삭제
	public int noticeDelete(int noticeNo) {
		
		int n = -1;
		String sql = "DELETE FROM notice "
					+ "WHERE noticeNo = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, noticeNo);
			n = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return n;
	}
	
	// 강의상세보기
	public NoticeDTO noticeView(int noticeNo) {
		
		NoticeDTO dto = new NoticeDTO();
		String sql = "SELECT * FROM notice "
					+ "WHERE noticeNo = ?";
		
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, noticeNo);
			rs = ps.executeQuery();
			
			ArrayList<NoticeDTO> list = getNoticeList(rs);
			
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
