<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addReport</title>
</head>
<body>
	<h1>과제등록</h1>
		<form method="post" action="${path}/teacher/addReport/${teacherId}">
			<table>
				<tr>
					<th>report_no</th>
					<td><input type="text" name="reportNo"></td>
				</tr>
				<tr>
					<th>lecture_no</th>
					<td><input type="text" name="lectureNo"></td>
				</tr>
				<tr>
					<th>report_title</th>
					<td><input type="text" name="reportTitle"></td>
				</tr>
				<tr>
					<th>report_content</th>
					<td><textarea rows="3" cols="50" name="reportContent"></textarea></td>
				</tr>
				<!-- 과제 시작일 -->
				<tr>
					<th>report_startdate</th>
					<td><input type="datetime-local" name="reportStartdate"></td>
				</tr>
				<!-- 과제 마감일 -->
				<tr>
					<th>report_enddate</th>
					<td><input type="datetime-local" name="reportEnddate"></td>
				</tr>
			</table>
			<button type="submit">과제등록</button>
		</form>
		<a href="${path}/teacher/reportList/${teacherId}">뒤로가기</a>
</body>
</html>