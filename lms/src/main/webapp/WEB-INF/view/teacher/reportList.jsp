<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportList</title>
</head>
<body>
	<h1>과제목록</h1>
		<a href="${path}/teacher/addReport/${currentPage}">과제등록</a>
		<table border="1">
				<thead>
					<tr>
						<th>report_no</th>
						<th>lecture_no</th>
						<th>report_title</th>
						<th>report_content</th>
						<th>report_startdate</th>
						<th>report_enddate</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="r" items="${reportList}">
						<tr>
							<td>${r.reportNo}</td>
							<td>${r.lectureNo}</td>
							<td><a href="${path}/teacher/reportOne/${r.reportNo}">${r.reportTitle}</a></td>
							<td>${r.reportContent}</td>
							<td>${r.reportStartdate}</td>
							<td>${r.reportEnddate}</td>
							<td><a href="${path}/teacher/removeReport/${r.reportNo}/${teacherId}/${currentPage}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
		   	<div>
		   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
		   		<c:if test="${startPage!=1 && lastPage!=1}">
		    		<span>
		    			<a href="${path}/teacher/reportList/${teacherId}/${startPage-10}">이전&nbsp;&nbsp;</a>
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
			      			<a href="${path}/teacher/reportList/${teacherId}/${i}">${i}&nbsp;&nbsp;</a>
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
				      			<a href="${path}/teacher/reportList/${teacherId}/${i}">${i}&nbsp;&nbsp;</a>
				      		</span>
			     		</c:if>
		     		</c:forEach>
		    	</c:if>
		    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
		    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
			     	<span>
			     		<a href="${path}/teacher/reportList/${teacherId}/${startPage+10}">다음&nbsp;&nbsp;</a>
			     	</span>
		    	</c:if>
		   	</div>
	
</body>
</html>