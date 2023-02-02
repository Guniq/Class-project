<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	.nav-link{
		color:white;
		width:120px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="container">
	    <a class="navbar-brand" href="${ctx}/admin/admin.jsp">관리자 페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse p-2" id="collapsibleNavbar">
	      <ul class="navbar-nav ms-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="${ctx}/student/index.jsp">HOME</a>
	        </li>
	        <c:if test="${adminId != null}">
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/admin/classList.jsp">강의리스트</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/admin/noticeList.jsp">공지사항</a>
		        </li>    
	        </c:if>
	        <c:if test="${adminId == null}">
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/admin/adminLogin.jsp">관리자 로그인</a>
		        </li>    
	        </c:if>
	        <c:if test="${adminId != null}">
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/admin/adminLogout.jsp">로그아웃</a>
		        </li>    
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
</body>
</html>