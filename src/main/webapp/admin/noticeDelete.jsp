<%@page import="model.NoticeDAO"%>
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
	NoticeDAO dao = new NoticeDAO();
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	int n = dao.noticeDelete(noticeNo);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
%>
	<script>
		alert("삭제 성공!");
		window.location.href="noticeList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패!");
		window.location.href="noticeList.jsp";
	</script>
<%} %>
