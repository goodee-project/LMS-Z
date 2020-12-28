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
		<a href="${path}/teacher/addReport">과제등록</a>
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
							<td><a href="${path}/teacher/removeReport/${r.reportNo}/${teacherId}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</body>
</html>