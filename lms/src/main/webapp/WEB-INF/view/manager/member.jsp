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
	<h1>강사/학생 승인</h1>${studentList }
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
			</tr>
		</thead>
		<tbody>
		
		</tbody>
		
	</table>
</body>
</html>