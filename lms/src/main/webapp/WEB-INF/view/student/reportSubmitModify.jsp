<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${path}/student/reportSubmitModify/${rs.reportSubmitNo}">
	<table border="1">
		<tr>
			<td>report_no: ${report.reportNo}</td>
			<td>report_title: ${report.reportTitle}</td>
			<td>report_content: ${report.reportContent}</td>
			<td>lecture_no: ${report.lectureNo}</td>
			<td>report_submit_no: ${ReportSubmit.getReportSubmitNo}</td>
		</tr>
	</table>
	
	<h1>과제 제출 내용</h1>
	<table border="1">
		<c:forEach var="rs" items="${report.reportSubmitList}">
			<tr>
				<td>account_id: ${rs.accountId}</td>
				<td>report_submit_content: <input type="text" name="reportSubmitContent" value="${rs.reportSubmitContent}"></td>
				<td>report_submit_writer: <input type="text" name="reportSubmitWriter" value="${rs.reportSubmitWriter}"></td>
				<td>report_submit_title: <input type="text" name="reportSubmitTitle" value="${rs.reportSubmitTitle}"></td>
				<td>report_submit_no: ${rs.reportSubmitNo}</td>
			</tr>
		</c:forEach>
	</table>
	<button type="submit">수정 완료</button>
</form>	
</body>
</html>