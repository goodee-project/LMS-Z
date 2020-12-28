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
	<h1>teacherOne</h1>
	<table border="1">
		<tr>
			<td>이름 :</td>
			<td>${teacherOne.teacherName }</td>
		</tr>
		<tr>
			<td>아이디 :</td>
			<td>${teacherOne.teacherId }</td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td>${teacherOne.teacherEmail }</td>
		</tr>
		<tr>
			<td>핸드폰 :</td>
			<td>${teacherOne.teacherPhone }</td>
		</tr>
		<tr>
			<td>생일 :</td>
			<td>${teacherOne.teacherBirth }</td>
		</tr>
		<tr>
			<td>성별 :</td>
			<td>${teacherOne.teacherGender }</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td>${teacherOne.teacherAddressMain }</td>
		</tr>
		<tr>
			<td colspan="2">${teacherOne.teacherAddressSub }</td>
		</tr>
		<tr>
			<td>사진 :</td>
			<td>${teacherOne.teacherImage }</td>
		</tr>
		<tr>
			<td>승인날짜 :</td>
			<td>${teacherOne.teacherAccessdate }</td>
		</tr>
		<tr>
			<td>수정날짜 :</td>
			<td>${teacherOne.teacherUpdatedate }</td>
		</tr>
		<tr>
			<td>정보 :</td>
			<td>${teacherOne.teacherInfo }</td>
		</tr>
		<tr>
			<td>승인한운영자 :</td>
			<td>${teacherOne.managerIdAccess }</td>
		</tr>
	</table>
</body>
</html>