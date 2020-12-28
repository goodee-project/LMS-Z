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
	<h1>교재 수정</h1>
	<form method="post" action="${path }/manager/modifyTextbookOneAction">
		<table border="1">
			<tr>
				<td>textbook_isbn :</td>
				<td><input type="text" name="textbookIsbn" value="${textbookOne.textbookIsbn }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>textbook_title :</td>
				<td><input type="text" name="textbookTitle" value="${textbookOne.textbookTitle }"></td>
			</tr>
			<tr>
				<td>textbook_writer :</td>
				<td><input type="text" name="textbookWriter" value="${textbookOne.textbookWriter }"></td>
			</tr>
			<tr>
				<td>textbook_publisher :</td>
				<td><input type="text" name="textbookPublisher" value="${textbookOne.textbookPublisher }"></td>
			</tr>
			<tr>
				<td>textbook_info :</td>
				<td><input type="text" name="textbookInfo" value="${textbookOne.textbookInfo }"></td>
			</tr>
			<tr>
				<td>textbook_price :</td>
				<td><input type="text" name="textbookPrice" value="${textbookOne.textbookPrice }"></td>
			</tr>
			<tr>
				<td>textbook_publishdate :</td>
				<td><input type="text" name="textbookPublishdate" value="${textbookOne.textbookPublishdate }" readonly="readonly"></td>
			</tr>
		</table>
		<a href="${path }/manager/textbookOne/${textbookOne.textbookIsbn }">돌아가기</a>
		<button type="submit">수정 완료</button>
	</form>
</body>
</html>