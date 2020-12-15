<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyLectureNotice</title>
</head>
<body>
	<h1>강좌별 공지사항 수정</h1>
	<form method="post" action="${path}/teacher/modifyLectureNotice/${lectureNo}/${lectureNoticeNo}">
		<table>
			<tr>
				<td>공지번호</td>
				<td><input type="text" name="lectureNoticeNo" value="${lectureNoticeNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="lectureNoticeTitle" value="${noticeOne.lectureNoticeTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="3" cols="50" name="lectureNoticeContent">${noticeOne.lectureNoticeContent}</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>