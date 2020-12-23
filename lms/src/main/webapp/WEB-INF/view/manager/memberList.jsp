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
	<h1>memberList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>직책</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${memberList }">
				<tr>
					<td>${m.accountId }</td>
					<c:if test="${m.student.studentName !=null }">
					<td>${m.student.studentName }</td>
					</c:if>
					<c:if test="${m.teacher.teacherName !=null }">
					<td>${m.teacher.teacherName }</td>
					</c:if>
					<td>${m.accountLevel }</td>
					<td>${m.accountState }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>