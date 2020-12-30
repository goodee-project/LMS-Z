<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTestQuestion</title>
</head>
<body>
	<h1>시험문제 수정</h1>
	<form id="test" method="post" action="${path}/teacher/modifyTestQuestion/${multiplechoiceNo}">
		<table>
			<tr>
				<td>문제 번호</td>
				<td>
					<input type="text" id="multiplechoiceId" name="multiplechoiceId" value="${testOne.multiplechoiceId}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>문제 내용</td>
				<td>
					<textarea rows="5" cols="50" id="multiplechoiceQuestion" name="multiplechoiceQuestion">${testOne.multiplechoiceQuestion}</textarea>
					<div id="choiceQuestion"></div>
				</td>
			</tr>
			<tr>
				<td>정답</td>
				<td>
					<input type="text" id="multiplechoiceAnswer" name="multiplechoiceAnswer" value="${testOne.multiplechoiceAnswer}">
					<div id="choiceAnswer"></div>
				</td>
			</tr>
		</table>
		<c:forEach var="i" items="${testOne.multiplechoiceExampleList}" varStatus="status">
			<div>보기 번호 : <input type="text" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleId" value="${i.multiplechoiceExampleId}" readonly="readonly"></div>
			<div>보기 문항 : <input type="text" id="multiplechoiceExampleContent${status.count}" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleContent" value="${i.multiplechoiceExampleContent}"></div>
			<div id="exampleContent${status.count}"></div>
			&nbsp;
		</c:forEach>
		<button id="btn" type="submit">수정</button>
	</form>
	
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
</body>
</html>