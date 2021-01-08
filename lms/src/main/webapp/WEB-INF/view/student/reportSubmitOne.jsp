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
	<div id="up"></div>
	<table border="1">
			<tr>
				<td>report_no: ${report.reportNo}</td>
				<td>report_title: ${report.reportTitle}</td>
				<td>report_content: ${report.reportContent}</td>
				<td>lecture_no: ${report.lectureNo} (${report.lecture.lectureName})</td>
				<c:if test="${report.dateCha>0}">	
					<td>제출기한: ${report.dateCha}</td>
				</c:if>
				<c:if test="${report.dateCha<0}">	
					<td>
						제출기한: 과제가 마감되었습니다.
					</td>
				</c:if>
			</tr>
	</table>
	
	<h1>과제 제출 내용</h1>
	<table border="1">
			<tr>
				<td>account_id: ${reportSubmit.accountId}</td>
				<td>report_submit_content: <input type="hidden" id="reportSubmitContent" value="${reportSubmit.reportSubmitContent}">${reportSubmit.reportSubmitContent}</td>
				<td>report_submit_point: ${reportSubmit.reportSubmitPoint}</td>
				<td>report_submit_feed_back: ${reportSubmit.reportSubmitFeedback}</td>
				<td>report_submit_writer: ${reportSubmit.reportSubmitWriter}</td>
				<td>report_submit_no : ${reportSubmit.reportSubmitNo }</td>
			</tr>
	</table>
	
	<h1>과제 제출 파일</h1>
	<table border="1">
		<c:forEach var="rsf" items="${reportSubmit.reportSubmitFile}">
			<tr>
				<td>report_submit_file_original: <a href="${path}/student/reportSubmitFileDownload/${rsf.reportSubmitFileUuid}">${rsf.reportSubmitFileOriginal}</a></td>
				<td>report_submit_file_type: ${rsf.reportSubmitFileType}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="reportDateCha" value="${report.dateCha}">
	<div id="add"></div>
</body>
<script>
	$('#reportSubmitContent').each(function(index, item){
		let htmlAdd='<div><a href="${path}/student/reportSubmitAdd/${report.reportNo}/${studentId}">과제 작성</a></div>'
		let htmlUpdate='<div><a href="${path}/student/reportSubmitModify/${reportSubmit.reportNo}/${studentId}">과제 수정</a></div>'
		let htmlDelete='<div><a href="${path}/student/reportSubmitAllRemove?reportSubmitNo=${reportSubmit.reportSubmitNo}">과제 삭제</a></div>'
		if($(item).val()=='' && $('#reportDateCha').val()>0){
			$('#add').append(htmlAdd);
		}
		if($(item).val()!='' && $('#reportDateCha').val()>0){
			$('#add').append(htmlUpdate);
			$('#add').append(htmlDelete);
		}
		});

	$('#reportDateCha').each(function(index, item){
		let htmlUp='<h1>마감된 과제는 작성및 수정/삭제 할 수 없습니다.</h1>'	
		if($(item).val()<=0){
			$('#up').append(htmlUp);
		}
	});
</script>
</html>