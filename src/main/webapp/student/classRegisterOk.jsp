<%@page import="model.CartDAO"%>
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
	int n = dao.cartInsert(dto);
	
	System.out.println("~~~~~~~~~~~~~~:"+n);
	if(n == 1){
%>
	<script>
		alert("수강신청 성공!");
		window.location.href="classCart.jsp";
	</script>
<%}else{ %>
	<script>
		alert("수강신청 실패!");
		window.location.href="classView.jsp?classNo="+classNo;
	</script>
<%} %>
