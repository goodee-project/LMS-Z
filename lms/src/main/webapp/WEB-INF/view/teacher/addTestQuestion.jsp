<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTestQuestion</title>
</head>
<body>
	<h1>새 문제 등록</h1>
	
	<form action="${path}/teacher/addTestQuestion/${lectureNo}">
		<input type="hidden" name="lectureNo" value="${lectureNo}">
		<table>
			<tr>
				<td>문제 번호</td>
				<td><input type="text" name="multiplechoiceId"></td>
			</tr>
			<tr>
				<td>문제 내용</td>
				<td><textarea rows="5" cols="50" name="multiplechoiceQuestion"></textarea></td>
			</tr>
			<tr>
				<td>정답</td>
				<td><input type="text" name="multiplechoiceAnswer"></td>
			</tr>
		</table>
		<c:forEach var="i" begin="1" end="5">
			<div>보기 번호 : <input type="text" name="multiplechoiceExampleId" value="${i}"></div>
			<div>보기 문항 : <input type="text" name="multiplechoiceExampleContent"></div>
			&nbsp;
		</c:forEach>	
		<button type="submit">등록</button>
	</form>
</body>
</html>