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
<form method="post" action="${path}/student/questionModify?questionNo=${question.questionNo}">
	<table board="1">
		<tr>
			<td>질문 번호: ${question.questionNo},</td>
			<td>작성자 ID: ${question.accountId},</td>
			<td>작성일: ${question.questionCreatedate}</td>
		</tr>
	</table>	
		
	<table board="1">
		<tr>
			<td>lecture_no
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${question.lectureNo}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>question_writer: <input type="text" name="questionWriter" value="${question.questionWriter}"></td>
		</tr>
		<tr>
			<td>question_title: <input type="text" name="questionTitle" value="${question.questionTitle}"></td>
		</tr>
		<tr>
			<td>question_content: <input type="text" name="questionContent" value="${question.questionContent}"></td>
		</tr>
		<tr>
			<td>question_password: <input type="text" name="questionPassword" value="${question.questionPassword}"></td>
		</tr>
	</table>
	<button type="submit">수정 완료</button>
</form>	
</body>
</html>