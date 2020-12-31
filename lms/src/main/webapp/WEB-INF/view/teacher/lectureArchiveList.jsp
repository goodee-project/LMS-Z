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
	<a href="${path}/teacher/lectureArchiveAdd/${teacherId}">자료 추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>강의 번호</th>
				<th>과목 번호</th>
				<th>작성자 아이디</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="la" items="${lectureArchiveList}">
				<tr>	
					<td><a href="${path}/teacher/lectureArchiveOne/${la.lectureArchiveNo}">${la.lectureNo}: ${la.lecture.lectureName}</a></td>
					<td>${la.accountId}: ${la.lecture.teacherName}</td>
					<td>${la.subject.subjectNo}: ${la.subject.subjectName}</td>
					<td>${la.lectureArchiveWriter}</td>
					<td>${la.lectureArchiveTitle}</td>
					<td>${la.lectureArchiveCreatedate}</td>
					<td>${la.lectureArchiveUpdatedate}</td>
					<td>${la.lectureArchiveCount}</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
</body>
</html>