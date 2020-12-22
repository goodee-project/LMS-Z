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
	<a href="${path}/student/questionAdd">질문 등록하기</a>
	<table border="1">
		<thead>
			<tr>
				<th>questionNo</th>
			 	<th>lectureNo</th>
			 	<th>questionWriter</th>
			 	<th>questionTitle</th>
			 	<th>questionCount</th>
			 	<th>questionCreatedate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${questionList}">
				<tr>
					<td><a href="${path}/student/questionOne/${q.questionNo}">${q.questionNo}</a></td>	
					<td>${q.lectureNo}: (${q.lecture.lectureName})</td>
					<td>${q.questionWriter}</td>
					<td>${q.questionTitle}</td>
					<td>${q.questionCount }</td>
					<td>${q.questionCreatedate}</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div>
		<c:forEach var="i" begin="1" end="${lastPage}">
			<span>
				<a href="${path}/student/questionList/${i}">${i}</a>
			</span>
		</c:forEach>
	</div>
</body>
</html>