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
	<table border="1">
		<thead>
			<tr>
				<th>lectureArchiveNo</th>
				<th>lecture_no</th>
				<th>account_id</th>
				<th>lecture_archive_writer</th>
				<th>lecture_archive_title</th>
				<th>lecture_archive_content</th>
				<th>lecture_archive_updatedate</th>
				<th>lecture_archive_count</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach var="la" items="${lectureArchive}">
				<tr>
					<td><a href="${path}/student/lectureArchiveOne/${la.lectureArchiveNo}">${la.lectureArchiveNo}</a></td>
					<td>${la.lectureNo}</td>
					<td>${la.accountId}</td>
					<td>${la.lectureArchiveWriter}</td>
					<td>${la.lectureArchiveTitle}</td>
					<td>${la.lectureArchiveContent}</td>
					<td>${la.lectureArchiveUpdatedate}</td>
					<td>${la.lectureArchiveCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>