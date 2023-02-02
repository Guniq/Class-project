<%@page import="model.AdminDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="model.AdminDTO"/>

<!-- 폼에서 전송된 모든 프로퍼티를 dto에 설정 -->
<jsp:setProperty name="dto" property="*" />

<%
	AdminDAO dao = new AdminDAO();

	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");

	int n = dao.adminLogin(adminId, adminPw);
	
	if(n == 1){
		session.setAttribute("adminId", dto.getAdminId());
%>
	<script>
		window.location.href="admin.jsp";
	</script>
<%}else{ %>
	<script>
		alert("로그인에 실패했습니다. 아이디나 비밀번호를 확인해주세요!");
		window.location.href="adminLogin.jsp";
	</script>
<%} %>
