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
                    <div class="col-7 align-self-center">
                       <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">${myLectureListOne.lecture.lectureName }</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item">
                                    	<a href="">${myLectureListOne.teacher.teacherName }(${myLectureListOne.lecture.accountId})</a>
                                    	<span class="text-center mt-4 mb-0"> ${myLectureListOne.lecture.lectureCreatedate}</span>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <br>
                    </div>
                    <div class="col-5 align-self-center text-right">
                    </div>
		       </div>
				<!-- 강의 정보  -->
                <div class="row">
                    <div class="col-md-5 col-lg-9">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                            	<h4 class="card-title">
                            		● 나의 출결 및 진도 현황 
                            		<span class="font-14 font-weight-medium text-muted px-2">( ${today } 기준 )</span>
                            	</h4>
                                <div class="table-responsive">
                                    <table class="table no-wrap v-middle mb-0">
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 card-title">
                                            	&emsp;
                                            	<span class="btn btn-secondary rounded-circle btn-circle font-12 popover-item">${attendance }</span>
                                            	&emsp;&emsp;
                                            	<span class="btn btn-secondary rounded-circle btn-circle font-12 popover-item">${comLate }</span>
                                            	&emsp;&emsp;
                                            	<span class="btn btn-secondary rounded-circle btn-circle font-12 popover-item">${earlyLeave }</span>
                                            	&emsp;&emsp;
                                            	<span class="btn btn-secondary rounded-circle btn-circle font-12 popover-item">${outing }</span>
                                            	&emsp;&emsp;
                                            	<span class="btn btn-secondary rounded-circle btn-circle font-12 popover-item">${absent }</span>
                                            </th>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                        	<th class="border-0">
                                        		&nbsp;
	                                            <span class="border-0 font-14 card-title">출석</span>
	                                            &emsp;&nbsp;&nbsp;&nbsp;
	                                          	<span class="border-0 font-14 card-title">지각</span>
	                                          	&emsp;&nbsp;&nbsp;&nbsp;
	                                            <span class="border-0 font-14 card-title">조퇴</span>
	                                            &emsp;&nbsp;&nbsp;&nbsp;
	                                            <span class="border-0 font-14 card-title">외출</span>
	                                            &emsp;&nbsp;&nbsp;&nbsp;
	                                            <span class="border-0 font-14 card-title">결석</span>
                                            </th>
                                        </tr>
                                         <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 card-title">
                                            	<div>
                                            		나의출석률 ${attendancePer }% ( ${attendance } / ${totalLectureDays }일 )
                                            	</div>
                                            	<br>
                                            	<div class="progress">
                                            		<div class="progress-bar text-dark" style="width:${attendancePer}%">${attendancePer}%</div>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 card-title">
                                            	과정진행률 ${progressPer }% ( ${lectureProgress } / ${totalLectureDays }일)
                                            <br>
                                            <div class="progress">
                                            	<div class="progress-bar text-dark" style="width:${progressPer}%">${progressPer}%</div>
                                            </div>
                                            </th>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 card-title">
                                            	총결석일&emsp;
                                            	<span>${accumulateAbsent }일</span>
                                            	<br>
                                            	<div>
                                            		<span class="font-14 font-weight-medium text-muted">지각/조퇴/외출 3회는 결석 1회로 산정</span>
                                            	</div>
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <a class="btn btn-outline-primary" style="border-radius: 4px;"
									href="${path}/student/myLectureListOne/${studentId}/${lectureNo}/${currentPage}"
									type="button">뒤로가기</a>
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
    <script>
		
    </script>
</body>
</html>









