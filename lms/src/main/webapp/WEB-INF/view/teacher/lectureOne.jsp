<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lectureOne</title>
</head>
<body>
	<h1>강의 상세페이지</h1>
	
	<a href="${path}/teacher/lectureNoticeList/${lectureNo}/1">강의 공지사항</a>
	<a href="${path}/teacher/lectureSyllabus/${lectureNo}">강의계획서</a>
	<a href="${path}/teacher/attendanceMonth/${lectureNo}/-1/-1/${lectureStartdate}/${lectureEnddate}">출석부</a>
	<a href="${path}/teacher/testList/${lectureNo}">시험목록</a>
	<a href="${path}/teacher/studentList/${teacherId}/${lectureNo}">메세지</a>
</body>
</html>