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
<form method="post" id="lectureArchiveAdd" action="${path}/teacher/lectureArchiveAdd?teacherId=${teacherId}" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>강의번호:
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${l.lectureNo}: ${l.lectureName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>	
		<tr>	
			<td>작성자 아이디: <input type="text" name="accountId" readonly="readonly" value="${teacherId}"></td>
		</tr>
		<tr>
			<td>작성자: <input type="text" name="lectureArchiveWriter"></td>
		</tr>
		<tr>	
			<td>제목: <input type="text" name="lectureArchiveTitle" id="lectureArchiveTitle"></td>
		</tr>
		<tr>	
			<td>내용: <textarea class="form-control" name="lectureArchiveContent" id="lectureArchiveContent" rows="6"></textarea></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>lectureArchivefile</td>
			<td>
				<div>
					<button type="button" id="addBtn">파일 추가</button>
					<button type="button" id="delBtn">파일 삭제</button>
				</div>
				<div id="fileinput"></div>
			</td>
		</tr>
	</table>
	<button type="button" id="submitBtn">작성완료</button>
</form>
</body>
<script>
		$(document).ready(function() {
			// SmartEditor2 스크립트 추가
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : 'lectureArchiveContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
		})
		$('#addBtn').click(function(){
			let html= '<div><input type="file" name="lectureArchiveFile" class="lectureArchiveFile"></div>';	
			$('#fileinput').append(html);
		});
	
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});
		$('#submitBtn').click(function(){
			let ck = true;
			oEditors.getById["lectureArchiveContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$('.lectureArchiveFile').each(function(index, item){
				if($(item).val()==''){
					ck = false;	
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
			}
			else if($('#lectureArchiveTitle').val() ==""){
				alert('제목을 입력해주세요.');
				}
			else if($('#lectureArchiveContent').val() == '<p>&nbsp;</p>' ||$('#lectureArchiveContent').val() == ''){
				alert('내용을 입력해주세요.');
				}
			else{
				$('#lectureArchiveAdd').submit();
			}
		})
	})
</script>
</html>