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
	<h1>교재 상세보기</h1>
	<table border="1">
		<tr>
			<td>textbook_isbn :</td>
			<td>${textbookOne.textbookIsbn }</td>
		</tr>
		<tr>
			<td>textbook_title :</td>
			<td>${textbookOne.textbookTitle }</td>
		</tr>
		<tr>
			<td>textbook_writer :</td>
			<td>${textbookOne.textbookWriter }</td>
		</tr>
		<tr>
			<td>textbook_publisher :</td>
			<td>${textbookOne.textbookPublisher }</td>
		</tr>
		<tr>
			<td>textbook_info :</td>
			<td>${textbookOne.textbookInfo }</td>
		</tr>
		<tr>
			<td>textbook_price :</td>
			<td>${textbookOne.textbookPrice }</td>
		</tr>
		<tr>
			<td>textbook_publishdate :</td>
			<td>${textbookOne.textbookPublishdate }</td>
		</tr>
	</table>
</body>
</html>