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
	
	<a href="${path}/teacher/attendanceList/${lectureNo}/${currentYear}/${currentMonth}/${currentDay-1}">이전</a>
		<h2>${currentYear}년 ${currentMonth}월 ${currentDay}일</h2>
	<a href="${path}/teacher/attendanceList/${lectureNo}/${currentYear}/${currentMonth}/${currentDay+1}">다음</a>
	
	<div id="floatClear"></div>
	
	<table border="1" id="table">
		<thead>
			<tr>
				<th>student_name</th>
				<th>student_image</th>
				<th></th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="a" items="${attendanceList}">
				<tr>
					<c:forEach var="as" items="${a.studentList}">
						<td><a href="${path}/teacher/modifyAttendanceStateOne/${as.studentId}/${lectureNo}/${a.attendanceDay}/${currentYear}/${currentMonth}/${currentDay}">${as.studentName}</a></td>
						<td><img src="${path}/images/${as.studentImage}"></td>
						<td>출석</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div id="floatClear"></div>
	
	<a href="${path}/teacher/attendanceMonth/${lectureNo}/-1/-1">뒤로가기</a>
</body>
</html>