<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 위의 사이트 아이콘 -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/assets/images/favicon.png">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
<link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
<link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
<link href="${path}/dist/css/style.min.css" rel="stylesheet">
<link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
	data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

	<jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
	<jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
		
	<div class="page-wrapper">
		<div class="page-breadcrumb">
			<div class="row">
				<div  class="col-7 align-self-center">
					
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">질문 게시판</h2>
					
						
					
				</div>
			</div>
		</div>	
		<br>
		<div class="container-fluid">
			&emsp;<span><a type="button" class="btn btn-outline-secondary mb-2" href="${path}/student/questionList/${studentId}/1">전체</a></span>
			<c:if test="${!empty lectureList}">
				<c:forEach var="l" items="${lectureList}">
					&emsp;<span><a type="button" class="btn btn-outline-secondary mb-2" href="${path}/student/questionLectureSearch/${studentId}/${l.lectureNo}/1">${l.lectureName}</a></span>
				</c:forEach>
			</c:if>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<div class="table-responsive">
							<div class="d-flex align-items-center">
								<div><a type="button" class="btn btn-outline-secondary" href="${path}/student/questionAdd/${studentId}">질문 등록하기</a></div>
							</div>
								<table id="questionTable" class="table table" style="margin-top: 20px;">
									<thead>
										<c:if test="${!empty questionList}">
											<tr class="border-0">
											 	<th class="border-0 font-14 font-weight-medium text-muted px-2">강의</th>
											 	<th class="border-0 font-14 font-weight-medium text-muted px-2">작성자</th>
											 	<th class="border-0 font-14 font-weight-medium text-muted px-2">제목</th>
											 	<th class="border-0 font-14 font-weight-medium text-muted px-2">작성일</th>
											 	<th class="border-0 font-14 font-weight-medium text-muted px-2">조회수</th>
											</tr>
										</c:if>
										<c:if test="${empty questionList}">
											<tr class="border-0">	
												<th class="border-0 font-14 font-weight-medium text-muted px-2">
													<h5 class="text-dark mb-0 font-16 font-weight-medium">아직 질문이 작성되지 않았습니다</h5>
												</th>
											</tr>	
										</c:if>
									</thead>
									
									<tbody>
									<c:forEach var="q" items="${questionList}" varStatus="status">
										<tr>
											<td class="border-top-0 text-muted px-2 py-4 font-14">
												<h1 class="text-dark mb-0 font-16 font-weight-medium">${q.lectureNo}: (${q.lecture.lectureName})</h1>
												<c:if test="${!empty q.questionPassword}">
													비밀글
												</c:if>
											</td>	
											<td class="font-weight-medium text-dark border-top-0 px-2 py-4">
												<div class="d-flex no-block align-items-center">
													<h5 class="text-dark mb-0 font-16 font-weight-medium">${q.questionWriter}</h5>
												</div>	
											</td>
											<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
												<div class="d-flex no-block align-self-center">
													<h5 class="text-dark mb-0 font-16 font-weight-medium"><a class="btn btn-outline-light bg-light text-secondary btn-block" href="${path}/student/questionCountUp/${q.questionNo}">${q.questionTitle}</a></h5>
												</div>
											</td>	
											<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
												<div class="d-flex no-block align-self-center">
													<h5 class="text-dark mb-0 font-16 font-weight-medium">${q.questionCreatedate}</h5>
												</div>	
											</td>
											<td class="font-weight-medium text-dark border-top-0 text-center px-2 py-4">
												<div class="d-flex no-block align-items-center">
													<h5 class="text-dark mb-0 font-16 font-weight-medium">${q.questionCount}</h5>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paging" style="text-align: center; padding: 7px;">
							<!-- 질문 검색전 리스트 페이징 -->
								<div>
									<c:if test="${listCurrentPage>1}">
										<a href="${path}/student/questionList/${studentId}/1">처음으로</a>
										<a href="${path}/student/questionList/${studentId}/${listCurrentPage-1}">이전</a>
									</c:if>
									
									<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
										<c:if test="${i<=lastPage && listCurrentPage == i}">
											<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/questionList/${studentId}/${i}">${i}</a>
										</c:if>
										<c:if test="${i<=lastPage && listCurrentPage != i}">
											<a class="font-18" href="${path}/student/questionList/${studentId}/${i}">${i}</a>
										</c:if>
									</c:forEach>
									
									<c:if test="${listCurrentPage<lastPage}">
										<a href="${path}/student/questionList/${studentId}/${listCurrentPage+1}">다음</a>
										<a href="${path}/student/questionList/${studentId}/${lastPage}">마지막으로</a>
									</c:if>
								</div>
							
								<!-- 강의 검색 리스트 페이징 -->
								<c:if test="${lectureNo != null}">
									<div>
										<c:if test="${lectureCurrentPage>1}">
											<a href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/1">처음으로</a>
											<a href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/${lectureCurrentPage-1}">이전</a>
										</c:if>
										
										<c:forEach var="l" begin="${lectureUnderFirstPage}" end="${lectureUnderLastPage}">
											<c:if test="${l<=lastLecturePage && lectureCurrentPage == l}">
												<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/${l}">${l}</a>
											</c:if>
											<c:if test="${l<=lastLecturePage && lectureCurrentPage != l}">
												<a class="font-18" href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/${l}">${l}</a>
											</c:if>
										</c:forEach>
										
										<c:if test="${lectureCurrentPage<lastLecturePage}">
											<a href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/${lectureCurrentPage+1}">다음</a>
											<a href="${path}/student/questionLectureSearch/${studentId}/${lectureNo}/${lastLecturePage}">마지막으로</a>
										</c:if>
									</div>
								</c:if>
								
								<!-- 제목 검색에 대한 페이징 -->
								<c:if test="${questionTitle != null}">	
									<div>
										<c:if test="${titleCurrentPage>1}">
											<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/1">처음으로</a>
											<a href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${titleCurrentPage-1}">이전</a>
										</c:if>
										
										<c:forEach var="t" begin="${titleUnderFirstPage}" end="${titleUnderLastPage}">
											<c:if test="${t<=lastTitlePage && titleCurrentPage == t}">
												<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${t}">${t}</a>
											</c:if>
											<c:if test="${t<=lastTitlePage && titleCurrentPage != t}">
												<a class="font-18" href="${path}/student/questionTitleSearch/${studentId}/${questionTitle}/${t}">${t}</a>
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
										<div class="btn-group me-2" role="group" aria-label="First group">
											<c:forEach var="w" begin="${writerUnderFirstPage}" end="${writerUnderLastPage}">
												<c:if test="${w<=lastWriterPage && writerCurrentPage == w}">
													<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${w}">${w}</a>
												</c:if>
												<c:if test="${w<=lastWriterPage && writerCurrentPage != w}">
													<a class="font-18" href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${w}">${w}</a>
												</c:if>
											</c:forEach>
										</div>
										<c:if test="${writerCurrentPage<lastWriterPage}">
											<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${writerCurrentPage+1}">다음</a>
											<a href="${path}/student/questionWriterSearch/${studentId}/${questionWriter}/${lastWriterPage}">마지막으로</a>
										</c:if>
									</div>
								</c:if>
							</div>	
							<input type="hidden" id="studentId" value="${studentId}">
							<div class="list-inline text-center mt-4 mb-0">
								<select id="sub">
									<option value="제목">제목</option>
									<option value="작성자">작성자</option>
								</select>
								<input type="text" id="question"> 
								<a type="button" class="btn btn-outline-secondary btn-default btn-sm" id="btn" href="">검색</a>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>
</div>	
</body>
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