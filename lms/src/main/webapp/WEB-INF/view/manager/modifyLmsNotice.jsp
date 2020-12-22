<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="UTF-8">
<title>modifyLmsNotice</title>
</head>
<body>
	<h1>공지 수정</h1>
	<form method="post" action="${path}/manager/modifyLmsNotice/${currentPage}">
		<table border=1>
			<tr>
				<th>NO</th>
				<td>
					<input type="text" name="lmsNoticeNo" value="${lmsNotice.lmsNoticeNo }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>게시일</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeCreatedate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeUpdatedate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeWriter }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="lmsNoticeTitle" value="${lmsNotice.lmsNoticeTitle }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="lmsNoticeContent" style="resize:none;overflow:visible;" cols="50">${lmsNotice.lmsNoticeContent }</textarea>
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>