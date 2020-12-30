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
	<table border="1">
		<tr>
			<td>lecture_no: ${lectureArchive.lectureNo }</td>
			<td>account_id: ${lectureArchive.accountId }</td>
			<td>lecture_archive_writer: ${lectureArchive.lectureArchiveWriter }</td>
			<td>lecture_archive_title: ${lectureArchive.lectureArchiveTitle }</td>
			<td>lecture_archive_content: ${lectureArchive.lectureArchiveContent }</td>
			<td>lecture_archive_updatedate: ${lectureArchive.lectureArchiveUpdatedate }</td>
			<td>lecture_archive_count: ${lectureArchive.lectureArchiveCount }</td>
		</tr>
	</table>
	
	<table border="1">
		<c:forEach var="laf" items="${lectureArchive.lectureArchiveFileList}">	
			<tr>
				<td>fileName:<a href="${path}/student/lectureArchiveFileDownload/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a></td>
				<td>count:${laf.lectureArchiveFileCount}</td>
			</tr>
		</c:forEach>	
	</table>
</body>
</html>