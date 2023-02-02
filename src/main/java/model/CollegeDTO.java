package model;

import java.sql.Date;

public class CollegeDTO {
	private int studentNo;
	private String collegeMajor;
	private Date collegeDate;
	
	
	public int getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
	public String getCollegeMajor() {
		return collegeMajor;
	}
	public void setCollegeMajor(String collegeMajor) {
		this.collegeMajor = collegeMajor;
	}
	public Date getCollegeDate() {
		return collegeDate;
	}
	public void setCollegeDate(Date collegeDate) {
		this.collegeDate = collegeDate;
	}
	
}
