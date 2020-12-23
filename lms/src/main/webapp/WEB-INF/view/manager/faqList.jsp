<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>
	<h1>FAQ</h1>
	<div>
		${c.faqCategory }
		<c:forEach var="c" items="${categoryList }">
			<span>${c.faqCategory }</span>
			&emsp;
		</c:forEach>
	</div>
	<br>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>NO</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="f" items="${faqList }">
					<div>${f.faqWriter}</div>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

	<br>

</body>
</html>