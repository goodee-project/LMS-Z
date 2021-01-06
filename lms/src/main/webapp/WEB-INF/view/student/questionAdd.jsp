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
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
</head>
<body>
<form method="post" id="questionAdd" action="${path}/student/questionAdd?studentId=${studentId}" enctype="multipart/form-data">
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
			<td>
				account_id: <input type="text" name="accountId" readonly="readonly" value="${studentId}">
				question_writer: <input type="text" name="questionWriter" readonly="readonly" value="${student.studentName}">
			</td>
		</tr>
		<tr>
			<td>question_title: <input type="text" name="questionTitle" id="questionTitle" style="width:460px"></td>
		</tr>
		<tr>
			<td>
				<div>question_content</div>
				<textarea class="form-control" name="questionContent" id="questionContent" rows="6"></textarea>
			</td>
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
	<a href="${path}/student/questionList/${studentId}/1">이전 페이지</a>
</body>
<script>
	$(document).ready(function() {
		// SmartEditor2 스크립트 추가
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'questionContent',
			sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		})
		$('#addBtn').click(function(){
			let html= '<div><input type="file" name="questionFile" class="questionFile"></div>';	
			$('#fileinput').append(html);
		});
	
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});
	
		$('#submitBtn').click(function(){
			let ck = true;
			oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$('.questionFile').each(function(index, item){
				if($(item).val()==''){
					ck = false;	
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
			}
			else if($('#questionTitle').val() ==""){
				alert('제목을 입력해주세요.');
				}
			else if($('#questionContent').val() == '<p>&nbsp;</p>' ||$('#questionContent').val() == ''){
				alert('내용을 입력해주세요.');
				}
			else{
				$('#questionAdd').submit();
			}
		})
	})
</script>
</html>