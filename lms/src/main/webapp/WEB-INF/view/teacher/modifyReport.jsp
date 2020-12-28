<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyReport</title>
</head>
<body>
	<h1>과제수정</h1>
		<form method="post" action="${path}/teacher/modifyReport/${reportOne.reportNo}">
			<table>
				<tr>
					<th>report_no</th>
					<td><input type="text" name="reportNo" value="${reportOne.reportNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>lecture_no</th>
					<td><input type="text" name="lectureNo" value="${reportOne.lectureNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>report_title</th>
					<td><input type="text" name="reportTitle" value="${reportOne.reportTitle}"></td>
				</tr>
				<tr>
					<th>report_content</th>
					<td><textarea rows="3" cols="50" name="reportContent">${reportOne.reportContent}</textarea></td>
				</tr>
				<tr>
					<th>report_startdate</th>
					<td><input type="datetime-local" name="reportStartdate" value="${reportOne.reportStartdate}"></td>
				</tr>
				<tr>
					<th>report_enddate</th>
					<td><input type="datetime-local" name="reportEnddate" value="${reportOne.reportEnddate}"></td>
				</tr>
			</table>
			<button type="submit">수정하기</button>
		</form>
		<a href="${path}/teacher/reportOne/${reportOne.reportNo}">뒤로가기</a>
</body>
</html>