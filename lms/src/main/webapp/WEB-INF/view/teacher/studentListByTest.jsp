<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentListByTest</title>
</head>
<body>
	<h1>학생리스트</h1>
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>답안지 제출 여부</th>
				<th>답안지 조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.studentName}</td>
					<td>${s.studentGender}</td>
					<td>${s.submissionStatus}</td>
					<td>
						<c:if test="${s.submissionStatus == '제출'}">
							<a href="">조회(버튼으로 수정)</a>
						</c:if>
						<c:if test="${s.submissionStatus == '미제출'}">
							<a href="">조회불가(버튼으로 수정)</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>