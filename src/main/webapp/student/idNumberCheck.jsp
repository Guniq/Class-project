<%@page import="model.CollegeDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="model.CollegeDTO"/>

<!-- 폼에서 전송된 모든 프로퍼티를 dto에 설정 -->
<jsp:setProperty name="dto" property="*" />

<%
	CollegeDAO dao = new CollegeDAO();
	int studentNo =  Integer.parseInt(request.getParameter("studentNo"));
	int n = dao.numberCheck(studentNo);
	
	if(n == 1){
%>
	<script>
		alert("학번이 맞습니다. 회원가입을 계속하세요!");
		window.location.href="studentJoin.jsp";
	</script>
<%}else{ %>
	<script>
		alert("학번을 틀렸습니다. 학번을 확인하세요!");
		window.location.href="studentJoin.jsp";
	</script>
<%} %>
