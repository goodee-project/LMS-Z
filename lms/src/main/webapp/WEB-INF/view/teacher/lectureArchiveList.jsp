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

	<div>
		<c:if test="${listCurrentPage>1}">
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/1">처음으로</a>
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
			<c:if test="${i<=lastPage}">
				<a href="${path}/teacher/lectureArchiveList/${teacherId}/${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${listCurrentPage<lastPage}">
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage+1}">다음</a>
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${lastPage}">마지막으로</a>
		</c:if>
	</div>
</body>
</html>