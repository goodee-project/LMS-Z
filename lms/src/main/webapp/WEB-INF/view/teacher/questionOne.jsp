<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionOne</title>
</head>
<body>
	<h1>질문 상세보기</h1>
		<table border="1">
			<tr>
				<th>question_no</th>
				<td>${question.questionNo}</td>
			</tr>
			<tr>
				<th>question_writer</th>
				<td>${question.questionWriter}</td>
			</tr>
			<tr>
				<th>question_title</th>
				<td>${question.questionTitle}</td>
			</tr>
			<tr>
				<th>question_content</th>
				<td>${question.questionContent}</td>
			</tr>
		</table>
		<h3>질문게시판 첨부파일</h3>
		<table border="1">
			<c:forEach var="qf" items="${question.questionfile}">
				<tr>
					<th>question_file</th>
					<td><a href="${path}/uploadfile/questionfile/questionfile${qf.questionFileUuid}">${qf.questionFileOriginal}</a></td>
				</tr>
			</c:forEach>	
		</table>
		
		
		<h3>질문댓글게시판</h3>
		<table border="1">
			<thead>
				<tr>
					<th>question_comment_no</th>
					<th>question_comment_writer</th>
					<th>question_comment_content</th>
					<th>question_comment_createdate</th>
					<th>question_comment_updatedate</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qc" items="${question.questionCommentList}">
					<tr>
						<td>${qc.questionCommentNo}</td>
						<td>${qc.questionCommentWriter}</td>
						<td>${qc.questionCommentContent}</td>
						<td>${qc.questionCommentCreatedate}</td>
						<td>${qc.questionCommentUpdatedate}</td>
						<td><a href="${path}/teacher/removeQuestionComment/${qc.accountId}/${qc.questionNo}/${qc.questionCommentNo}">삭제</a></td>
						<td><a href="${path}/teacher/modifyQuestionComment/${qc.questionCommentNo}/${currentPage}">수정</a></td>
					</tr>
				</c:forEach>
				<!-- 숫자로 페이징 -->
				<c:forEach var="i" begin="1" end="${lastPage}">
					<span>
                		<a href="${path}/teacher/questionOne/${questionNo}/${i}">${i}&nbsp;&nbsp;</a>
                	</span>
                </c:forEach>
			</tbody>
		</table>
		<!-- 댓글 추가 -->
		<form method="post" action="${path}/teacher/addQuestionComment">
			<input type="hidden" name="questionNo" value="${question.questionNo}">
			<input type="hidden" name="accountId" value="${question.accountId}">
			작성자<br><input type="text" name="questionCommentWriter"><br>
			댓글<br><textarea name="questionCommentContent" rows="3" cols="50"></textarea>
			<button type="submit">댓글입력</button>
		</form>
</body>
</html>