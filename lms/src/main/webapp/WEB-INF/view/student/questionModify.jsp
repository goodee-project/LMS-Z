<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form method="post" id="updateQuesitonForm" enctype="multipart/form-data" action="${path}/student/questionModify?questionNo=${question.questionNo}">
	<table border="1">
		<tr>
			<td>질문 번호: ${question.questionNo},</td>
			<td>작성자 ID: ${question.accountId},</td>
			<td>작성일: ${question.questionCreatedate}</td>
		</tr>
	</table>	
		
	<table border="1">
		<tr>
			<td>lecture_no
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${l.lectureNo}: ${l.lectureName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>question_writer: <input type="text" name="questionWriter" value="${question.questionWriter}"></td>
		</tr>
		<tr>
			<td>question_title: <input type="text" name="questionTitle" value="${question.questionTitle}"></td>
		</tr>
		<tr>
			<td>question_content: <input type="text" name="questionContent" value="${question.questionContent}"></td>
		</tr>
		<tr>
			<td>question_password: <input type="text" name="questionPassword" value="${question.questionPassword}"></td>
		</tr>
		<tr>
			<td>question_file</td>
			<td>
				<c:forEach var="qf" items="${question.questionfile}">
					<div>
						<span id="${qf.questionFileOriginal}">${qf.questionFileOriginal}</span>
						<span>
							<a href="${path}/student/questionFileRemove?questionFileUuid=${qf.questionFileUuid}&questionNo=${question.questionNo}">삭제</a>
						</span>
					</div>
				</c:forEach>
				<div id="fileinput"></div>
			</td>
		
			<td>
				<div>
					<button type="button" id="addBtn">파일추가</button>
					<button type="button" id="delBtn">파일삭제</button>
				</div>
			</td>
		</tr>
	</table>
	<button type="button" id="submitBtn">수정 완료</button>
</form>	
	<a href="${path}/student/questionOne/${question.questionNo}">이전 페이지</a>
</body>
<script>
	$('#addBtn').click(function(){
		let html='<div><input type="file" name="questionFile" class="questionFile"></div>';
		$('#fileinput').append(html);
		});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
		});

	$('#submitBtn').click(function(){
		let ck=true;
		$('.questionFile').each(function(index, item){
			if($(item).val()==''){
				ck=false;
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
				}else{
					$('#updateQuesitonForm').submit();
				}
		});
</script>
</html>
