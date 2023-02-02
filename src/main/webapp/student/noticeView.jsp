<%@page import="model.NoticeDTO"%>
<%@page import="model.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeDAO dao = new NoticeDAO();
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDTO dto = dao.noticeView(noticeNo);
%>

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;"><%=dto.getNoticeTitle() %></h5>
		<p><%=dto.getNoticeWriter() %></p>
		<hr>
		<p><%=dto.getNoticeContents() %></p>
		<a href="${ctx}/student/noticeList.jsp" class="btn btn-secondary mt-3">목록으로</a>
	</div>	
</main>
