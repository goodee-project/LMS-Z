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
	<a href="${path}/teacher/lectureArchiveModify/${teacherId}/${lectureArchive.lectureArchiveNo}">수정</a>
	<a href="${path}/teacher/lectureArchiveRemove/${lectureArchive.lectureArchiveNo}/${teacherId}">삭제</a>
	<table border="1">
		<tr>
			<td>강의: ${lecture.lectureName}</td>
			<td>작성자: ${lectureArchive.lectureArchiveWriter} (${lectureArchive.accountId })</td>
		</tr>
		<tr>	
			<td>lecture_archive_title: ${lectureArchive.lectureArchiveTitle}</td>
			<td>lecture_archive_content: ${lectureArchive.lectureArchiveContent}</td>
			<td>lecture_archive_updatedate: ${lectureArchive.lectureArchiveUpdatedate}</td>
			<td>lecture_archive_count: ${lectureArchive.lectureArchiveCount}</td>
		</tr>
	</table>
	
	<table border="1">
		<c:forEach var="laf" items="${lectureArchive.lectureArchiveFileList}">
			<c:if test="${laf.lectureArchiveFileUuid != null}">
				<tr>
					<td>fileName:<a href="${path}/teacher/lectureArchiveFileCountUp/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a></td>
					<td>count:${laf.lectureArchiveFileCount}</td>
				</tr>
			</c:if>
			<c:if test="${laf.lectureArchiveFileUuid == null}">
				<tr>
					<td>첨부파일이 없습니다.</td>
				</tr>
			</c:if>
		</c:forEach>	
	</table>
</body>
</html>