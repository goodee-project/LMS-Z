<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강좌별 공지사항 목록</h1>
	<a href="${path}/teacher/addLectureNotice/${lectureNo}">공지 등록</a>
	<table border="1">
		<thead>
			<tr>
				<th>lecture_notice_no</th>
				<th>lecture_notice_title</th>
				<th>lecture_notice_createdate</th>
				<th>lecture_notice_updatedate</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.lectureNoticeNo}</td>
					<td><a href="${path}/teacher/modifyLectureNoticeCount/${lectureNo}/${n.lectureNoticeNo}">${n.lectureNoticeTitle}</a></td>
					<td>${n.lectureNoticeCreatedate}</td>
					<td>${n.lectureNoticeUpdatedate}</td>
					<td>${n.lectureNoticeCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<div>
		<c:forEach var="i" begin="1" end="${lastPage}">
			<span>
				<a href="${path}/teacher/lectureNoticeList/${lectureNo}/${i}">${i}&nbsp;&nbsp;</a>
			</span>
		</c:forEach>
	</div>
</body>
</html>