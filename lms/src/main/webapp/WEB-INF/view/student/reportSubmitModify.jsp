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
<form method="post" id="updateReportSubmit" action="${path}/student/reportSubmitModify?reportSubmitNo=${reportSubmit.reportSubmitNo}" enctype="multipart/form-data">
	<table border="1">
			<tr>
				<td>report_no: ${report.reportNo}</td>
				<td>report_title: ${report.reportTitle}</td>
				<td>report_content: ${report.reportContent}</td>
				<td>lecture_no: ${report.lectureNo} (${report.lecture.lectureName})</td>
			</tr>
	</table>
	
	<h1>과제 제출 내용</h1>
	<table border="1">
		
			<tr>
				<td>account_id: ${reportSubmit.accountId}</td>
			</tr>
			<tr>	
				<td>report_submit_content: 
					<textarea class="form-control" name="reportSubmitContent" id="reportSubmitContent">${reportSubmit.reportSubmitContent}</textarea>
				</td>
			</tr>
			<tr>	
				<td>report_submit_writer: <input type="text" name="reportSubmitWriter" value="${reportSubmit.reportSubmitWriter}"></td>
			</tr>
			<tr>	
				<td>report_submit_title: <input type="text" name="reportSubmitTitle" id="reportSubmitTitle" value="${reportSubmit.reportSubmitTitle}"></td>
			</tr>
			<tr>	
				<td>report_submit_no: ${reportSubmit.reportSubmitNo}</td>
			</tr>
			
	</table>
	
	<table border="1">
		<tr>
			<td>question_file</td>
			<td>
				<c:forEach var="rsf" items="${reportSubmit.reportSubmitFile}">
					<div>
						<span id="${rsf.reportSubmitFileOriginal}">${rsf.reportSubmitFileOriginal}
							<a href="${path}/student/reportSubmitOneFileRemove/${rsf.reportSubmitFileUuid}">삭제</a>
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
		let html='<div><input type="file" name="reportSubmitFile" class="reportSubmitFile"></div>';
		$('#fileinput').append(html);
		})

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
		})

	$('#submitBtn').click(function(){
		var str_space = /\s/;
		let ck=true;
		oEditors.getById["reportSubmitContent"].exec("UPDATE_CONTENTS_FIELD", []);
		$('.reportSubmitFile').each(function(index, item){
			if($(item).val()==''){
				ck=false;
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
				}
			else if(str_space.exec($('#reportSubmitContent'))){
				alert('내용을 입력해 주세요');
				}
			else{
					$('#updateReportSubmit').submit();
				}
		})
	})	
</script>
</html>