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
<form method="post" id="updateReportSubmit" action="${path}/student/reportSubmitModify/${reportSubmit.reportSubmitNo}">
	<table border="1">
			<tr>
				<td>report_no: ${report.reportNo}</td>
				<td>report_title: ${report.reportTitle}</td>
				<td>report_content: ${report.reportContent}</td>
				<td>lecture_no: ${report.lectureNo}</td>
			</tr>
	</table>
	
	<h1>과제 제출 내용</h1>
	<table border="1">
		
			<tr>
				<td>account_id: ${reportSubmit.accountId}</td>
				<td>report_submit_content: <input type="text" name="reportSubmitContent" value="${reportSubmit.reportSubmitContent}"></td>
				<td>report_submit_writer: <input type="text" name="reportSubmitWriter" value="${reportSubmit.reportSubmitWriter}"></td>
				<td>report_submit_title: <input type="text" name="reportSubmitTitle" value="${reportSubmit.reportSubmitTitle}"></td>
				<td>report_submit_no: ${reportSubmit.reportSubmitNo}</td>
			</tr>
	</table>
	
	<table border="1">
		<tr>
			<td>question_file</td>
			<td>
				<c:forEach var="rsf" items="${reportSubmit.reportSubmitFile}">
					<div>
						<span id="${rsf.reportSubmitFileOriginal}">${rsf.reportSubmitFileOriginal}</span>
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
	$('#addBtn').click(function(){
		let html='<div><input type="file" name="reportSubmitFile" class="reportSubmitFile"></div>';
		$('#fileinput').append(html);
		});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
		});

	$('#submitBtn').click(function(){
		let ck=true;
		$('.reportSubmitFile').each(function(index, item){
			if($(item).val()==''){
				ck=false;
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
				}else{
					$('#updateReportSubmit').submit();
				}
		});
</script>
</html>