<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form method="post" id="questionAdd" action="${path}/student/questionAdd" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>lecture_no
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${l.lectureNo}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>account_id: <input type="text" name="accountId" readonly="readonly" value="${studentId}"></td>
		</tr>
		<tr>
			<td>question_writer: <input type="text" name="questionWriter"></td>
		</tr>
		<tr>
			<td>question_title: <input type="text" name="questionTitle"></td>
		</tr>
		<tr>
			<td>question_content: <input type="text" name="questionContent"></td>
		</tr>
		<tr>
			<td>question_password: <input type="text" name="questionPassword"></td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
			<td>question_file</td>
			<td>
				<div>
					<button type="button" id="addBtn">파일 추가</button>
					<button type="button" id="delBtn">파일 삭제</button>
				</div>
				<div id="fileinput"></div>
			</td>
		</tr>
	</table>
	<button type="button" id="submitBtn">등록완료</button>
</form>		
</body>
<script>
	$('#addBtn').click(function(){
		let html= '<div><input type="file" name="questionFile" class="questionFile"></div>';	
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	});

	$('#submitBtn').click(function(){
		let ck = true;
		$('.questionFile').each(function(index, item){
			if($(item).val()==''){
				ck = false;	
			}
		})
		if(ck == false){
			alert('파일을 선택해 주세요');
		}else{
			$('#questionAdd').submit();
		}
	});
</script>
</html>