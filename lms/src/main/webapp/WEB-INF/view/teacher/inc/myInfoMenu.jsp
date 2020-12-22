<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav class="navbar">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="${path}/teacher/myInfo/${teacherId}">개인정보변경</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${path}/teacher/myInfoPw">Pw변경</a>
		<li class="nav-item">
			<a class="nav-link" href="${path}/teacher/myInfoPw">주소변경</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${path}/teacher/deleteMyInfo">회원탈퇴</a>
		</li>
	</ul>
</nav>