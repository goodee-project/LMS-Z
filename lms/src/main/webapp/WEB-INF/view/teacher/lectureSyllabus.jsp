<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>LectureSyllabus</title>
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
        
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		        
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
		<div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Lecture Syllabus</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-7 col-md-12">
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<h4 class="card-title font-weight-bold">강의계획서</h4>
								
								<table id="lmsTable" class="table table-borderless" style="margin-top: 20px;">
									<tr>
										<td style="width:10%;">강의명</td>
										<td>${plan.lectureName}(정원 : ${plan.lectureTotal})</td>
									</tr>
									<tr>
										<td>담당강사</td>
										<td>${plan.teacherName}</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>${plan.teacher.teacherEmail} / ${plan.teacher.teacherPhone}</td>
									</tr>
									<tr>
										<td>강의실</td>
										<td>${plan.classroom.classroomNumber}호</td>
									</tr>
									<tr>
										<td>과목</td>
										<td>${plan.lectureName}(정원 : ${plan.lectureTotal})</td>
									</tr>
									<tr>
										<td>강의시간</td>
										<td>${plan.lectureStartdate} ~ ${plan.lectureEnddate}(교육이수 필수 이수시간 : ${plan.subject.subjectTotalday})</td>
									</tr>
									<tr>
										<td>교재</td>
										<td>${plan.textbook.textbookTitle}(${plan.textbook.textbookPublishdate})</td>
									</tr>
									<tr>
										<td>저자</td>
										<td>${plan.textbook.textbookWriter}</td>
									</tr>
									<tr>
										<td>출판사</td>
										<td>${plan.textbook.textbookPublisher}</td>
									</tr>
									<tr>
										<td>강의 계획</td>
										<td>${plan.syllabus.syllabusContent}</td>
									</tr>
									<tr>
										<td>사인</td>
										<td>
											<img src="${plan.syllabus.syllabusTeachersign}" width="100" height="50">
										</td>
									</tr>
								</table>

								<br>
								<div>
									<a class="btn btn-outline-secondary" style="border-radius: 4px;"  href="${path}/teacher/lectureOne/${lectureNo}">< 뒤로</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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