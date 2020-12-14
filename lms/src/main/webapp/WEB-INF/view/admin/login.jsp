<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lms</title>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<link href="${path}/login.css" rel="stylesheet" type="text/css" media="all" />
	<script src="${path}/login.js"></script>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="${path}/adminLogin">
		<div>
			ID : 
			<input type="text" name="accountId">
		</div>
		<div>
			PW : 
			<input type="password" name="accountPw">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
	
</body>
</html>