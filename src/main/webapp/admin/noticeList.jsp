<%@page import="model.NoticeDTO"%>
<%@page import="model.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
	<%@ include file="/inc/ad_header.jsp" %>	
</header>
 
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">공지사항</h5>
		<table class="table table-bordered mt-4 text-center">
			<thead style="background-color:#D3D3D3;">
				<tr>
					<th class="col-md">제목</th>
					<th class="col-md">작성자</th>
					<th class="col-md">내용</th>
					<th class="col-md">게시일</th>
					<th class="col-md">삭제</th>
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
				
				for(NoticeDTO noticeDTO : list){
			%>
				<tr>
					<td><%=noticeDTO.getNoticeTitle()%></td>
					<td><%=noticeDTO.getNoticeWriter()%></td>
					<td><%=noticeDTO.getNoticeContents()%></td>
					<td><%=noticeDTO.getNoticeDate()%></td>
					<td><a href="${ctx}/admin/noticeDelete.jsp?noticeNo=<%=noticeDTO.getNoticeNo() %>" class="btn btn-sm btn-danger">삭제</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<a href="noticeInsert.jsp" class="btn btn-primary w-25 mt-3">공지사항 쓰기</a>
	</div>
</main>
