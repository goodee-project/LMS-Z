<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureNoticeOne</title>
</head>
<body>
	<h1>공지 상세보기</h1>
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
</body>
</html>