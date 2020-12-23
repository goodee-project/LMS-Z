<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question</title>
</head>
<body>
	<h1>질문게시판</h1>
		<table border="1">
			<thead>
				<tr>
					<th>question_no</th>
					<th>question_writer</th>
					<th>question_title</th>
					<th>question_count</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="q" items="${questionList}">
					<tr>
						<td>${q.questionNo}</td>
						<td>${q.questionWriter}</td>
						<td><a href="${path}/teacher/modifyQuestionOneCount/${teacherId}/${q.questionNo}/${currentPage}">${q.questionTitle}</a></td>
						<td>${q.questionCount}</td>
					</tr>
				</c:forEach>
				<!-- 숫자로 페이징 -->
				<c:forEach var="i" begin="1" end="${lastPage}">
					<span>
                		<a href="${path}/teacher/questionList/${teacherId}/${i}">${i}&nbsp;&nbsp;</a>
                	</span>
                </c:forEach>
			</tbody>
		</table>
</body>
</html>