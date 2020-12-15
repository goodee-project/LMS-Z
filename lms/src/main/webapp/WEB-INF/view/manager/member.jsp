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
	<h1>강사/학생 승인</h1>
	<table>
		<thead>
			<tr>
				<th>student_id</th>
				<th>student_email</th>
				<th>student_name</th>
				<th>student_phone</th>
				<th>student_gender</th>
				<th>student_birth</th>
				<th>student_address_main</th>
				<th>student_address_sub</th>
				<th>account_level</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="s" items="${studentList }">
				<tr>
					<td>${s.studentId }</td>
					<td>${s.studentEmail }</td>
					<td>${s.studentName }</td>
					<td>${s.studentPhone }</td>
					<td>${s.studentGender }</td>
					<td>${s.studentBirth }</td>
					<td>${s.studentAddressMain }</td>
					<td>${s.studentAddressSub }</td>
					<td>${s.account.accountLevel }</td>
					<td><a href="#">승인</a></td>
					<td><a href="${path}/manager/deleteStudentQueue/${s.studentId}">거절</a></td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
</body>
</html>