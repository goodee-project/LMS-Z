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
	<h1>testList</h1>
	
	<div>
		<!-- 시험이 있을 경우 수정만 할 수 있음 -->
		<c:if test="${test != null}">
			<a href="${path}/teacher/modifyTest/${lectureNo}">시험 수정</a>
		</c:if>
		<!-- 시험이 없을 경우 추가만 할 수 있음 -->
		<c:if test="${test == null}">
			<a href="${path}/teacher/addTest/${lectureNo}">시험 추가</a>
		</c:if>
	</div>
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
					<td><a href="${path}/teacher/testOne/${test.lectureNo}">${test.testContent}</a></td>
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
</body>
</html>