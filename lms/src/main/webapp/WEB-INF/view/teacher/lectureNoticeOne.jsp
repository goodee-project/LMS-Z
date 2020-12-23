<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureNoticeOne</title>
</head>
<body>
	<h1>공지 상세보기</h1>
	<div>조회수 : ${noticeOne.lectureNoticeCount}</div>
	<table border="1">
		<tr>
			<td>공지번호</td>
			<td>${lectureNoticeNo}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${noticeOne.lectureNoticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${noticeOne.lectureNoticeContent}</td>
		</tr>
		<tr>
			<td>등록날짜</td>
			<td>${noticeOne.lectureNoticeCreatedate}</td>
		</tr>
		<tr>
			<td>수정날짜</td>
			<td>${noticeOne.lectureNoticeUpdatedate}</td>
		</tr>
	</table>
	<a href="${path}/teacher/lectureNoticeList/${lectureNo}/1">목록</a>
	<a href="${path}/teacher/modifyLectureNotice/${lectureNo}/${lectureNoticeNo}">수정</a>
	<a href="${path}/teacher/removeLectureNotice/${lectureNo}/${lectureNoticeNo}">삭제</a>
</body>
</html>