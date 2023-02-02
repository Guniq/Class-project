package model;

import java.sql.Date;

public class StudentDTO {
	private int studentNo;
	private String studentName;
	private String studentId;
	private String studentPw;
	private String studentEmail;
	private Date studentDate;
	
	
	public StudentDTO() {}
	
	public StudentDTO(int studentNo, String studentName, String studentId, String studentPw, String studentEmail,
			Date studentDate) {
		super();
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.studentId = studentId;
		this.studentPw = studentPw;
		this.studentEmail = studentEmail;
		this.studentDate = studentDate;
	}

	public int getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentPw() {
		return studentPw;
	}

	public void setStudentPw(String studentPw) {
		this.studentPw = studentPw;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public Date getStudentDate() {
		return studentDate;
	}

	public void setStudentDate(Date studentDate) {
		this.studentDate = studentDate;
	}

	@Override
	public String toString() {
		return "StudentDTO [studentNo=" + studentNo + ", studentName=" + studentName + ", studentId=" + studentId
				+ ", studentPw=" + studentPw + ", studentEmail=" + studentEmail + ", studentDate=" + studentDate + "]";
	}
}
