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
<title>수강신청</title>
<style>
	.nav-link{
		color:#376dc8;;
		width:120px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-white navbar-white border">
	  <div class="container">
	    <a class="navbar-brand" href="${ctx}">수강신청</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse p-2" id="collapsibleNavbar">
	      <ul class="navbar-nav ms-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="${ctx}/student/classList.jsp">강의목록</a>
	        </li>
	        <c:if test="${studentId != null}">
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/student/classCart.jsp">수강신청내역</a>
		        </li>
	        </c:if>
	        <li class="nav-item">
	          <a class="nav-link" href="${ctx}/student/noticeList.jsp">공지사항</a>
	        </li>    
	        <c:if test="${studentId == null}">
		        <li class="nav-item">
		          <a class="nav-link" href="${ctx}/student/studentJoin.jsp">회원가입</a>
		        </li>    
		    </c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
</body>
</html>