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
	<h1>testOne</h1>
	
	<a href="${path}/teacher/studentListByTest/${lectureNo}">학생 답안지 목록</a>
	<a href="${path}/teacher/testQuestionList/${lectureNo}">시험문제 목록</a>
</body>
</html>