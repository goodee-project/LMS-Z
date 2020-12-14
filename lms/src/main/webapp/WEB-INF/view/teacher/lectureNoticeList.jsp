<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강좌별 공지사항 목록</h1>
	<table border="1">
		<tr>
			<th>lecture_notice_no</th>
			<th>lecture_notice_title</th>
			<th>lecture_notice_createdate</th>
			<th>lecture_notice_updatedate</th>
		</tr>
		<c:forEach var="n" items="${noticeList}">
			<tr>
				<td>${n.lectureNoticeNo}</td>
				<td>${n.lectureNoticeTitle}</td>
				<td>${n.lectureNoticeCreatedate}</td>
				<td>${n.lectureNoticeUpdatedate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>