<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="model.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="model.StudentDTO"/>

<!-- 폼에서 전송된 모든 프로퍼티를 dto에 설정 -->
<jsp:setProperty name="dto" property="*" />

<%
	StudentDAO dao = new StudentDAO();

	String studentId = request.getParameter("studentId");
	String studentPw = request.getParameter("studentPw");

	int n = dao.studentLogin(studentId, studentPw);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
		session.setAttribute("studentId", dto.getStudentId());
%>
	<script>
		window.location.href="index.jsp";
	</script>
<%}else{ %>
	<script>
		alert("로그인에 실패했습니다. 아이디나 비밀번호를 확인해주세요!");
		window.location.href="index.jsp";
	</script>
<%} %>
