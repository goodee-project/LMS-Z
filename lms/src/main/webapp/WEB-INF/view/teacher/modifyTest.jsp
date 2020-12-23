<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTest</title>
</head>
<body>
	<h1>시험정보(일정) 수정</h1>
	
	<form method="post" action="${path}/teacher/modifyTest/${lectureNo}">
		<input type="hidden" name="lectureNo" value="${lectureNo}">
		<table>
			<tr>
				<td>시험내용</td>
				<td><input type="text" name="testContent" value="${test.testContent}"></td>
			</tr>
			<tr>
				<td>시험시작시간</td>
				<td><input type="datetime" name="testStartdate" value="${test.testStartdate}"></td>
			</tr>
			<tr>
				<td>시험종료시간</td>
				<td><input type="datetime" name="testEnddate" value="${test.testEnddate}"></td>
			</tr>
		</table>
		<div><button type="submit">수정</button></div>
	</form>
</body>
</html>