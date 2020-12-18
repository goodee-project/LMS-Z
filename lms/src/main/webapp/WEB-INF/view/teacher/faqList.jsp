<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList</title>
</head>
<body>
	<h1>FAQ</h1>
	
	<!-- select문으로 카테고리별로 FAQ 목록 출력 구현 필요
	<form method="post" action="${path}/teacher/faqList/${faqCategory}">
		<div>
			<select name="faqCategory">
				<option value="blank">전체</option>
				<c:forEach var="c" items="${category}">
					<option value="${c.faqCategory}">${c.faqCategory}</option>
				</c:forEach>
			</select>
		</div>
		<button type="submit">검색</button>
	</form>-->
	
	<table border=1>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="f" items="${faqList}">
				<tr>
					<td>${f.faqCategory}</td>
					<td>${f.faqNo}</td>
					<td>${f.faqTitle}</td>
					<td>${f.faqWriter}</td>
					<td>${f.faqCreatedate}</td>
					<td>${f.faqCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>