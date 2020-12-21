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
	<h1>classroomList</h1>
	<a href="${path }/manager/insertClassroom">강의실 추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>classroom_no</th>
				<th>classroom_number</th>
				<th>classroom_size</th>
				<th>classroom_total</th>
				<th>classroom_state</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${classroomList }">
				<tr>
					<td>${c.classroomNo }</td>
					<td>${c.classroomNumber }</td>
					<td>${c.classroomSize }</td>
					<td>${c.classroomTotal }</td>
					<td>${c.classroomState }</td>
					<c:if test="${c.classroomState =='빈강의실'}">
						<td><a href="${path }/manager/deleteClassroom/${c.classroomNo}">삭제</a></td>
					</c:if>
					<c:if test="${c.classroomState =='사용중'}">
						<td>&nbsp;</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="${path}/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${path}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/dist/js/app-style-switcher.js"></script>
    <script src="${path}/dist/js/feather.min.js"></script>
    <script src="${path}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${path}/dist/js/sidebarmenu.js"></script>
    <script src="${path}/dist/js/custom.min.js"></script>
    <script src="${path}/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${path}/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${path}/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${path}/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${path}/dist/js/pages/dashboards/dashboard1.min.js"></script>
    <script>
		
    </script>
</body>
</html>