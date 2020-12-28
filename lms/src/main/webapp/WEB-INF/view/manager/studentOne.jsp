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
	<h1>studentOne</h1>
	<table border="1">
		<tr>
			<td>이름 :</td>
			<td>${studentOne.studentName }</td>
		</tr>
		<tr>
			<td>아이디 :</td>
			<td>${studentOne.studentId }</td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td>${studentOne.studentEmail }</td>
		</tr>
		<tr>
			<td>핸드폰 :</td>
			<td>${studentOne.studentPhone }</td>
		</tr>
		<tr>
			<td>생일 :</td>
			<td>${studentOne.studentBirth }</td>
		</tr>
		<tr>
			<td>성별 :</td>
			<td>${studentOne.studentGender }</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td>${studentOne.studentAddressMain }</td>
		</tr>
		<tr>
			<td colspan="2">${studentOne.studentAddressSub }</td>
		</tr>
		<tr>
			<td>사진 :</td>
			<td><img src="/${path }/images/${studentOne.studentImage }" style="width:170px; height:200px;"></td>
		</tr>
		<tr>
			<td>승인날짜 :</td>
			<td>${studentOne.studentAccessdate }</td>
		</tr>
		<tr>
			<td>수정날짜 :</td>
			<td>${studentOne.studentUpdatedate }</td>
		</tr>
		<tr>
			<td>승인한운영자 :</td>
			<td>${studentOne.managerIdAccess }</td>
		</tr>
	</table>
	<a href="${path }/manager/memberList/1/${searchLevel}">돌아가기</a>
</body>
</html>