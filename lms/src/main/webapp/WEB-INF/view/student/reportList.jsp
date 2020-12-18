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
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>