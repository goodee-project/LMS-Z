<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강좌별 공지사항 목록</h1>
	<a href="${path}/teacher/addLectureNotice/${lectureNo}">공지 등록</a>
	<table border="1">
		<thead>
			<tr>
				<th>lecture_notice_no</th>
				<th>lecture_notice_title</th>
				<th>lecture_notice_createdate</th>
				<th>lecture_notice_updatedate</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.lectureNoticeNo}</td>
					<td><a href="${path}/teacher/modifyLectureNoticeCount/${lectureNo}/${n.lectureNoticeNo}">${n.lectureNoticeTitle}</a></td>
					<td>${n.lectureNoticeCreatedate}</td>
					<td>${n.lectureNoticeUpdatedate}</td>
					<td>${n.lectureNoticeCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<br>
   	<div>
   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
   		<c:if test="${startPage!=1 && lastPage!=1}">
    		<span>
    			<a href="${path}/teacher/lectureNoticeList/${lectureNo}/${startPage-10}">이전&nbsp;&nbsp;</a>
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
	      			<a href="${path}/teacher/lectureNoticeList/${lectureNo}/${i}">${i}&nbsp;&nbsp;</a>
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
		      			<a href="${path}/teacher/lectureNoticeList/${lectureNo}/${i}">${i}&nbsp;&nbsp;</a>
		      		</span>
	     		</c:if>
     		</c:forEach>
    	</c:if>
    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
	     	<span>
	     		<a href="${path}/teacher/lectureNoticeList/${lectureNo}/${startPage+10}">다음&nbsp;&nbsp;</a>
	     	</span>
    	</c:if>
   	</div>
</body>
</html>