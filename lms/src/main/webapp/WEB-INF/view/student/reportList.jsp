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
	<table border="1">
		<thead>
			<tr>
				<th>lectureNo</th>
				<th>reportTitle</th>
				<th>reportStartdate</th>
				<th>reportEnddate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${reportList}">
				<tr>
					<td>${r.lectureNo}</td>
					<td>${r.reportTitle}</td>
					<td>${r.reportStartdate}</td>
					<td>${r.reportEnddate}</td>
					<td><a href="${path}/student/reportSubmitAdd/${r.reportNo}">과제 제출</a></td>
					<td><a href="${path}/student/reportSubmitOne/${r.reportNo}/${studentId}">과제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>