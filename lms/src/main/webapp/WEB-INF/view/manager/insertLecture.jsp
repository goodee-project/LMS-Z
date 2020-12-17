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
<h1>강좌 등록</h1>
<form method="post" action="${path }/manager/insertAction">
	<table>
		<tr>
			<td>subject_name</td>
			<td>
				<select name="subjectNo">
					<c:forEach var="s" items="${subjectList }">
						<option value="${s.subjectNo }">${s.subjectName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>account_id/Name</td>
			<td>
				<select name="accountId">
					<c:forEach var="t" items="${teacherList }">
						<option value="${t.teacherId }">${t.teacherId}/${t.teacherName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>account_id/Name</td>
			<td>
				<select name="teacherName">
					<c:forEach var="t" items="${teacherList }">
						<option value="${t.teacherName }">${t.teacherName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>lecture_name</td>
			<td>
				<input type="text" name="lectureName">
			</td>
		</tr>
		<tr>
			<td>total_date</td>
			<td>
				<input type="text" name="lectureTotal">
			</td>
		</tr>
		<tr>
			<td>textbook</td>
			<td>
				<select name="textbookIsbn">
					<c:forEach var="t" items="${textbookList }">
						<option value="${t.textbookIsbn}">${t.textbookTitle }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>syllabus</td>
			<td>
				<select name="syllabusNo">
					<c:forEach var="s" items="${syllabusList }">
						<option value="${s.syllabusNo }">${s.syllabusContent }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>classroom</td>
			<td>
				<select name="classroomNo">
					<c:forEach var="c" items="${classroomList }">
						<option value="${c.classroomNo }">${c.classroomNumber }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<button id="btn" type="submit">등록</button>
</form>
</body>
</html>