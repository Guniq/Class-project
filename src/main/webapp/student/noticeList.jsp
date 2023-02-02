<%@page import="model.NoticeDTO"%>
<%@page import="model.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
 
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">공지사항</h5>
		<table class="table table-bordered mt-4 text-center">
			<thead style="background-color:#D3D3D3;">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>게시일</th>
				</tr>
			</thead>
			<tbody>
			<%
				NoticeDAO dao = new NoticeDAO();
				ArrayList<NoticeDTO> list = dao.noticeList();
				
				if(list == null || list.size() == 0){
					out.println("<tr><td colspan='12'>");
					out.println("등록된 공지사항이 없습니다!!");
					out.println("</tr>");
				}
				
				for(NoticeDTO dto : list){
			%>
				<tr>
					<td><a href="noticeView.jsp?noticeNo=<%=dto.getNoticeNo()%>"><%=dto.getNoticeTitle()%></a></td>
					<td><%=dto.getNoticeWriter()%></td>
					<td><%=dto.getNoticeContents()%></td>
					<td><%=dto.getNoticeDate()%></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</main>
