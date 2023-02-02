<%@page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<%@ include file="/inc/ad_header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">강의 등록</h5>
		<hr>
		<form action="classInsertOk.jsp" method="post" id="joinForm">
		<table class="table text-center">
			<tr>
				<td class="col-md-2">강의명</td>
				<td><input type="text" name="className" class="form-control col-md-5"/></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select class="form-select" name="classCategory">
					    <option>선택</option>
					    <option>교양</option>
					    <option>전공</option>
				  	</select>
			  	</td>
			</tr>
			<tr>
				<td>학과</td>
				<td><input type="text" name="classMajor" class="form-control"/></td>
			</tr>
			<tr>
				<td>교수명</td>
				<td><input type="text" name="classTeacher" class="form-control"/></td>
			</tr>
			<tr>
				<td>정원</td>
				<td><input type="text" name="classPeople" class="form-control"/></td>
			</tr>
			<tr>
				<td>수강날짜</td>
				<td><input type="text" name="classDate" class="form-control" placeholder="예) 화(12:30~13:45)"/></td>
			</tr>
		</table>
		<input type="button" class="btn btn-primary mt-3 w-25" style="height:45px;" onclick="classInsert()" value="강의 등록">
		</form>
	</div>	
</main>

<script>
	function classInsert(){
		if(joinForm.className.value == ''){
			alert("강의명을 입력하세요!");
			joinForm.className.focus();
			return;
			
		}else if(joinForm.classCategory.value == '선택'){
			alert("카테고리를 선택하세요!");
			joinForm.classCategory.focus();
			return;
			
		}else if(joinForm.classMajor.value == ''){
			alert("학과를 입력하세요!");
			joinForm.classMajor.focus();
			return;
			
		}else if(joinForm.classTeacher.value == ''){
			alert("교수명을 입력하세요!");
			joinForm.classTeacher.focus();
			return;
			
		}else if(joinForm.classDate.value == ''){
			alert("수강일을 입력하세요!");
			joinForm.classDate.focus();
			return;
			
		}else{
			joinForm.submit();
		}
	}
</script>
