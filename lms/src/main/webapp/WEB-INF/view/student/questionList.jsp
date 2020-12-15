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
	<a href="${pageContext.request.contextPath}/student/questionAdd">질문 등록하기</a>
	<table border="1">
		<thead>
			<tr>
				<th>questionNo</th>
			 	<th>lectureNo</th>
			 	<th>questionWriter</th>
			 	<th>questionTitle</th>
			 	<th>questionCreatedate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${questionList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/student/questionOne/${q.questionNo}">${q.questionNo}</a></td>
					<td>${q.lectureNo}</td>
					<td>${q.questionWriter}</td>
					<td>${q.questionTitle}</td>
					<td>${q.questionCreatedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${currentPage<lastPage }">
			<a href="${pageContext.request.contextPath}/student/questionList/${currentPage+1}">다음</a>
		</c:if>
			<c:if test="${currentPage>=lastPage }">
			<a href="${pageContext.request.contextPath}/student/questionList/${currentPage-1}">이전</a>
		</c:if>
	</div>
</body>
</html>