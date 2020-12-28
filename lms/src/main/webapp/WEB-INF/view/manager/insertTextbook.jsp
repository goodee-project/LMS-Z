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
	<h1>textbook 추가</h1>
	<form method="post" action="${path }/manager/insertTextbookAction">
		<table>
			<tr>
				<td>textbookIsbn :
					<input type="text" name="textbookIsbn">
				</td>
			</tr>
			<tr>
				<td> textbookTitle :
					<input type = "text" name="textbookTitle">
				</td>
			</tr>
			<tr>
				<td> textbookInfo :
					<input type = "text" name="textbookInfo">
				</td>
			</tr>
			<tr>
				<td> textbookPublisher :
					<input type = "text" name="textbookPublisher">
				</td>
			</tr>
			<tr>
				<td> textbookPrice :
					<input type = "text" name="textbookPrice">
				</td>
			</tr>
			<tr>
				<td> textbookWriter :
					<input type = "text" name="textbookWriter">
				</td>
			</tr>
		</table>
		<a href="${path }/manager/textbookList/1">돌아가기</a>
		<button type="submit">교재 등록</button>
	</form>
</body>
</html>