package model;

public class ClassDTO {
	private int classNo;
	private String className;
	private String classTeacher;
	private String classCategory;
	private String classMajor;
	private int classPeople;
	private String classDate;
	
	public ClassDTO() {}
	
	public ClassDTO(int classNo, String className, String classTeacher, String classCategory, String classMajor,
			int classPeople, String classDate) {
		super();
		this.classNo = classNo;
		this.className = className;
		this.classTeacher = classTeacher;
		this.classCategory = classCategory;
		this.classMajor = classMajor;
		this.classPeople = classPeople;
		this.classDate = classDate;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassTeacher() {
		return classTeacher;
	}

	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}

	public String getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}

	public String getClassMajor() {
		return classMajor;
	}

	public void setClassMajor(String classMajor) {
		this.classMajor = classMajor;
	}

	public int getClassPeople() {
		return classPeople;
	}

	public void setClassPeople(int classPeople) {
		this.classPeople = classPeople;
	}

	public String getClassDate() {
		return classDate;
	}

	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}

	@Override
	public String toString() {
		return "ClassDTO [classNo=" + classNo + ", className=" + className + ", classTeacher=" + classTeacher
				+ ", classCategory=" + classCategory + ", classMajor=" + classMajor + ", classPeople=" + classPeople
				+ ", classDate=" + classDate + "]";
	}
}
