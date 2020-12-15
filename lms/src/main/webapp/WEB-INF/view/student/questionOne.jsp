<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>questionNo</td>
			<td>${question.questionNo }</td>
		</tr>
		<tr>
			<td>lectureNo</td>
			<td>${question.lectureNo }</td>
		</tr>
		<tr>
			<td>accountId</td>
			<td>${question.accountId }</td>
		</tr>
		<tr>
			<td>questionWriter</td>
			<td>${question.questionWriter }</td>
		</tr>
		<tr>
			<td>questionTitle</td>
			<td>${question.questionTitle }</td>
		</tr>
		<tr>
			<td>questionContent</td>
			<td>${question.questionContent }</td>
		</tr>
		<tr>
			<td>questionCreatedate</td>
			<td>${question.questionCreatedate }</td>
		</tr>
		<tr>
			<td>questionUdateDate</td>
			<td>${question.questionUpdatedate }</td>
		</tr>
	</table>
</body>
</html>