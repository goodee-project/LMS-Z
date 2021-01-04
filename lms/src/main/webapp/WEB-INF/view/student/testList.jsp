<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testList</title>
</head>
<body>
	<h1>시험목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>시험번호</th>
				<th>시험내용</th>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${test != null}">
				<tr>
					<td>${test.testNo}</td>
					<td><a href="${path}/student/testQuestionList/${test.lectureNo}/${studentId }/1">${test.testContent}</a></td>
					<td>${test.testStartdate}</td>
					<td>${test.testEnddate}</td>
				</tr>
			</c:if>
			<c:if test="${test == null}">
				<tr>
					<td colspan="4">시험이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<a href="${path }/student/myLectureListOne/${studentId }/${lectureNo }/${currentPage}">뒤로가기</a>
</body>
</html>