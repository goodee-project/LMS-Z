<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTest</title>
</head>
<body>
	<h1>시험정보(일정) 등록</h1>
	
	<form method="post" action="${path}/teacher/addTest/${lectureNo}">
		<input type="hidden" name="lectureNo" value="${lectureNo}">
		<table>
			<tr>
				<td>시험 시작시간</td>
				<td><input type="datetime-local" name="testStartdate"></td>
			</tr>
			<tr>
				<td>시험 종료시간</td>
				<td><input type="datetime-local" name="testEnddate"></td>
			</tr>
			<tr>
				<td>시험내용</td>
				<td><input type="text" name="testContent"></td>
			</tr>
		</table>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>