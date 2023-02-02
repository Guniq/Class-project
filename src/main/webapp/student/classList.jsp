<%@page import="model.ClassDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
 
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">강의리스트</h5>
		<table class="table table-bordered mt-4 text-center">
			<thead style="background-color:#D3D3D3;">
				<tr>
					<th>카테고리</th>
					<th>학과</th>
					<th>교수</th>
					<th>강의명</th>
					<th>정원</th>
					<th>수강시간</th>
					<th>신청</th>
				</tr>
			</thead>
			<tbody>
			<%
				ClassDAO dao = new ClassDAO();
				ArrayList<ClassDTO> list = dao.classList();
				
				if(list == null || list.size() ==0){
					out.println("<tr><td colspan='12'>");
					out.println("등록된 강의가 없습니다!!");
					out.println("</tr>");
				}
				
				for(ClassDTO dto : list){
			%>
				<tr>
					<td><%=dto.getClassCategory()%></td>
					<td><%=dto.getClassMajor()%></td>
					<td><%=dto.getClassTeacher()%></td>
					<td><%=dto.getClassName()%></td>
					<td><%=dto.getClassPeople()%></td>
					<td><%=dto.getClassDate()%></td>
					<td><a href="${ctx}/student/classView.jsp?classNo=<%=dto.getClassNo() %>" class="btn btn-sm btn-primary">신청</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</main>
