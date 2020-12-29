<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="UTF-8">
<title>lmsNoticeList</title>
</head>
<body>
	<h1>LMS 공지사항</h1>
	<a href="${path}/teacher/index">메인페이지</a>
		<table border="1">
			<thead>
				<tr>
					<th>lms_notice_no</th>
					<th>lms_notice_writer</th>
					<th>lms_notice_title</th>
					<th>lms_notice_count</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${lmsNoticeList}">
					<tr>
						<td>${l.lmsNoticeNo}</td>
						<td>${l.lmsNoticeWriter}</td>
						<td><a href="${path}/teacher/modifyLmsNoticeCount/${l.lmsNoticeNo}/${currentPage}">${l.lmsNoticeTitle}</a></td>
						<td>${l.lmsNoticeCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
	   	<div>
	   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
	   		<c:if test="${startPage!=1 && lastPage!=1}">
	    		<span>
	    			<a href="${path}/teacher/lmsNoticeList/${startPage-10}">이전&nbsp;&nbsp;</a>
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
		      			<a href="${path}/teacher/lmsNoticeList/${i}">${i}&nbsp;&nbsp;</a>
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
			      			<a href="${path}/teacher/lmsNoticeList/${i}">${i}&nbsp;&nbsp;</a>
			      		</span>
		     		</c:if>
	     		</c:forEach>
	    	</c:if>
	    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
	    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
		     	<span>
		     		<a href="${path}/teacher/lmsNoticeList/${startPage+10}">다음&nbsp;&nbsp;</a>
		     	</span>
	    	</c:if>
	   	</div>
</body>
</html>