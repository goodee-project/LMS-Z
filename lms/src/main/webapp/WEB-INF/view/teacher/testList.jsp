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
			<c:forEach var="t" items="${test}">
				<tr>
					<td>${t.testNo}</td>
					<td><a href="${path}/teacher/testOne/${t.lectureNo}">${t.testContent}</a></td>
					<td>${t.testStartdate}</td>
					<td>${t.testEnddate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>