<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testQuestionOne</title>
</head>
<body>
	<h1>평가 ${testOne.multiplechoiceId}번</h1>
	<form method="post" action="${path}/student/answerMultiplechoice/${lectureNo}/${studentId}/${currentPage}">
		<table>
			<tr>
				<td><input type="text" name="multiplechoiceNo" value="${testOne.multiplechoiceNo}">번</td>
				<td><input type="text" name="accountId" value="${studentId }">
			</tr>
			<tr>
				<td>문제 :</td>
				
			</tr>
			<tr>
				<td>
					<textarea rows="3" cols="30">${testOne.multiplechoiceQuestion}</textarea>
				</td>
			</tr>
			<tr>
				<td>답 : </td>
				<td>
					<c:forEach var="i" begin="1" end="5">
						${i}<input type="radio" name="answerSelect" value="${i}">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>점수 : </td>
				<td><input type="text" name="score" value="${testOne.multiplechoiceScore}"></td>
			</tr>
		</table>
		<div>
			<c:forEach var="me" items="${testOne.multiplechoiceExampleList}">
				<div>(${me.multiplechoiceExampleId}) ${me.multiplechoiceExampleContent}</div>
			</c:forEach>
		</div>
		<br>
		<div>
			<button type="button" id="submitBtn">제출</button>
		</div>
	</form>
	
	<!-- script 코드 -->
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
		$(document).ready(function(){
			$('#submitBtn').click(function(){
				//답 체크를 하지 않았을 때
				if($("input[name='answerSelect']:not(:checked)").length==5){
					alert("답을 입력해주세요")
				}else{
					//alert($("input[name='answerSelect']:checked").val())
					$('#submitBtn').removeAttr("type")
					$('#submitBtn').attr("type","submit")
				}
			})
		})
    </script>
</body>
</html>