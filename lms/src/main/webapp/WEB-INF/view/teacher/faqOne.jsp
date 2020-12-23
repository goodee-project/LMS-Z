<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqOne</title>
</head>
<body>
	<h1>FAQ 상세보기</h1>
	
	<div>조회수 : ${faqOne.faqCount}</div>
	<div>FAQ > ${faqOne.faqCategory}</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${faqOne.faqTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${faqOne.faqContent}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${faqOne.faqWriter}</td>
		</tr>
		<tr>
			<td>등록날짜</td>
			<td>${faqOne.faqCreatedate}</td>
		</tr>
		<tr>
			<td>수정날짜</td>
			<td>${faqOne.faqUpdatedate}</td>
		</tr>
	</table>
	<div>
		<a href="${path}/teacher/faqList/1/total">목록</a>
	</div>
</body>
</html>