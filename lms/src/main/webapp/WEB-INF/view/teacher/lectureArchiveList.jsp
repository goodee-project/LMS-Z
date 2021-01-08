<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<a href="${path}/teacher/lectureArchiveAdd/${teacherId}">자료 추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>강의 번호</th>
				<th>과목</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${!empty lectureArchiveList}">
				<c:forEach var="la" items="${lectureArchiveList}">
					<tr>	
						<td><a href="${path}/teacher/lectureArchiveCountUp/${teacherId}/${la.lectureNo}/${la.lectureArchiveNo}">${la.lectureNo}(${la.lecture.lectureName})</a></td>
						<td>${la.subject.subjectName}</td>
						<td>${la.lectureArchiveWriter}</td>			
						<td>${la.lectureArchiveTitle}</td>
						<td>${la.lectureArchiveCreatedate}</td>
						<td>${la.lectureArchiveUpdatedate}</td>
						<td>${la.lectureArchiveCount}</td>
					</tr>	
				</c:forEach>
			</c:if>
			<c:if test="${empty lectureArchiveList}">
				<tr>
					<td colspan="8">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div>
		<c:if test="${listCurrentPage>1}">
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/1">처음으로</a>
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
			<c:if test="${i<=lastPage}">
				<a href="${path}/teacher/lectureArchiveList/${teacherId}/${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${listCurrentPage<lastPage}">
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage+1}">다음</a>
			<a href="${path}/teacher/lectureArchiveList/${teacherId}/${lastPage}">마지막으로</a>
		</c:if>
	</div>
	
	<!-- 검색 페이징 -->
	<c:if test="${lectureArchiveTitle != null}">
		<div>
			<c:if test="${searchCurrentPage>1}">
				<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/1">처음으로</a>
				<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchCurrentPage-1}">이전</a>
			</c:if>
			
			<c:forEach var="s" begin="${searchUnderFirstPage}" end="${searchUnderLastPage}">
				<c:if test="${s<=searchLastPage}">
					<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${s}">${s}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${searchCurrentPage<searchLastPage}">
				<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchCurrentPage+1}">다음</a>
				<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchLastPage}">마지막으로</a>
			</c:if>
		</div>
	</c:if>
	<input type="hidden" id="teacherId" value="${teacherId}">
	<input type="text" id="title" placeholder="제목으로 검색됩니다"> <a id="btn" href="">검색</a>
</body>
<script>
	$('#btn').on('click',function(){
		if($('#title').val()!=''){
			$('#btn').prop('href',"${path}/teacher/lectureArchiveSearch/"+$('#teacherId').val()+"/"+$('#title').val()+"/1");
		} 
		if($('#title').val()==''){
		$('#btn').prop('href',"${path}/teacher/lectureArchiveList/"+$('#teacherId').val()+"/1");
		}
	});		
</script>
</html>