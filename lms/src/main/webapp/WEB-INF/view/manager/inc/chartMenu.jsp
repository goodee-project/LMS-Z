<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul class="navbar-nav float-left">
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			<span>차트를 선택하세요</span><i data-feather="chevron-down"></i>
		</a>
		<!-- 드롭다운 내용 -->
		<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
			<a class="dropdown-item" href="${path }/chart/teacherInOutCount.jsp">
				<i class="svg-icon mr-2 ml-1"></i>
				강사 가입/탈퇴수 
			</a>
			<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${path }/chart/studentInOutCount.jsp">
				<i class="svg-icon mr-2 ml-1"></i>
				학생 가입/탈퇴수
			</a>
			<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${path }/chart/teacherAndStudentCount.jsp">
				<i class="svg-icon mr-2 ml-1"></i>
				lms이용자
			</a>
			
		</div>
	</li>
</ul>