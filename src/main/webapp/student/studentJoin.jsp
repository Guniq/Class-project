<%@page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	StudentDTO dto = new StudentDTO();
%>


<header>
	<%@ include file="/inc/header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">회원가입</h5>
		<hr>
		<form action="studentJoinOk.jsp" method="post" id="joinForm">
		<table class="table text-center">
			<tr>
				<td class="col-md-2">학번</td>
				<td><input type="text" name="studentNo" class="form-control col-md-5"/></td>
				<td><input type="button" class="btn btn-secondary col-md-5" onclick="numberChk()" value="학번확인"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="studentName" class="form-control"/></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="studentId" class="form-control"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="studentPw" class="form-control"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="studentEmail" class="form-control"/></td>
			</tr>
		</table>
		<input type="button" class="btn btn-primary mt-3 w-50" style="height:45px;" onclick="studentJoin()" value="회원가입">
		</form>
	</div>	
</main>

<script>
	function studentJoin(){
		if(joinForm.studentNo.value == ''){
			alert("학번을 입력하세요!");
			joinForm.studentNo.focus();
			return;
			
		}else if(joinForm.studentName.value == ''){
			alert("이름을 입력하세요!");
			joinForm.studentName.focus();
			return;
			
		}else if(joinForm.studentId.value == ''){
			alert("아이디를 입력하세요!");
			joinForm.studentId.focus();
			return;
			
		}else if(joinForm.studentPw.value == ''){
			alert("비밀번호를 입력하세요!");
			joinForm.studentPw.focus();
			return;
			
		}else if(joinForm.studentEmail.value == ''){
			alert("이메일을 입력하세요!");
			joinForm.studentEmail.focus();
			return;
			
		}else{
			joinForm.submit();
		}
	}
	
	function numberChk(){
		if(joinForm.studentNo.value == ''){
			alert("학번을 입력하세요!");
			joinForm.studentNo.focus();
			return;
			
		}else{
			window.location.href="numberCheck.jsp?studentNo="+joinForm.studentNo.value;
		}
	} 
</script>
