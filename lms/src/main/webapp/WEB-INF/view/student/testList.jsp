<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위의 사이트 아이콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/assets/images/favicon.png">
    <title>lms</title>
    <!-- css -->
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
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center"></div>
					<div class="col-5 align-self-center text-right">
						<div class="col-12 align-self-center"></div>
					</div>
				</div>
			</div>
			<br>
			<div class="container-fluid">
			<!-- 테이블 -->
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<div class="table-responsive">
								<table id="lmsTable" class="table table" style="margin-top: 20px;text-align: center;">
									<thead>
										<tr>
											<th class="text-dark">시험번호</th>
											<th class="text-dark">시험내용</th>
											<th class="text-dark">시작시간</th>
											<th class="text-dark">종료시간</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${test != null}">
											<tr>
												<td>
													<h5>
														<span>${test.testNo}</span>
													</h5>
												</td>
												<td>
													<a class="btn btn-outline-light bg-light text-secondary btn-block" href="${path}/student/testQuestionList/${test.lectureNo}/${studentId }/1">${test.testContent}</a>
												</td>
												<td>
													<h5>
														${test.testStartdate}
													</h5>
												</td>
												<td>
													<h5>${test.testEnddate}</h5>
												</td>
											</tr>
										</c:if>
										<c:if test="${test == null}">
											<tr>
												<td colspan="4">시험이 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<a class="btn btn-outline-secondary" href="${path }/student/myLectureListOne/${studentId }/${lectureNo }/${currentPage}">뒤로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- script 코드 -->
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
</body>
</html>