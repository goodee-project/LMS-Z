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
	<table border="1">
		<thead>
			<tr>
				<th>lectureArchiveNo</th>
				<th>lecture_no</th>
				<th>account_id</th>
				<th>lecture_archive_writer</th>
				<th>lecture_archive_title</th>
				<th>lecture_archive_content</th>
				<th>lecture_archive_createdate</th>
				<th>lecture_archive_count</th>
			</tr>
		</thead>	
		<tbody>
			<c:if test="${!empty lectureArchive}">
				<c:forEach var="la" items="${lectureArchive}">
					<tr>
						<td><a href="${path}/student/lectureArchiveCountUp/${la.lectureArchiveNo}">${la.lectureArchiveNo}</a></td>
						<td>${la.lectureNo}</td>
						<td>${la.accountId}</td>
						<td>${la.lectureArchiveWriter}</td>
						<td>${la.lectureArchiveTitle}</td>
						<td>${la.lectureArchiveContent}</td>
						<td>${la.lectureArchiveCreatedate}</td>
						<td>${la.lectureArchiveCount}</td>
					</tr>
				</c:forEach>
			</c:if>	
			<c:if test="${empty lectureArchive}">
					<tr>
						<td colspan="8">등록된 게시물이 없습니다.</td>
					</tr>
			</c:if>
		</tbody>
	</table>
	<div>
		<c:if test="${listCurrentPage>1}">
			<a href="${path}/student/lectureArchiveList/${studentId}/1">처음으로</a>
			<a href="${path}/student/lectureArchiveList/${studentId}/${listCurrentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
			<c:if test="${i<=lastPage}">
				<a href="${path}/student/lectureArchiveList/${studentId}/${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${listCurrentPage<lastPage}">
			<a href="${path}/student/lectureArchiveList/${studentId}/${listCurrentPage+1}">다음</a>
			<a href="${path}/student/lectureArchiveList/${studentId}/${lastPage}">마지막으로</a>
		</c:if>
	</div>
	
	<!-- 검색 페이징 -->
	<c:if test="${lectureArchiveTitle != null}">
		<div>
			<c:if test="${searchCurrentPage>1}">
				<a href="${path}/student/lectureArchiveSearch/${studentId}/${lectureArchiveTitle}/1">처음으로</a>
				<a href="${path}/student/lectureArchiveSearch/${studentId}/${lectureArchiveTitle}/${searchCurrentPage-1}">이전</a>
			</c:if>
			
			<c:forEach var="s" begin="${searchUnderFirstPage}" end="${searchUnderLastPage}">
				<c:if test="${s<=searchLastPage}">
					<a href="${path}/student/lectureArchiveSearch/${studentId}/${lectureArchiveTitle}/${s}">${s}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${searchCurrentPage<searchLastPage}">
				<a href="${path}/student/lectureArchiveSearch/${studentId}/${lectureArchiveTitle}/${searchCurrentPage+1}">다음</a>
				<a href="${path}/student/lectureArchiveSearch/${studentId}/${lectureArchiveTitle}/${searchLastPage}">마지막으로</a>
			</c:if>
		</div>
	</c:if>
	<input type="hidden" id="studentId" value="${studentId}">
	<input type="text" id="title" placeholder="제목으로 검색됩니다"> <a id="btn" href="">검색</a>
</body>
<script>
	$('#btn').on('click',function(){
		if($('#title').val()!=''){
			$('#btn').prop('href',"${path}/student/lectureArchiveSearch/"+$('#studentId').val()+"/"+$('#title').val()+"/1");
		} 
		if($('#title').val()==''){
		$('#btn').prop('href',"${path}/student/lectureArchiveList/"+$('#studentId').val()+"/1");
		}
	});		
</script>
</html>