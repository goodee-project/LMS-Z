<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQuestionComment</title>
</head>
<body>
	<h1>댓글 수정</h1>
		<form method="post" action="${path}/teacher/modifyQuestionComment/${questionComment.questionCommentNo}">
			<table border="1">
				<tr>
					<th>question_comment_no</th>
					<td><input type="text" name="questionCommentNo" value="${questionComment.questionCommentNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>question_comment_writer</th>
					<td><input type="text" name="questionCommentWriter" value="${questionComment.questionCommentWriter}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>question_comment_content</th>
					<td><textarea rows="3" cols="50" name="questionCommentContent">${questionComment.questionCommentContent}</textarea></td>
				</tr>
				<tr>
					<th>question_comment_updatedate</th>
					<td><input type="text" name="questionCommentUpdatedate" value="${questionComment.questionCommentUpdatedate}" readonly="readonly"></td>
				</tr>
			</table>
			<button type="submit">수정하기</button>
		</form>
</body>
</html>