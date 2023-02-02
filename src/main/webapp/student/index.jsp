<%@page import="model.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.NoticeDAO"%>
<%@page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
    
<main>
	<div class="container d-flex">
		<div class="container border rounded mt-5 p-5 col-md-7 shadow-sm">
			<h5 style="color:#376dc8;">수강안내</h5>
			<hr>
			<ul class="mt-3">
				<li>2022학년도 동계계절수업 수강취소 신청: mySNU > 학사정보 > 수업/성적 > 수업 > 계절학기수강취소/환불 (수강신청사이트에서는 수강취소 불가)</li>
				<li>2023학년도 1학기 수강편람은 2023. 1. 3.(화) 09:00부터 조회 가능합니다.</li>
				<li>교과목 관련 문의: 교과목 개설대학 학과 사무실</li>
				<li class="mt-4">로그인 없이도 강의 검색이 가능합니다.</li>
				<li>'신입생'여부: 2023년 3월 입학자, 휴학으로 인해 한 학기(1학기/2학기)라도 성적이 없는 학생으로 이번 학기가 첫 학기인 학생입니다.</li>
				<li>2021학년도 동계계절수업에 수강중인 과목을 재수강하고자 할 경우, 수강신청 변경기간(3.2~3.8)에 신청해 주시기 바랍니다. 수강신청기간에 신청 시, 재수강 미인정 또는 임의 삭제처리될 수 있습니다.</li>
				<li class="mt-4">수강신청시 보안문자(표기된 숫자)를 입력해야만 수강신청이 가능합니다.</li>
				<li>수강신청 및 취소 후 반드시 개인 수강내역을 확인하시어 불이익이 발생하지 않도록 주의하시기 바랍니다.</li>
				<li>수강신청에 어려움이 있을 경우 반드시 소속 단과대학(학과)에 수강지도를 받으시기 바랍니다.</li>
			</ul>
		</div>	
		<div class="col-md-4  h-100">
			<div class="container border rounded mt-5 p-5 shadow-sm">
				<c:if test="${studentId == null}">
				<form action="${ctx}/student/studentLoginOk.jsp" method="post">
					<h5 style="color:#376dc8;">로그인</h5>
					<input class="form-control mt-3" type="text" name="studentId" placeholder="아이디를 입력하세요."/>
					<input class="form-control mt-2" type="text" name="studentPw" placeholder="비밀번호를 입력하세요."/>
					<button class="btn btn-primary w-100 mt-3">로그인</button>
				</form>
				<div class="text-center mt-3">
					<a href="${ctx}/student/findId.jsp" class="text-secondary">아이디 찾기</a>/
					<a href="${ctx}/student/findPw.jsp" class="text-secondary">비밀번호 찾기</a>
				</div>
				</c:if>
				<c:if test="${studentId != null}">
					<h5 class="text-center">${studentId}님 환영합니다.</h5>
					<a href="${ctx}/student/studentLogout.jsp" class="btn btn-danger w-100 mt-3">로그아웃</a>
				</c:if>
			</div>
			<div class="container border rounded mt-5 p-4 shadow-sm">
				<div class="d-flex justify-content-between">
					<h5 style="color:#376dc8;">공지사항</h5>
					<a href="${ctx}/student/noticeList.jsp" class="text-secondary">더보기></a>
				</div>
				<hr>
				<c:set var="cnt" value="0"/>
				<%
					NoticeDAO dao = new NoticeDAO();
					ArrayList<NoticeDTO> list = dao.noticeList();
					
					if(list == null || list.size() ==0){
						out.println("<tr><td colspan='12'>");
						out.println("등록된 공지사항이 없습니다!!");
						out.println("</tr>");
					}
					
					for(NoticeDTO dto : list){
				%>
				<c:if test="${cnt < 5}">
				<c:set var="cnt" value="${cnt+1}"/>
					<ul class="mt-3">
						<li><a href="${ctx}/student/noticeView.jsp?noticeNo=<%=dto.getNoticeNo()%>"><%=dto.getNoticeTitle()%></a></li>
					</ul>
				</c:if>
				<%} %>
			</div>
		</div>
	</div>
</main>
