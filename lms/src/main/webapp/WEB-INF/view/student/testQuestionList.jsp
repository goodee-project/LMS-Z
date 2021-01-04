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
	
	<table border="1">
		<thead>
			<tr>
				<th>No</th>
				<th>문항번호</th>
				<th>점수</th>
				<th>작성일시</th>
				<th>최종수정일시</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${multiplechoice != null}">
				<c:forEach var="m" items="${multiplechoice}" varStatus="status">
						<tr>
							<td>${m.multiplechoiceNo}</td>
							<td>
								<c:if test="${m.multiplechoiceId == 0 }">
									제출완료
								</c:if>
								<c:if test="${m.multiplechoiceId != 0 }">
									<a href="${path}/student/testQuestionOne/${m.multiplechoiceNo}/${lectureNo }/1">평가 ${m.multiplechoiceId}번</a>
								</c:if>
							</td>
							<td>${m.multiplechoiceScore}</td>
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
	<br>
	<div>
		<!-- 문제 전부 제출했다면 채점점수 -->
		<c:if test="${allTestAnswerCk == true }">
			채점 점수 :
			<span>${testScore }</span>
		</c:if>
	</div>
	<br>
	<a href="${path }/student/testList/${lectureNo }">뒤로가기</a>
</body>
</html>