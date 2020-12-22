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
			<td>account_id: <input type="text" name="accountId" readonly="readonly" value="${studentId}"></td>
		</tr>
		<tr>
			<td>report_submit_writer: <input type="text" name="reportSubmitWriter"></td>
		</tr>
		<tr>
			<td>report_submit_title: <input type="text" name="reportSubmitTitle"></td>
		</tr>
		<tr>
			<td>report_submit_content: <input type="text" name="reportSubmitContent"></td>
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
	$('#addBtn').click(function(){
		let html= '<div><input type="file" name="reportSubmitFile" class="reportSubmitFile"></div>';	
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	});

	$('#submitBtn').click(function(){
		let ck = true;
		$('.reportSubmitFile').each(function(index, item){
			if($(item).val()==''){
				ck = false;	
			}
		})
		if(ck == false){
			alert('파일을 선택해 주세요');
		}else{
			$('#reportSubmitAdd').submit();
		}
	});
</script>
</html>