<%@page import="model.CartDAO"%>
<%@page import="model.ClassDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="model.CartDTO"/>

<!-- 폼에서 전송된 모든 프로퍼티를 dto에 설정 -->
<jsp:setProperty name="dto" property="*" />

<%
	CartDAO dao = new CartDAO();
	int cartNo = Integer.parseInt(request.getParameter("cartNo"));
	int n = dao.cartDelete(cartNo);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
%>
	<script>
		alert("삭제 성공!");
		window.location.href="classCart.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패!");
		window.location.href="classCart.jsp";
	</script>
<%} %>
