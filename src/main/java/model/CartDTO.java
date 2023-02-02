package model;

public class CartDTO {
	private int cartNo;
	private String className;
	private String classTeacher;
	private String classCategory;
	private String classMajor;
	private String classDate;
	
	
	public CartDTO() {}
	
	public CartDTO(int cartNo, String className, String classTeacher, String classCategory, String classMajor, String classDate) {
		super();
		this.cartNo = cartNo;
		this.className = className;
		this.classTeacher = classTeacher;
		this.classCategory = classCategory;
		this.classMajor = classMajor;
		this.classDate = classDate;
	}
	
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}

	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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


	@Override
	public String toString() {
		return "CartDTO [className=" + className + ", classTeacher=" + classTeacher + ", classCategory=" + classCategory
				+ ", classMajor=" + classMajor + "]";
	}
}
