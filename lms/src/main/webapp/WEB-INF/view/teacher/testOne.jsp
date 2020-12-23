<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testOne</title>
</head>
<body>
	<h1>시험문제 / 답 보기</h1>
	
	<div>
		<!-- 시험이 있을 경우 수정만 할 수 있음 -->
		<c:if test="${testOne != null}">
			<a href="${path}/teacher/modifyTest/${lectureNo}">시험문제 / 답 수정</a>
		</c:if>
		<!-- 시험이 없을 경우 추가만 할 수 있음 -->
		<c:if test="${testOne == null}">
			<a href="${path}/teacher/addTest/${lectureNo}">시험문제 / 답 추가</a>
		</c:if>
	</div>
	
	<fieldset>
		<legend>시험문제</legend>
		<c:if test="${testOne != null}">
			<c:forEach var="m" items="${testOne}">
				<div>${m.multiplechoiceId}. ${m.multiplechoiceQuestion} (답 : ${m.multiplechoiceAnswer})</div>
				<c:forEach var="e" items="${m.multiplechoiceExampleList}">
					<div>(${e.multiplechoiceExampleId}) ${e.multiplechoiceExampleContent}</div>
				</c:forEach>
				<div></div>
			</c:forEach>
		</c:if>
		<c:if test="${testOne == null}">
			<div>시험문제가 없습니다.</div>
		</c:if>
	</fieldset>
</body>
</html>