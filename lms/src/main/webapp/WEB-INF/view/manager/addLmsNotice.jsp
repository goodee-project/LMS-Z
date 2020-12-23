<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>addLmsNotice</title>
</head>
<body>
	<h1>공지추가</h1>
	<form method="post" action="${path }/manager/addLmsNotice">
		<table border=1>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="accountId" value="${managerId }">
					<input type="text" name="lmsNoticeWriter" value="${managerName}">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="lmsNoticeTitle">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="lmsNoticeContent" style="resize:none;overflow:visible;" cols="50"></textarea>
				</td>
			</tr>
		</table>
		<a href="${path }/manager/lmsNoticeList/${currentPage}">뒤로</a>
		<button type="submit">추가</button>
	</form>
</body>
</html>