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
	<a href="${path}/student/questionAdd/${studentId}">질문 등록하기</a>
	<table border="1">
		<thead>
			<tr>
				<th>질문 번호</th>
			 	<th>강의 번호</th>
			 	<th>작성자</th>
			 	<th>제목</th>
			 	<th>조회수</th>
			 	<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="q" items="${questionList}">
				<tr>
					<td>
						<a href="${path}/student/questionCountUp/${q.questionNo}">${q.questionNo}</a>
						<c:if test="${!empty q.questionPassword}">
							비밀글
						</c:if>
					</td>	
					<td>${q.lectureNo}: (${q.lecture.lectureName})</td>
					<td>${q.questionWriter}</td>
					<td>${q.questionTitle}</td>
					<td>${q.questionCount}</td>
					<td>${q.questionCreatedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 질문 검색전 리스트 페이징 -->
	<div>
		<c:if test="${listCurrentPage>1}">
			<a href="${path}/student/questionList/${studentId}/1">처음으로</a>
			<a href="${path}/student/questionList/${studentId}/${listCurrentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
			<c:if test="${i<=lastPage}">
				<a href="${path}/student/questionList/${studentId}/${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${listCurrentPage<lastPage}">
			<a href="${path}/student/questionList/${studentId}/${listCurrentPage+1}">다음</a>
			<a href="${path}/student/questionList/${studentId}/${lastPage}">마지막으로</a>
		</c:if>
	</div>
	<!-- 제목 검색에 대한 페이징 -->
	<c:if test="${questionTitle != null}">	
		<div>
			<c:if test="${titleCurrentPage>1}">
				<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/1">처음으로</a>
				<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${titleCurrentPage-1}">이전</a>
			</c:if>
			
			<c:forEach var="t" begin="${titleUnderFirstPage}" end="${titleUnderLastPage}">
				<c:if test="${t<=lastTitlePage}">
					<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${t}">${t}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${titleCurrentPage<lastTitlePage}">
				<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${titleCurrentPage+1}">다음</a>
				<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${lastTitlePage}">마지막으로</a>
			</c:if>
		</div>
	</c:if>	
	
	<!-- 작성자 검색에 대한 페이징 -->
		<c:if test="${questionWriter != null}">	
			<div>
				<c:if test="${writerCurrentPage>1}">
					<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/1">처음으로</a>
					<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${writerCurrentPage-1}">이전</a>
				</c:if>
			
				<c:forEach var="w" begin="${writerUnderFirstPage}" end="${writerUnderLastPage}">
					<c:if test="${w<=lastWriterPage}">
						<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${w}">${w}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${writerCurrentPage<lastWriterPage}">
					<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${writerCurrentPage+1}">다음</a>
					<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${lastWriterPage}">마지막으로</a>
				</c:if>
			
			</div>
		</c:if>
	<select id="sub">
		<option value="제목">제목</option>
		<option value="작성자">작성자</option>
	</select>
	<input type="hidden" id="studentId" value="${studentId}">
	<input type="text" id="question"> <a id="btn" href="">검색</a>
</body>
<script>
	$('#btn').on('click',function(){
		if($('#sub').val()=='제목' && $('#question').val()!=''){
			$('#btn').prop('href',"${path}/student/questionTitleSearch/"+$('#studentId').val()+"/"+$('#question').val()+"/1");
		} else if($('#sub').val()=='작성자' && $('#question').val()!=''){
			$('#btn').prop('href',"${path}/student/questionWriterSearch/"+$('#studentId').val()+"/"+$('#question').val()+"/1");
			} 
		if($('#question').val()==''){
			$('#btn').prop('href',"${path}/student/questionList/"+$('#studentId').val()+"/1");
		}
	});
</script>
</html>