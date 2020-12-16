<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lmsNoticeOne</title>
</head>
<body>
	<h1>LMS 공지사항 상세보기</h1>
		<table border="1">
			<tr>
				<th>lms_notice_no</th>
				<td>${lmsNotice.lmsNoticeNo}</td>
			</tr>
			<tr>
				<th>lms_notice_writer</th>
				<td>${lmsNotice.lmsNoticeWriter}</td>
			</tr>
			<tr>
				<th>lms_notice_title</th>
				<td>${lmsNotice.lmsNoticeTitle}</td>
			</tr>
			<tr>
				<th>lms_notice_content</th>
				<td>${lmsNotice.lmsNoticeContent}</td>
			</tr>
		</table>
</body>
</html>