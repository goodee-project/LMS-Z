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
		<c:if test="${OverdueListCurrentPage>1}">
			<a href="${path}/student/reportOverdueList/${studentId}/1">처음으로</a>
			<a href="${path}/student/reportOverdueList/${studentId}/${OverdueListCurrentPage-1}">이전</a>
		</c:if>
		<c:forEach var="o" begin="${overdueListUnderFirstPage}" end="${overdueListUnderLastPage}">
			<c:if test="${o<=lastOverduePage}">	
				<span>
					<a href="${path}/student/reportOverdueList/${studentId}/${o}">${o}</a>
				</span>
			</c:if>	
		</c:forEach>
		<c:if test="${OverdueListCurrentPage<lastOverduePage}">
			<a href="${path}/student/reportOverdueList/${studentId}/${OverdueListCurrentPage+1}">다음</a>
			<a href="${path}/student/reportOverdueList/${studentId}/${lastOverduePage}">마지막으로</a>
		</c:if>
	</div>
	<c:if test="${reportTitle != null}">
		<div>
			<c:if test="${OverdueSearchCurrentPage>1}">
				<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/1">처음으로</a>
				<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${OverdueSearchCurrentPage-1}">이전</a>
			</c:if>
			<c:forEach var="s" begin="${searchUnderFirstPage}" end="${searchUnderLastPage}">
				<c:if test="${s<=lastOverdueSearchPage}">	
					<span>
						<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${s}">${s}</a>
					</span>
				</c:if>	
			</c:forEach>
			<c:if test="${OverdueSearchCurrentPage<lastOverdueSearchPage}">
				<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${OverdueSearchCurrentPage+1}">다음</a>
				<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${lastOverdueSearchPage}">마지막으로</a>
			</c:if>
		</div>
	</c:if>
	
	<input type="hidden" id="studentId" value="${studentId}">
	<input type="text" id="reportTitle" placeholder="과제명을 입력해주세요"> <a id="btn" href="">검색</a>
</body>
<script>
	$('#btn').on('click',function(){
		if($('#reportTitle').val()!=''){
			$('#btn').prop('href',"${path}/student/reportOverdueSearch/"+$('#studentId').val()+"/"+$('#reportTitle').val()+"/1");
		}
		if($('#reportTitle').val()==''){
			$('#btn').prop('href',"${path}/student/reportOverdueList/"+$('#studentId').val()+"/1");
		}
	});
</script>
</html>