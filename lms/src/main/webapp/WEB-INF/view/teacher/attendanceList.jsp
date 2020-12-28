<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceList</title>
</head>
<body>
	<h1>출석부</h1>
	<table border="1">
		<thead>
			<tr>
				<th>student_name</th>
				<th>student_gender</th>
				<th>student_phone</th>
				<th>attendance_state</th>
				<th>attendance_remark</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="a" items="${attendanceList}">
				<tr>
				<c:forEach var="as" items="${a.studentList}">
					<td><a href="${path}/teacher/modifyAttendanceStateOne/${as.studentId}/${lectureNo}/${a.attendanceDay}">${as.studentName}</a></td>
					<td>${as.studentGender}</td>
					<td>${as.studentPhone}</td>
				</c:forEach>
					<td>${a.attendanceState}</td>
					<td>${a.attendanceRemark}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${path}/teacher/lectureOne/${lectureNo}">뒤로가기</a>
</body>
</html>