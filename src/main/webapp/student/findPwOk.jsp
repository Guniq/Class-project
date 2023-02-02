<%@page import="model.StudentDTO"%>
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

	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String studentId = request.getParameter("studentId");
	
	dto = dao.findPw(studentNo, studentId);
	
	if(dto != null){
		session.setAttribute("findStudentPw", dto.getStudentPw());
%>
	<script>
		alert("비밀번호 찾기 성공! 비밀번호를 확인하세요.");
		window.location.href="findPw.jsp";
	</script>
<%}else{ %>
	<script>
		alert("비밀번호 찾기에 실패했습니다. 학번이나 아이디를 확인해주세요!");
		window.location.href="findPw.jsp";
	</script>
<%} %>
