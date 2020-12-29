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
	<a href="${path}/teacher/attendanceList/${lectureNo}/pre/${currentYear}/${currentMonth}/${currentDay}">이전</a>
	<h2>${currentYear}년 ${currentMonth}월 ${currentDay}일</h2>
	<a href="${path}/teacher/attendanceList/${lectureNo}/next/${currentYear}/${currentMonth}/${currentDay}">다음</a>
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
					<td><a href="${path}/teacher/modifyAttendanceStateOne/${as.studentId}/${lectureNo}/${a.attendanceDay}/${currentYear}/${currentMonth}/${currentDay}">${as.studentName}</a></td>
					<td>${as.studentGender}</td>
					<td>${as.studentPhone}</td>
				</c:forEach>
					<td>${a.attendanceState}</td>
					<td>${a.attendanceRemark}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${path}/teacher/attendanceMonth/${lectureNo}/-1/-1">뒤로가기</a>
</body>
</html>