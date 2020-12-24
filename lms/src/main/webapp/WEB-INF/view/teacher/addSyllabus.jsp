<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addSyllabus</title>
</head>
<body>
	<h1>강의계획서 추가</h1>
	<form method="post" action="${path}/teacher/addSyllabus">
		<table>
			<tr>
				<td>강의계획</td>
				<td><textarea rows="5" cols="50" name="syllabusContent"></textarea></td>
			</tr>
			<tr>
				<td>강사 사인</td>
				<td><input type="text" name="syllabusTeachersign"></td>
			</tr>
		</table>
		<div><button type="submit">등록</button></div>
	</form>
</body>
</html>