<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form method="post" id="reportSubmitAdd" action="${path}/student/reportSubmitAdd" enctype="multipart/form-data">
	<table border="1">
		<thead>
			<tr>
				<th>lecture_no</th>
				<th>report_title</th>
				<th>report_content</th>
				<th>report_startdate</th>
				<th>report_enddate</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${report.lectureNo} (${report.lecture.lectureName})</td>
				<td>${report.reportTitle}</td>
				<td>${report.reportContent}</td>
				<td>${report.reportStartdate}</td>
				<td>${report.reportEnddate}</td>
			</tr>
		</tbody>
	</table>
	
	<table border="1">
		<tr>
			<td>report_no: <input type="text" name="reportNo" readonly="readonly" value="${report.reportNo}"></td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="accountId" value="${studentId}">
			
				작성자: <input type="text" readonly="readonly" name="reportSubmitWriter" value="${student.studentName}">
			</td>
		</tr>
		<tr>
			<td>report_submit_title: <input type="text" name="reportSubmitTitle" id="reportSubmitTitle" style="width:420px"></td>
		</tr>
		<tr>
			<td>
				<div>report_submit_content</div>
				<textarea class="form-control" name="reportSubmitContent" id="reportSubmitContent"></textarea>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>report_submit_file</td>
			<td>
				<div>
					<button type="button" id="addBtn">파일 추가</button>
					<button type="button" id="delBtn">파일 삭제</button>
				</div>
				<div id="fileinput"></div>
			</td>
		</tr>
	</table>
	<button type="button" id="submitBtn">과제 제출</button>
</form>	
</body>
<script>
	$(document).ready(function() {
		// SmartEditor2 스크립트 추가
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'reportSubmitContent',
			sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		})
		$('#addBtn').click(function(){
			let html= '<div><input type="file" name="reportSubmitFile" class="reportSubmitFile"></div>';	
			$('#fileinput').append(html);
		});
	
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});
	
		$('#submitBtn').click(function(){
			var blank_patten = /\s|　/gi;
			var reportSubmitContent = $('#reportSubmitContent').val();
			let ck = true;
			oEditors.getById["reportSubmitContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$('.reportSubmitFile').each(function(index, item){
				if($(item).val()==''){
					ck = false;	
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
			}
			else if($('#reportSubmitTitle').val().replace(blank_patten,"")==""){
				alert('제목을 입력해 주세요');
				}
			else if($('#reportSubmitContent').val() == '<p>&nbsp;</p>' ||$('#reportSubmitContent').val() == ''){
				alert('내용을 입력해 주세요');
				}
			else{
				$('#reportSubmitAdd').submit();
			}
		})
	})
</script>
</html>