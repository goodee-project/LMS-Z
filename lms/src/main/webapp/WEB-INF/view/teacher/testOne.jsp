<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testOne</title>
</head>
<body>
	<h1>시험문제 / 답 보기</h1>
	
	<fieldset>
		<legend>시험문제</legend>
		<c:forEach var="m" items="${testOne}">
			<div>${m.multiplechoiceId}. ${m.multiplechoiceQuestion} (답 : ${m.multiplechoiceAnswer})</div>
			<c:forEach var="e" items="${m.multiplechoiceExampleList}">
				<div>(${e.multiplechoiceExampleId}) ${e.multiplechoiceExampleContent}</div>
			</c:forEach>
			<div></div>
		</c:forEach>
	</fieldset>
</body>
</html>