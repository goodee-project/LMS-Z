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
	<h1>강사/학생 승인</h1>
	<table border="1">	
		<thead>
			<tr>
				<th>student_id</th>
				<th>student_email</th>
				<th>student_name</th>
				<th>student_phone</th>
				<th>student_gender</th>
				<th>student_birth</th>
				<th>student_address_main</th>
				<th>student_address_sub</th>
				<th>account_level</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="s" items="${studentList }">
				<tr>
					<td>${s.studentId }</td>
					<td>${s.studentEmail }</td>
					<td>${s.studentName }</td>
					<td>${s.studentPhone }</td>
					<td>${s.studentGender }</td>
					<td>${s.studentBirth }</td>
					<td>${s.studentAddressMain }</td>
					<td>${s.studentAddressSub }</td>
					<td>${s.account.accountLevel }</td>
					<td><a href="${path}/manager/insertStudentQueue/${s.studentId}/활성화/${managerId}/${currentPageS}/${currentPageT}">승인</a></td>
					<td><a href="${path}/manager/deleteStudentQueue/${s.studentId}/거절/${currentPageS}/${currentPageT}">거절</a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<!-- 페이징 -->
       <br>
       	<div>
       		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
       		<c:if test="${startPageS!=1 && lastPageS!=1}">
        		<span>
        			<a href="${path}/manager/memberQueue/${startPageS-10}/${currentPageT}">이전&nbsp;&nbsp;</a>
        		</span>
       		</c:if>
       		<!-- lastPage가 10개를 채울수 없을 때 -->
       		<c:if test="${startPageS+9 > lastPageS }">
         	<c:forEach var="i" begin="${startPageS }" end="${lastPageS}">
         		<!-- 현재 페이지일 경우 -->
         		<c:if test="${currentPageS == i }">
	          		<span>
	          			<a>${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         		<!-- 현재 페이지가 아닐 경우 -->
         		<c:if test="${currentPageS != i }">
	          		<span>
	          			<a href="${path}/manager/memberQueue/${i}/${currentPageT}">${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         	</c:forEach>
        	</c:if>
        	<c:if test="${startPageS+9<lastPageS }">
        		<c:forEach var="i" begin="${startPageS }" end="${startPageS+9}">
         		<!-- 현재 페이지일 경우 -->
         		<c:if test="${currentPageS == i }">
	          		<span>
	          			<a>${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         		<!-- 현재 페이지가 아닐 경우 -->
         		<c:if test="${currentPageS != i }">
	          		<span>
	          			<a href="${path}/manager/memberQueue/${i}/${currentPageT}">${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         	</c:forEach>
        	</c:if>
        	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
        	<c:if test="${startPageS+9<lastPageS && lastPageS != startPageS}">
	         	<span>
	         		<a href="${path}/manager/memberQueue/${startPageS+10}/${currentPageT}">다음&nbsp;&nbsp;</a>
	         	</span>
        	</c:if>
       	</div>
		<table border="1">
		<thead>
			<tr>
				<th>teacher_id</th>
				<th>teacher_email</th>
				<th>teacher_name</th>
				<th>teacher_phone</th>
				<th>teacher_gender</th>
				<th>teacher_birth</th>
				<th>teacher_address_main</th>
				<th>teacher_address_sub</th>
				<th>account_level</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="t" items="${teacherList }">
				<tr>
					<td>${t.teacherId }</td>
					<td>${t.teacherEmail }</td>
					<td>${t.teacherName }</td>
					<td>${t.teacherPhone }</td>
					<td>${t.teacherGender }</td>
					<td>${t.teacherBirth }</td>
					<td>${t.teacherAddressMain }</td>
					<td>${t.teacherAddressSub }</td>
					<td>${t.account.accountLevel }</td>
					<td><a href="${path}/manager/insertTeacherQueue/${t.teacherId}/활성화/${managerId}/${currentPageS}/${currentPageT}">승인</a></td>
					<td><a href="${path}/manager/deleteTeacherQueue/${t.teacherId}/거절/${currentPageS}/${currentPageT}">거절</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
   <br>
       	<div>
       		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
       		<c:if test="${startPageT!=1 && lastPageT!=1}">
        		<span>
        			<a href="${path}/manager/memberQueue/${currentPageS}/${startPageT-10}">이전&nbsp;&nbsp;</a>
        		</span>
       		</c:if>
       		<!-- lastPage가 10개를 채울수 없을 때 -->
       		<c:if test="${startPageT+9 > lastPageT }">
         	<c:forEach var="i" begin="${startPageT }" end="${lastPageT}">
         		<!-- 현재 페이지일 경우 -->
         		<c:if test="${currentPageT == i }">
	          		<span>
	          			<a>${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         		<!-- 현재 페이지가 아닐 경우 -->
         		<c:if test="${currentPageT != i }">
	          		<span>
	          			<a href="${path}/manager/memberQueue/${currentPageS}/${i}">${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         	</c:forEach>
        	</c:if>
        	<c:if test="${startPageT+9<lastPageT }">
        		<c:forEach var="i" begin="${startPageT }" end="${startPageT+9}">
         		<!-- 현재 페이지일 경우 -->
         		<c:if test="${currentPageT == i }">
	          		<span>
	          			<a>${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         		<!-- 현재 페이지가 아닐 경우 -->
         		<c:if test="${currentPageT != i }">
	          		<span>
	          			<a href="${path}/manager/memberQueue/${currentPageS}/${i}">${i}&nbsp;&nbsp;</a>
	          		</span>
         		</c:if>
         	</c:forEach>
        	</c:if>
        	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
        	<c:if test="${startPageT+9<lastPageT && lastPageT != startPageT}">
	         	<span>
	         		<a href="${path}/manager/memberQueue/${currentPageS}/${startPageT+10}">다음&nbsp;&nbsp;</a>
	         	</span>
        	</c:if>
       	</div>
</body>
</html>