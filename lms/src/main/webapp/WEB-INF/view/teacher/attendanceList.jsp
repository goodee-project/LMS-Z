<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceList</title>
<style> 
	#table{ float:left; margin-right:13px;} 
	#floatClear{clear:left;}
</style>
</head>
<body>
	<h1>출석부</h1>
	
	<a href="${path}/teacher/attendanceList/${lectureNo}/${currentYear}/${currentMonth}/${currentDay-1}/${lectureStartdate}/${lectureEnddate}">이전</a>
		<h2>${currentYear}년 ${currentMonth}월 ${currentDay}일</h2>
	<a href="${path}/teacher/attendanceList/${lectureNo}/${currentYear}/${currentMonth}/${currentDay+1}/${lectureStartdate}/${lectureEnddate}">다음</a>
	
	<div id="floatClear"></div>
	
	<table border="1" id="table">
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
					<td><a href="${path}/teacher/modifyAttendanceStateOne/${as.studentId}/${lectureNo}/${a.attendanceDay}/${currentYear}/${currentMonth}/${currentDay}/${lectureStartdate}/${lectureEnddate}">${as.studentName}</a></td>
					<td>${as.studentGender}</td>
					<td>${as.studentPhone}</td>
				</c:forEach>
					<td>${a.attendanceState}</td>
					<td>${a.attendanceRemark}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table border="1">
		<thead>
			<tr>
				<th>class_registration_no</th>
				<th>학생이름</th>
				<th>class_registration_state</th>
				<th>class_registration_point</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cr" items="${classRsgistrationList}">
				<tr>
					<td>${cr.classRegistrationNo}</td>
					<c:forEach var="s" items="${cr.studentList}">
						<td>${s.studentName}</td>
					</c:forEach>
					<td>${cr.classRegistrationState}</td>
					<td>${cr.classRegistrationPoint}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="floatClear"></div>
	
	<a href="${path}/teacher/attendanceMonth/${lectureNo}/-1/-1/${lectureStartdate}/${lectureEnddate}">뒤로가기</a>
</body>
</html>