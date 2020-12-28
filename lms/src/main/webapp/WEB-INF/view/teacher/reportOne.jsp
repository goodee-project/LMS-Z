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
		
		<h3>과제제출</h3>
		<table border="1">
			<thead>
				<tr>
					<th>report_submit_no</th>
					<th>report_submit_writer</th>
					<th>report_submit_title</th>
					<th>report_submit_content</th>
					<th>report_submit_content</th>
				</tr>
			</thead>
			<c:forEach var="rs" items="${reportOne.reportSubmitList}">
				<tr>
					<td>${rs.reportSubmitNo}</td>
					<td>${rs.reportSubmitWriter}</td>
					<td>${rs.reportSubmitTitle}</td>
					<td>${rs.reportSubmitContent}</td>
					<td>${rs.reportSubmitPoint}점</td>
				</tr>
			</c:forEach>
		</table>
		<a href="${path}/teacher/reportList/${teacherId}">뒤로가기</a>
</body>
</html>