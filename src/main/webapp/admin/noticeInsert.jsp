<%@page import="model.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<%@ include file="/inc/ad_header.jsp" %>	
</header>
    
<main>
	<div class="container border rounded mt-5 p-5 shadow-sm w-50 text-center">
		<h5 style="color:#376dc8;">공지사항 등록</h5>
		<hr>
		<form action="noticeInsertOk.jsp" method="post" id="joinForm">
		<table class="table text-center">
			<tr>
				<td class="col-md-2">제목</td>
				<td><input type="text" name="noticeTitle" class="form-control col-md-5"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="noticeWriter" class="form-control"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="noticeContents" class="form-control"></textarea></td>
			</tr>
		</table>
		<input type="button" class="btn btn-primary mt-3 w-25" style="height:45px;" onclick="classInsert()" value="공지사항등록">
		</form>
	</div>	
</main>

<script>
	function classInsert(){
		if(joinForm.noticeTitle.value == ''){
			alert("제목을 입력하세요!");
			joinForm.noticeTitle.focus();
			return;
			
		}else if(joinForm.noticeWriter.value == ''){
			alert("작성자명을 선택하세요!");
			joinForm.noticeWriter.focus();
			return;
			
		}else if(joinForm.noticeContents.value == ''){
			alert("내용을 입력하세요!");
			joinForm.noticeContents.focus();
			return;
			
		}else{
			joinForm.submit();
		}
	}
</script>
