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
	<h1>교재 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<td>textbook_isbn</td>
				<td>textbook_title</td>
				<td>textbook_writer</td>
				<td>textbook_publisher</td>
				<td>textbook_info</td>
				<td>textbook_price</td>
				<td>textbook_publishdate</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="t" items="${textbookList }">
				<tr>
					<td>${t.textbookIsbn }</td>
					<td>${t.textbookTitle }</td>
					<td>${t.textbookWriter }</td>
					<td>${t.textbookPublisher }</td>
					<td>${t.textbookInfo }</td>
					<td>${t.textbookPrice }</td>
					<td>${t.textbookPublishdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>