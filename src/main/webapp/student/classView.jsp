<%@page import="model.ClassDTO"%>
<%@page import="model.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ClassDAO dao = new ClassDAO();
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	ClassDTO dto = dao.classView(classNo);
%>

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">수강신청</h5>
		<hr>
		<form action="classRegisterOk.jsp" method="post" id="joinForm">
		<div class="text-center p-5">
			<p><b>강의정보</b></p>
				<div class="d-flex justify-content-center mt-2">
					<p class="me-4 col-md-2">카테고리</p>
					<input type="text" class="form-control col-md-4" name="classCategory" value="<%=dto.getClassCategory()%>" readonly/>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<p class="me-4 col-md-2">강의명</p>
					<input type="text" class="form-control col-md-4" name="className" value="<%=dto.getClassName() %>" readonly/>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<p class="me-4 col-md-2">교수명</p>
					<input type="text" class="form-control col-md-4" name="classTeacher" value="<%=dto.getClassTeacher() %>" readonly/>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<p class="me-4 col-md-2">전공</p>
					<input type="text" class="form-control col-md-4" name="classMajor" value="<%=dto.getClassMajor() %>" readonly/>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<p class="me-4 col-md-2">수강시간</p>
					<input type="text" class="form-control col-md-4" name="classDate" value="<%=dto.getClassDate() %>" readonly/>
				</div>
			<input type="submit" class="btn btn-primary mt-4 w-25" style="height:45px;" value="수강신청"/>
			</div>
		</form>
	</div>	
</main>

