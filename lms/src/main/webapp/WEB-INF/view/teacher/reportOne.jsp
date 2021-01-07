<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/assets/images/favicon.png">
<title>reportOne</title>
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
    
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>



<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">과제 상세보기</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href=""></a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

		<div class="container-fluid">
		<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-9 col-md-9">
                        <div class="card" id="cardStyle">
                            <div class="card-body">

		<table id="lmsNoticeTable" class="table table">
				<tr>
					<th>report_no</th>
					<td>${reportOne.reportNo}</td>
				</tr>
				<tr>
					<th>lecture_no</th>
					<td>${reportOne.lectureNo}</td>
				</tr>
				<tr>
					<th>report_title</th>
					<td>${reportOne.reportTitle}</td>
				</tr>
				<tr>
					<th>report_content</th>
					<td>${reportOne.reportContent}</td>
				</tr>
				<tr>
					<th>report_startdate</th>
					<td>${reportOne.reportStartdate}</td>
				</tr>
				<tr>
					<th>report_enddate</th>
					<td>${reportOne.reportEnddate}</td>
				</tr>
		</table>
		<a class="btn btn-info" style="border-radius: 4px;" href="${path}/teacher/modifyReport/${reportOne.reportNo}">수정하기</a>
		<br><br><br>
		<h3>과제제출</h3>
		<table id="lmsNoticeTable" class="table table">
			<thead>
				<tr>
					<th>report_submit_no</th>
					<th>report_submit_writer</th>
					<th>report_submit_title</th>
					<th>report_submit_content</th>
					<th>report_submit_content</th>
				</tr>
			</thead>
			<c:forEach var="rs" items="${reportOne.reportSubmitList}">
				<tr>
					<td>${rs.reportSubmitNo}</td>
					<td>${rs.reportSubmitWriter}</td>
					<td>${rs.reportSubmitTitle}</td>
					<td>${rs.reportSubmitContent}</td>
					<td>${rs.reportSubmitPoint}점</td>
				</tr>
			</c:forEach>
		</table>
		<a class="btn btn-outline-danger" style="border-radius: 4px;" href="${path}/teacher/removeReport/${reportOne.lectureNo}/${reportOne.reportNo}">삭제</a>
		<a class="btn btn-outline-secondary text-dark" href="${path}/teacher/reportList/${reportOne.lectureNo}/1">뒤로가기</a>
		
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