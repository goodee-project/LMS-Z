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
	<a href="${path}/student/reportOverdueList/${studentId}/1">마감된 과제</a>
	<table border="1">
		<thead>
			<tr>
				<th>강의</th>
				<th>과제명</th>
				<th>과제 제출시작일</th>
				<th>과제 제출마감일</th>
				<th>과제 남은 마감일</th>
				<th>과제 제출현황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${reportList}">
				<tr>
					<td>${r.lectureNo}: (${r.lecture.lectureName})</td>
					<td>${r.reportTitle}</td>
					<td>${r.reportStartdate}</td>
					<td>${r.reportEnddate}</td>	
				<c:if test="${r.dateCha >= 0}">
					<td>${r.dateCha}</td>
				</c:if>	
				<c:if test="${r.dateCha < 0}">
					<td>마감된 과제입니다.</td>
				</c:if>
				<c:if test="${r.reportSubmit.reportSubmitContent!=null}">	
					<td>
						<a href="${path}/student/reportSubmitOne/${r.reportNo}/${studentId}">제출완료</a>
					</td>
				</c:if>
				
				<c:if test="${r.reportSubmit.reportSubmitContent==null}">	
					<td>
						<a href="${path}/student/reportSubmitOne/${r.reportNo}/${studentId}">미제출</a>
					</td>
				</c:if>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:forEach var="i" begin="1" end="${lastPage}">
			<span>
				<a href="${path}/student/reportList/${studentId}/${i}">${i}</a>
			</span>
		</c:forEach>
		<c:forEach var="o" begin="1" end="${lastOverduePage}">
			<span>
				<a href="${path}/student/reportOverdueList/${studentId}/${o}">${o}</a>
			</span>
		</c:forEach>
	</div>
</body>
</html>