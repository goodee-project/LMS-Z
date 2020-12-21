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
	
	<!-- 카테고리 출력 -> 클릭한 카테고리에 해당하는 리스트 출력 -->
	<div>
		<a href="${path}/teacher/faqList/1/total">전체</a>
		<c:forEach var="c" items="${category}">
			<a href="${path}/teacher/faqList/1/${c.faqCategory}">${c.faqCategory}</a>
		</c:forEach>
	</div>
	
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
	<!-- 페이징 -->
	<!-- c:when : 전체 faq목록 출력 -> faqCategory가 total과 일치했을 때 페이징 
		 c:otherwise : 카테고리별 faq목록 출력 -> faqCategory가 넘어온 faqCategory값과 같을 때 페이징 -->
	<div>
		<c:choose>
			<c:when test="${faqCategory == 'total'}">
				<c:if test="${currentPage > 1}">
					<a href="${path}/teacher/faqList/${currentPage - 1}/total">이전</a>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<a href="${path}/teacher/faqList/${currentPage + 1}/total"> 다음 </a>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${currentPage > 1}">
					<a href="${path}/teacher/faqList/${currentPage - 1}/${faqCategory}">이전</a>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<a href="${path}/teacher/faqList/${currentPage + 1}/${faqCategory}"> 다음 </a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>