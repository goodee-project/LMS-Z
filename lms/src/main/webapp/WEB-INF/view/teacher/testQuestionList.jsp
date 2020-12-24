<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testQuestionList</title>
</head>
<body>
	<h1>시험문제 목록</h1>
	
	<div>
		<a href="${path}/teacher/addTestQuestion/${lectureNo}">새 문제 추가</a>
	</div>
	
	<table border="1">
		<thead>
			<tr>
				<th>No</th>
				<th>문항번호</th>
				<th>작성일시</th>
				<th>최종수정일시</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${multiplechoice != null}">
				<c:forEach var="m" items="${multiplechoice}">
					<tr>
						<td>${m.multiplechoiceNo}</td>
						<td><a href="${path}/teacher/testQuestionOne/${m.multiplechoiceNo}">평가 ${m.multiplechoiceId}번</a></td>
						<td>${m.multiplechoiceCreatedate}</td>
						<td>${m.multiplechoiceUpdatedate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${multiplechoice == ''}">
				<tr>
					<td colspan="4">등록된 시험문제가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</body>
</html>