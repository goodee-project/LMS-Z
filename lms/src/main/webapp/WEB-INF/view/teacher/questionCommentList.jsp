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
	<h1>질문댓글게시판</h1>
		<table border="1">
			<thead>
				<tr>
					<th>question_comment_no</th>
					<th>question_comment_writer</th>
					<th>question_comment_content</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qc" items="${questionCommentList}">
					<tr>
						<td>${qc.questionCommentNo}</td>
						<td>${qc.questionCommentWriter}</td>
						<td>${qc.questionCommentContent}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>