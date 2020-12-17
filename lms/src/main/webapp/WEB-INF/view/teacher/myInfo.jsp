<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherInfo</title>
</head>
<body>
	<div><a href="${path}/teacher/index">HOME</a></div>
	<h1>마이페이지</h1>
	<div>이미지 출력(구현필요)</div>
	<div>
		아이디 : ${teacherOne.teacherId}
	</div>
	<div>
		이름 : ${teacherOne.teacherName}
	</div>
	<div>
		생년월일 : ${teacherOne.teacherBirth}
	</div>
	<div>
		성별 : ${teacherOne.teacherGender}
	</div>
	<div>
		이메일 : ${teacherOne.teacherEmail}
	</div>
	<div>
		전화번호 : ${teacherOne.teacherPhone}
	</div>
	<div>
		주소 : ${teacherOne.teacherAddressMain} ${teacherOne.teacherAddressSub}
	</div>
</body>
</html>