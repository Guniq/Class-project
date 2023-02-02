<%@page import="model.ClassDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="model.ClassDTO"/>

<!-- 폼에서 전송된 모든 프로퍼티를 dto에 설정 -->
<jsp:setProperty name="dto" property="*" />

<%
	ClassDAO dao = new ClassDAO();
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	int n = dao.classDelete(classNo);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
%>
	<script>
		alert("삭제 성공!");
		window.location.href="classList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패!");
		window.location.href="classList.jsp";
	</script>
<%} %>
