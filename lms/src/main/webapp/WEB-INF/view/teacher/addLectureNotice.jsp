<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addLectureNotice</title>
</head>
<body>
	<h1>강좌별 공지사항 등록</h1>
	<form method="post" action="${path}/teacher/addLectureNotice/${lectureNo}">
		<div>
			강좌번호
			<input type="text" name="lectureNo" value="${lectureNo}">
		</div>
		<div>
			제목
			<input type="text" name="lectureNoticeTitle">
		</div>
		<div>
			내용
			<textarea rows="3" cols="50" name="lectureNoticeContent"></textarea>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>