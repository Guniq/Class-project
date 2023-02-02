<%@page import="model.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
 
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">수강신청내역</h5>
		<hr>
		<table class="table table-bordered mt-4 text-center">
			<thead style="background-color:#D3D3D3;">
				<tr>
					<th>카테고리</th>
					<th>학과</th>
					<th>교수</th>
					<th>강의명</th>
					<th>수강시간</th>
					<th>수강취소</th>
				</tr>
			</thead>
			<tbody>
				<%
					CartDAO dao = new CartDAO();
					ArrayList<CartDTO> list = dao.cartList();
					
					if(list == null || list.size() == 0){
						out.println("<tr><td colspan='12'>");
						out.println("신청한 강의가 없습니다!!");
						out.println("</tr>");
					}
					
					for(CartDTO dto : list){
				%>
				<tr>
					<td><%=dto.getClassCategory() %></td>
					<td><%=dto.getClassMajor() %></td>
					<td><%=dto.getClassTeacher() %></td>
					<td><%=dto.getClassName() %></td>
					<td><%=dto.getClassDate() %></td>
					<td><a href="${ctx}/student/cartDelete.jsp?cartNo=<%=dto.getCartNo() %>" class="btn btn-sm btn-danger">취소</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<a href="${ctx}/student/classList.jsp" class="btn btn-secondary mt-3">강의목록</a>
	</div>
</main>
