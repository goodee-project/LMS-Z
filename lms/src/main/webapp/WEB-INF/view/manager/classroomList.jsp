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
	<h1>classroomList</h1>
	<a href="${path }/manager/insertClassroom">강의실 추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>classroom_no</th>
				<th>classroom_number</th>
				<th>classroom_size</th>
				<th>classroom_total</th>
				<th>classroom_state</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${classroomList }">
				<tr>
					<td>${c.classroomNo }</td>
					<td>${c.classroomNumber }</td>
					<td>${c.classroomSize }</td>
					<td>${c.classroomTotal }</td>
					<td>${c.classroomState }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>