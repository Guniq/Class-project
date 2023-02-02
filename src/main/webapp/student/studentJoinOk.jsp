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
	int n = dao.studentInsert(dto);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
%>
	<script>
		alert("회원가입 축하드립니다~~");
		window.location.href="index.jsp";
	</script>
<%}else{ %>
	<script>
		alert("회원가입 실패!");
		window.location.href="studentJoin.jsp";
	</script>
<%} %>
