<%@page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<%@ include file="/inc/ad_header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-25 text-center">
		<h5 style="color:#376dc8;">관리자 로그인</h5>
		<hr>
		<form action="adminLoginOk.jsp" method="post" id="joinForm">
		<table class="table text-center">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="adminId" class="form-control"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="adminPw" class="form-control"/></td>
			</tr>
		</table>
		<input type="button" class="btn btn-dark mt-3 w-50" style="height:45px;" onclick="adminLogin()" value="로그인">
		</form>
	</div>	
</main>

<script>
	function adminLogin(){
		if(joinForm.adminId.value == ''){
			alert("아이디를 입력하세요!");
			joinForm.adminId.focus();
			return;
			
		}else if(joinForm.adminPw.value == ''){
			alert("비밀번호 입력하세요!");
			joinForm.adminPw.focus();
			return;
			
		}else{
			joinForm.submit();
		}
	}
</script>
