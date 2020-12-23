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
				<!-- 숫자로 페이징 -->
				<c:forEach var="i" begin="1" end="${lastPage}">
					<span>
                		<a href="${path}/teacher/lmsNoticeList/${i}">${i}&nbsp;&nbsp;</a>
                	</span>
                </c:forEach>
			</tbody>
		</table>
</body>
</html>