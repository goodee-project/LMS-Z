<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	    a { 
    		color: #BDBDBD; 	
    	}
    	
    	a:visited { 
    		color: #BDBDBD; 
    	}
    	
    	a:hover {
    		color: #8C8C8C; 
    	}
</style>
<nav class="navbar">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link font-weight-bold" href="${path}/manager/myInfo/${managerId}">개인정보</a>
		</li>
		<li class="nav-item">
			<a class="nav-link font-weight-bold" href="${path}/manager/modifyMyInfo/${managerId}">개인정보변경</a>
		</li>
		<li class="nav-item">
			<a class="nav-link font-weight-bold" href="${path}/manager/myInfoAddress/${managerId}">주소변경</a>
		</li>
		<li class="nav-item">
			<a class="nav-link font-weight-bold" href="${path}/manager/myInfoPw">Pw변경</a>
		<li class="nav-item">
			<a class="nav-link font-weight-bold" href="${path}/manager/deleteMyInfo">회원탈퇴</a>
		</li>
	</ul>
</nav>