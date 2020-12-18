<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportOne</title>
</head>
<body>
	<h1>과제 상세보기</h1>
		<table border="1">
				<tr>
					<th>report_no</th>
					<td>${reportOne.reportNo}</td>
				</tr>
				<tr>
					<th>lecture_no</th>
					<td>${reportOne.lectureNo}</td>
				</tr>
				<tr>
					<th>report_title</th>
					<td>${reportOne.reportTitle}</td>
				</tr>
				<tr>
					<th>report_content</th>
					<td>${reportOne.reportContent}</td>
				</tr>
				<tr>
					<th>report_startdate</th>
					<td>${reportOne.reportStartdate}</td>
				</tr>
				<tr>
					<th>report_enddate</th>
					<td>${reportOne.reportEnddate}</td>
				</tr>
		</table>
		<a href="${path}/teacher/modifyReport/${reportOne.reportNo}">수정하기</a>
</body>
</html>