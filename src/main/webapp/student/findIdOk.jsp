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
	String studentName = request.getParameter("studentName");
	
	dto = dao.findId(studentNo, studentName);
	
	if(dto != null){
		session.setAttribute("findStudentId", dto.getStudentId());
%>
	<script>
		alert("아이디 찾기 성공! 아이디를 확인하세요.");
		window.location.href="findId.jsp";
	</script>
<%}else{ %>
	<script>
		alert("아이디 찾기에 실패했습니다. 학번이나 이름을 확인해주세요!");
		window.location.href="findId.jsp";
	</script>
<%} %>
