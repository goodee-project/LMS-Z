<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceStateOne</title>
</head>
<body>
	<h1>출석부 수정</h1>
	<form method="post" action="${path}/teacher/modifyAttendanceStateOne/${studentId}/${lectureNo}/${attendanceDay}">
		<table border="1">
			<input type="hidden" value="${studentId}" name="accountId">
			<input type="hidden" value="${lectureNo}" name="lectureNo">
			<c:forEach var="a" items="${attendanceStateList}">	
			<c:forEach var="as" items="${a.studentList}">
				<tr>
					<th>student_name</th>
					<td><input name="studentName" value="${as.studentName}" readonly></td>
				</tr>
				<tr>
					<th>student_gender</th>
					<td><input name="studentGender" value="${as.studentGender}" readonly></td>
				</tr>
				<tr>
					<th>student_phone</th>
					<td><input name="studentPhone" value="${as.studentPhone}" readonly></td>
				</tr>
			</c:forEach>
				<tr>
					<th>attendance_state</th>
					<td>
						<select id="attendanceState" name="attendanceState">
							<option value="${a.attendanceState}">${a.attendanceState}</option>
								<c:if test="${a.attendanceState == '출석'}">
										<option value="결석">결석</option>
										<option value="외출">외출</option>
										<option value="조퇴">조퇴</option>
										<option value="지각">지각</option>
								</c:if>
								<c:if test="${a.attendanceState == '결석'}">
										<option value="출석">출석</option>
										<option value="외출">외출</option>
										<option value="조퇴">조퇴</option>
										<option value="지각">지각</option>
								</c:if>
								<c:if test="${a.attendanceState == '외출'}">
										<option value="출석">출석</option>
										<option value="결석">결석</option>
										<option value="조퇴">조퇴</option>
										<option value="지각">지각</option>
								</c:if>
								<c:if test="${a.attendanceState == '조퇴'}">
										<option value="출석">출석</option>
										<option value="결석">결석</option>
										<option value="외출">외출</option>
										<option value="지각">지각</option>
								</c:if>
								<c:if test="${a.attendanceState == '지각'}">
										<option value="출석">출석</option>
										<option value="결석">결석</option>
										<option value="외출">외출</option>
										<option value="조퇴">조퇴</option>
								</c:if>
						</select>
					</td> 
				</tr>
				<tr>
					<th>attendance_remark</th>
					<td><textarea rows="3" cols="50" name="attendanceRemark">${a.attendanceRemark}</textarea></td>
				</tr>
				<tr>
					<th>attendance_day</th>
					<td><input name="attendanceDay" value="${a.attendanceDay}" readonly></td>
				</tr>
			</c:forEach>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>