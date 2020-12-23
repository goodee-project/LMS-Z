<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>addFaqList</title>
</head>
<body>
	<h1>FAQ 작성</h1>
	<form method="post" action="${path }/manager/addFaqList/${currentPage}">
		<table border=1>
			<tr>
				<th>
					작성자
				</th>
				<td>
					<input type="text" name="accountId" value="${managerId }" readonly="readonly" hidden="hidden">
					<input type="text" name="faqWriter" value="${faqWriter }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="faqTitle" style="width:350px"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="faqContent" style="resize:none;overflow:visible;" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="faqCategory">
						<option value="강의">강의</option>
						<option value="비대면">비대면</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit">입력</button>
	</form>
	<a href="${path }/manager/faqList/강의/1">뒤로</a>
</body>
</html>