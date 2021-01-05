<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>answerSheetByStudent</title>
</head>
<body>
	<h1>${name.studentName}학생 답안지 조회</h1>
	<div>
		<c:forEach var="a" items="${answerSheet}">
			<div>${a.multiplechoiceId}. ${a.multiplechoiceQuestion}</div>
			<div>답 : ${a.multiplechoiceAnswer}</div>
			<div>학생 제출 답안 : ${a.answerSelect}</div>
			<div>점수 : ${a.score}</div>
			&nbsp;
		</c:forEach>
	</div>
	<a href="${path}/teacher/studentListByTest/${lectureNo}">목록</a>
</body>
</html>