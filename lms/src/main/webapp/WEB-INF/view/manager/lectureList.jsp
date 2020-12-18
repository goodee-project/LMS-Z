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
	<h1>강좌 목록</h1>
	<a href="${path }/manager/insertLecture">강좌 등록</a>
	<table border="1">
		<thead>
			<tr>
				<th>no</th>
				<th>account_id</th>
				<th>sub_name</th>
				<th>teacher_name</th>
				<th>lecture_name</th>
				<th>textbook_title</th>
				<th>startdate</th>
				<th>enddate</th>
				<th>total</th>
				<th>syllabus</th>
				<th>classroom</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${lectureList }">
				<tr>
					<td>${l.lectureNo }</td>
					<td>${l.accountId }</td>
					<td>${l.subject.subjectName }</td>
					<td>${l.teacherName }</td>
					<td>${l.lectureName }</td>
					<td>${l.textbook.textbookTitle }</td>
					<td>${l.lectureStartdate }</td>
					<td>${l.lectureEnddate }</td>
					<td>${l.lectureTotal }</td>
					<td>${l.syllabus.syllabusContent }</td>
					<td>${l.classroom.classroomNumber }</td>
					<td><a href="${path }/manager/deleteLecture/${l.lectureNo}/${l.classroomNo}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>