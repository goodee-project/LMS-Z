<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${path}/student/questionAdd">
	<table border="1">
		<tr>
			<td>lecture_no
			
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${l.lectureNo}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>account_id: <input type="text" name="accountId" readonly="readonly" value="${studentId}"></td>
		</tr>
		<tr>
			<td>question_writer: <input type="text" name="questionWriter"></td>
		</tr>
		<tr>
			<td>question_title: <input type="text" name="questionTitle"></td>
		</tr>
		<tr>
			<td>question_content: <input type="text" name="questionContent"></td>
		</tr>
		<tr>
			<td>question_password: <input type="text" name="questionPassword"></td>
		</tr>
	</table>
	<button type="submit">등록완료</button>
</form>		
</body>
</html>