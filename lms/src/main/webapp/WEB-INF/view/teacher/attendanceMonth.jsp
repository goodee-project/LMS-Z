<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceMonth</title>
</head>
<body>
	<h1>출석부</h1>
	<div>
	<table border="1">
		<thead>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>
		<tbody>
			<tr>
					<c:forEach var="i" begin="1" end="${lastDay + (firstDay - 1)}" step="1">
						<c:if test="${i - (firstDay - 1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						
						<c:if test="${i - (firstDay - 1) > 0}">
							<td>
								<c:if test="${i % 7 == 1}">
									<div>
										<a href="${path}/teacher/attendanceList/${lectureNo}/target/${currentYear}/${currentMonth}/${i - (firstDay - 1)}">${i - (firstDay - 1)}</a>
									</div>
								</c:if>
                                
								<c:if test="${i % 7 == 0}">
									<div>
										<a href="${path}/teacher/attendanceList/${lectureNo}/target/${currentYear}/${currentMonth}/${i - (firstDay - 1)}">${i - (firstDay - 1)}</a>
									</div>
								</c:if>
                                
								<c:if test="${i % 7 != 1 && i % 7 != 0}">
									<div>
										<a href="${path}/teacher/attendanceList/${lectureNo}/target/${currentYear}/${currentMonth}/${i - (firstDay - 1)}">${i - (firstDay - 1)}</a>
									</div>
								</c:if>
							</td>
						</c:if>
                          
						<c:if test="${i != (lastDay + (firstDay - 1))}">
							<c:if test="${i % 7 == 0}">
								</tr><tr>
							</c:if>
						</c:if>
					</c:forEach>
                       
                       <c:if test="${(lastDay + (firstDay - 1)) % 7 != 0}">   
						<c:forEach begin="1" end="${7 - ((lastDay + (firstDay - 1)) % 7)}" step="1">   
							<td>&nbsp;</td>   
						</c:forEach>   
					</c:if>
				</tr>
	</tbody>
	</table>
	<a href="${path}/teacher/lectureOne/${lectureNo}">뒤로가기</a>
</body>
</html>