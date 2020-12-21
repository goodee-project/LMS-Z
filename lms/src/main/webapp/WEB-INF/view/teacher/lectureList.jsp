<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<body>
   <h1>강의목록</h1>
	<table border="1">
		<thead>
			<tr>
				<td>강의명</td>
				<td>강의기간</td>
				<td>정원</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${list}">
				<tr>
					<td><a href="${path}/teacher/lectureOne/${l.lectureNo}">${l.lectureName}</a></td>
					<td>${l.lectureStartdate} ~ ${l.lectureEnddate}</td>
					<td>${l.lectureTotal}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${currentPage > 1}">
			<a href="${path}/teacher/lectureList/${teacherId}/${currentPage - 1}">이전</a>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${path}/teacher/lectureList/${teacherId}/${currentPage + 1}">다음</a>
		</c:if>
	</div>
</body>
</html>