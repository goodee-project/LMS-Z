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
					<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">과제 게시판</h2>
				</div>
			</div>
		</div>	
		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<div class="table-responsive">
								<div class="d-flex align-items-center">
									<div><a type="button" class="btn btn-outline-secondary" href="${path}/student/reportOverdueList/${studentId}/1">마감된 과제</a></div>
								</div>	
	
	<table id="reportTable" class="table table" style="margin-top: 20px;">
		<thead>
			<tr class="border-0">
				<th class="border-0 font-14 font-weight-medium text-muted px-2">강의</th>
				<th class="border-0 font-14 font-weight-medium text-muted px-2">과제명</th>
				<th class="border-0 font-14 font-weight-medium text-muted px-2">과제 남은 마감일</th>
				<th class="border-0 font-14 font-weight-medium text-muted px-2">과제 제출현황</th>
			</tr>
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
					
					<c:if test="${r.dateCha > 0}">
						
						<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
							<div class="d-flex no-block align-items-center">
								D-${r.dateCha}
							</div>
						</td>
					</c:if>	
					
					<c:if test="${r.dateCha == 0}">
						<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
							<div class="d-flex no-block align-items-center">		
								D-day
							</div>					
						</td>
					</c:if>
					
					<c:if test="${r.dateCha < 0}">
						<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
							<div class="d-flex no-block align-items-center">
								마감된 과제입니다.
							</div>
						</td>
					</c:if>
					
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
		<c:if test="${listCurrentPage>1}">
			<a href="${path}/student/reportList/${studentId}/1">처음으로</a>
			<a href="${path}/student/reportList/${studentId}/${listCurrentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
			<c:if test="${i<=lastPage && listCurrentPage == i}">
				
					<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/reportList/${studentId}/${i}">${i}</a>
				
			</c:if>
			<c:if test="${i<=lastPage && listCurrentPage != i}">
				
					<a class="font-18" href="${path}/student/reportList/${studentId}/${i}">${i}</a>
				
			</c:if>
		</c:forEach>
		
		<c:if test="${listCurrentPage<lastPage}">
			<a href="${path}/student/reportList/${studentId}/${listCurrentPage+1}">다음</a>
			<a href="${path}/student/reportList/${studentId}/${lastPage}">마지막으로</a>
		</c:if>
	</div>
		</div></div></div></div></div></div>
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
</html>