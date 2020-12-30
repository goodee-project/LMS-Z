<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testQuestionOne</title>
</head>
<body>
	<h1>시험문제 상세보기</h1>
	
	<div>
		<a href="${path}/teacher/testQuestionList/${testOne.lectureNo}">목록</a>
		<a href="${path}/teacher/modifyTestQuestion/${multiplechoiceNo}">수정</a>
		<a href="${path}/teacher/removeTestQuestion/${testOne.lectureNo}/${multiplechoiceNo}">삭제</a>
	</div>
	
	<h3>평가 ${testOne.multiplechoiceId}번</h3>
	<table>
		<tr>
			<td>문제 : </td>
			<td>${testOne.multiplechoiceQuestion}</td>
		</tr>
		<tr>
			<td>답 : </td>
			<td>${testOne.multiplechoiceAnswer}</td>
		</tr>
	</table>
	<div>
		<c:forEach var="me" items="${testOne.multiplechoiceExampleList}">
			<div>(${me.multiplechoiceExampleId}) ${me.multiplechoiceExampleContent}</div>
		</c:forEach>
	</div>
</body>
</html>