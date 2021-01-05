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
			<c:if test="${!empty faqList}">
				<c:forEach var="f" items="${faqList}">
					<tr>
						<td>${f.faqCategory}</td>
						<td>${f.faqNo}</td>
						<td><a href="${path}/teacher/modifyFaqCount/${f.faqNo}">${f.faqTitle}</a></td>
						<td>${f.faqWriter}</td>
						<td>${f.faqCreatedate}</td>
						<td>${f.faqCount}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty faqList}">
				<tr>
					<td colspan="6">등록된 FAQ가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<!-- 페이징 -->
	<!-- c:when : 전체 faq목록 출력 -> faqCategory가 total과 일치했을 때 페이징 
		 c:otherwise : 카테고리별 faq목록 출력 -> faqCategory가 넘어온 faqCategory값과 같을 때 페이징 -->
	<div>
		<c:choose>
			<c:when test="${faqCategory == 'total'}">
				<br>
			   	<div>
			   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
			   		<c:if test="${startPage!=1 && lastPage!=1}">
			    		<span>
			    			<a href="${path}/teacher/faqList/${startPage-10}/total">이전&nbsp;&nbsp;</a>
			    		</span>
			   		</c:if>
			   		<!-- lastPage가 10개를 채울수 없을 때 -->
			   		<c:if test="${startPage+9 > lastPage }">
			     	<c:forEach var="i" begin="${startPage }" end="${lastPage}">
			     		<!-- 현재 페이지일 경우 -->
			     		<c:if test="${currentPage == i }">
				      		<span>
				      			<a>${i}&nbsp;&nbsp;</a>
				      		</span>
			     		</c:if>
			     		<!-- 현재 페이지가 아닐 경우 -->
			     		<c:if test="${currentPage != i }">
				      		<span>
				      			<a href="${path}/teacher/faqList/${i}/total">${i}&nbsp;&nbsp;</a>
				      		</span>
			     		</c:if>
			     	</c:forEach>
			    	</c:if>
			    	<c:if test="${startPage+9<lastPage }">
			    		<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
				     		<!-- 현재 페이지일 경우 -->
				     		<c:if test="${currentPage == i }">
					      		<span>
					      			<a>${i}&nbsp;&nbsp;</a>
					      		</span>
				     		</c:if>
				     		<!-- 현재 페이지가 아닐 경우 -->
				     		<c:if test="${currentPage != i }">
					      		<span>
					      			<a href="${path}/teacher/faqList/${i}/total">${i}&nbsp;&nbsp;</a>
					      		</span>
				     		</c:if>
			     		</c:forEach>
			    	</c:if>
			    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
			    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
				     	<span>
				     		<a href="${path}/teacher/faqList/${startPage+10}/${faqCategory}">다음&nbsp;&nbsp;</a>
				     	</span>
			    	</c:if>
			   	</div>
			</c:when>
			<c:otherwise>
				<br>
			   	<div>
			   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
			   		<c:if test="${startPage!=1 && lastPage!=1}">
			    		<span>
			    			<a href="${path}/teacher/faqList/${startPage-10}/${faqCategory}">이전&nbsp;&nbsp;</a>
			    		</span>
			   		</c:if>
			   		<!-- lastPage가 10개를 채울수 없을 때 -->
			   		<c:if test="${startPage+9 > lastPage }">
			     	<c:forEach var="i" begin="${startPage }" end="${lastPage}">
			     		<!-- 현재 페이지일 경우 -->
			     		<c:if test="${currentPage == i }">
				      		<span>
				      			<a>${i}&nbsp;&nbsp;</a>
				      		</span>
			     		</c:if>
			     		<!-- 현재 페이지가 아닐 경우 -->
			     		<c:if test="${currentPage != i }">
				      		<span>
				      			<a href="${path}/teacher/faqList/${i}/${faqCategory}">${i}&nbsp;&nbsp;</a>
				      		</span>
			     		</c:if>
			     	</c:forEach>
			    	</c:if>
			    	<c:if test="${startPage+9<lastPage }">
			    		<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
				     		<!-- 현재 페이지일 경우 -->
				     		<c:if test="${currentPage == i }">
					      		<span>
					      			<a>${i}&nbsp;&nbsp;</a>
					      		</span>
				     		</c:if>
				     		<!-- 현재 페이지가 아닐 경우 -->
				     		<c:if test="${currentPage != i }">
					      		<span>
					      			<a href="${path}/teacher/faqList/${i}/${faqCategory}">${i}&nbsp;&nbsp;</a>
					      		</span>
				     		</c:if>
			     		</c:forEach>
			    	</c:if>
			    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
			    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
				     	<span>
				     		<a href="${path}/teacher/faqList/${startPage+10}/${faqCategory}">다음&nbsp;&nbsp;</a>
				     	</span>
			    	</c:if>
			   	</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>