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
				<div class="col-7 align-self-center">
					<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">제출 마감 과제</h2>
				</div>
			</div>
		</div>	
		<br>
		<div class="container-fluid">
			&emsp;<span><a type="button" class="btn btn-outline-secondary mb-2" href="${path}/student/reportOverdueList/${studentId}/1">전체</a></span>
			<c:forEach var="l" items="${lectureList}">
					&emsp;<span><a type="button" class="btn btn-outline-secondary mb-2" href="${path}/student/reportOverdueLectureList/${studentId}/${l.lectureNo}/1">${l.lectureName}</a></span>
				</c:forEach>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<div class="table-responsive">
								<div class="d-flex align-items-center">
									<div><a type="button" class="btn btn-outline-secondary" href="${path}/student/reportList/${studentId}/1">진행중인 과제</a></div>
								</div>
								<table id="reportOverdueTable" class="table table" style="margin-top: 20px;">
									<thead>
										<c:if test="${!empty reportList}">
											<tr class="border-0">
												<th class="border-0 font-14 font-weight-medium text-muted px-2">강의</th>
												<th class="border-0 font-14 font-weight-medium text-muted px-2">과제명</th>
												<th class="border-0 font-14 font-weight-medium text-muted px-2">과제 제출시작일</th>
												<th class="border-0 font-14 font-weight-medium text-muted px-2">과제 제출마감일</th>
												<th class="border-0 font-14 font-weight-medium text-muted px-2">과제 제출현황</th>
											</tr>
										</c:if>	
										<c:if test="${empty reportList}">
										<tr class="border-0">	
												<th class="border-0 font-14 font-weight-medium text-muted px-2">
													<h5 class="text-dark mb-0 font-16 font-weight-medium">아직 마감된 과제가 없습니다.</h5>
												</th>
											</tr>	
										</c:if>
									</thead>
									<tbody>
										<c:forEach var="r" items="${reportList}">
											<tr>
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														${r.lectureNo}: (${r.lecture.lectureName})
													</div>
												</td>
												
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														${r.reportTitle}
													</div>
												</td>
												
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														${r.reportStartdate}
													</div>
												</td>
												
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														${r.reportEnddate}
													</div>
												</td>	
											<c:if test="${r.reportSubmit.reportSubmitContent!=null}">	
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														<a type="button" class="btn btn-outline-info" href="${path}/student/reportSubmitOne/${r.reportNo}/${studentId}">제출완료</a>
													</div>
												</td>		
											</c:if>
											
											<c:if test="${r.reportSubmit.reportSubmitContent==null}">	
												<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
													<div class="d-flex no-block align-items-center">
														<a type="button" class="btn btn-outline-danger" href="${path}/student/reportSubmitOne/${r.reportNo}/${studentId}">미제출</a>
													</div>
												</td>
											</c:if>		
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="paging" style="text-align: center; padding: 7px;">
									<div>
										<c:if test="${OverdueListCurrentPage>1}">
											<a href="${path}/student/reportOverdueList/${studentId}/1">처음으로</a>
											<a href="${path}/student/reportOverdueList/${studentId}/${OverdueListCurrentPage-1}">이전</a>
										</c:if>
										<c:forEach var="o" begin="${overdueListUnderFirstPage}" end="${overdueListUnderLastPage}">
											<c:if test="${o<=lastOverduePage && OverdueListCurrentPage == o}">	
												<span>
													<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/reportOverdueList/${studentId}/${o}">${o}</a>
												</span>
											</c:if>
											<c:if test="${o<=lastOverduePage && OverdueListCurrentPage != o}">	
												<span>
													<a class="font-18" href="${path}/student/reportOverdueList/${studentId}/${o}">${o}</a>
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
												<c:if test="${s<=lastOverdueSearchPage && OverdueSearchCurrentPage == s}">	
													<span>
														<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${s}">${s}</a>
													</span>
												</c:if>	
												<c:if test="${s<=lastOverdueSearchPage && OverdueSearchCurrentPage != s}">	
													<span>
														<a class="font-18" href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${s}">${s}</a>
													</span>
												</c:if>	
											</c:forEach>
											<c:if test="${OverdueSearchCurrentPage<lastOverdueSearchPage}">
												<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${OverdueSearchCurrentPage+1}">다음</a>
												<a href="${path}/student/reportOverdueSearch/${studentId}/${reportTitle}/${lastOverdueSearchPage}">마지막으로</a>
											</c:if>
										</div>
									</c:if>
									<c:if test="${lectureNo != null}">
										<div>
											<c:if test="${lectureOverdueCurrentPage>1}">
												<a href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/1">처음으로</a>
												<a href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/${lectureOverdueCurrentPage-1}">이전</a>
											</c:if>
											
											<c:forEach var="l" begin="${lectureOverdueUnderFirstPage}" end="${lectureOverdueUnderLastPage}">
												<c:if test="${l<=lastLectureOverduePage && lectureOverdueCurrentPage == l}">
													<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/${l}">${l}</a>
												</c:if>
												<c:if test="${l<=lastLectureOverduePage && lectureOverdueCurrentPage != l}">
													<a class="font-18" href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/${l}">${l}</a>
												</c:if>
											</c:forEach>
											
											<c:if test="${lectureOverdueCurrentPage<lastLectureOverduePage}">
												<a href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/${lectureOverdueCurrentPage+1}">다음</a>
												<a href="${path}/student/reportOverdueLectureList/${studentId}/${lectureNo}/${lastLectureOverduePage}">마지막으로</a>
											</c:if>
										</div>
									</c:if>
								</div>		
								<input type="hidden" id="studentId" value="${studentId}">
								<div class="list-inline text-center mt-4 mb-0">
									<input type="text" id="reportTitle" placeholder="과제명을 입력해주세요"> <a type="button" class="btn btn-outline-secondary btn-default btn-sm" id="btn" href="">검색</a>
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
		if($('#reportTitle').val()!=''){
			$('#btn').prop('href',"${path}/student/reportOverdueSearch/"+$('#studentId').val()+"/"+$('#reportTitle').val()+"/1");
		}
		if($('#reportTitle').val()==''){
			$('#btn').prop('href',"${path}/student/reportOverdueList/"+$('#studentId').val()+"/1");
		}
	});
</script>
</html>