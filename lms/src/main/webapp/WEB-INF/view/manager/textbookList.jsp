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
	<a href="${path }/manager/insertTextbook">교재 등록</a>
	<table border="1">
		<thead>
			<tr>
				<td>textbook_isbn</td>
				<td>textbook_title</td>
				<td>textbook_writer</td>
				<td>textbook_publisher</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="t" items="${textbookList }">
				<tr>
					<td>${t.textbookIsbn }</td>
					<td><a href="${path }/manager/textbookOne/${t.textbookIsbn}">${t.textbookTitle }</a></td>
					<td>${t.textbookWriter }</td>
					<td>${t.textbookPublisher }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
   	<div>
    	<c:forEach var="i" begin="1" end="${lastPage }">
    		<span>
    			<a href="${path}/manager/textbookList/${i}">${i}&nbsp;&nbsp;</a>
    		</span>
    	</c:forEach>
   	</div>
</body>
</html>