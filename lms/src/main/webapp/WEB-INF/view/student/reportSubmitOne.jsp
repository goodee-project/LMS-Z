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
		<c:forEach var="rs" items="${report.reportSubmitList}">
			<tr>
				<td>account_id: ${rs.accountId}</td>
				<td>report_submit_content: <input type="text" id="reportSubmitContent" readonly="readonly" value="${rs.reportSubmitContent}"></td>
				<td>report_submit_point: ${rs.reportSubmitPoint}</td>
				<td>report_submit_feed_back: ${rs.reportSubmitFeedback}</td>
				<td>report_submit_writer: ${rs.reportSubmitWriter}</td>
				<td>report_submit_no : ${rs.reportSubmitNo }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>과제 제출 파일</h1>
	<table border="1">
		<c:forEach var="rsf" items="${report.reportSubmitFileList}">
			<tr>
				<td>report_submit_file_original: ${rsf.reportSubmitFileOriginal}</td>
				<td>report_submit_file_type: ${rsf.reportSubmitFileType}</td>
			</tr>
		</c:forEach>
	</table>
	<div id="add"></div>
</body>
<script>
	$('#reportSubmitContent').each(function(index, item){
		let htmlAdd='<div><a href="${path}/student/reportSubmitAdd/${report.reportNo}">과제 작성</a></div>'
		let htmlUpdate='<div><a href="${path}/student/reportSubmitModify/${report.reportNo}/${studentId}">과제 수정</a></div>'

		if($(item).val()==''){
			$('#add').append(htmlAdd);
		}
		if($(item).val()!=''){
			$('#add').append(htmlUpdate);
		}
		});
</script>
</html>