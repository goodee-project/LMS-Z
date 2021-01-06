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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">강의 현황</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item">
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
			<div class="container-fluid">
                <!-- 테이블 -->
                <div class="row">
                    <div class="col-mb-12 col-lg-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="lmsTable" class="table table" style="margin-top: 20px;">
                                        <thead>
                                            <tr class="border-0">
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">강의명</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">강사이름</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">강의기간</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">강좌 정원</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">강의 상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="c" items="${myLectureList}">
	                                            <tr>
	                                                <td class="border-top-0 text-muted px-2 py-4 font-14">
	                                               		<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">
	                                                        	<a href="${path}/student/myLectureListOne/${studentId}/${c.lecture.lectureNo}/${currentPage}">${c.lecture.lectureName}</a>
	                                                        </h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 아이콘 활용한 부트스트랩 -->
	                                                <td class="border-top-0 px-2 py-4">
	                                                    <div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.lecture.teacherName}</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 눌렀을때 추가 옵션 -->
	                                                <td class="border-top-0 text-center px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.lecture.lectureStartdate } ~ ${c.lecture.lectureEnddate }</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 일반적인 글씨 -->
	                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.lecture.lectureTotal }</h5>
	                                                    </div>
	                                                </td>
	                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.classRegistrationState }</h5>
	                                                    </div>
	                                                </td>
	                                            </tr>
	                                         </c:forEach>
                                        </tbody>
                                    </table>
                                  	<!-- 페이징 -->
                                  	<br>
                                  	<div id="paging" style="text-align: center; padding: 7px;">
                                  		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
											<c:if test="${startPage!=1 && lastPage!=1}">
												<span> 
													<a href="${path}/student/myLectureList/${studentId }/${startPage-10}">이전&nbsp;&nbsp;</a>
												</span>
											</c:if>
											<!-- lastPage가 10개를 채울수 없을 때 -->
											<c:if test="${startPage+9 > lastPage }">
												<c:forEach var="i" begin="${startPage }" end="${lastPage}">
													<!-- 현재 페이지일 경우 -->
													<c:if test="${currentPage == i }">
														<span> 
															<a id="pagingStyle" class="bg-secondary font-18">${i}&nbsp;&nbsp;</a>
														</span>
													</c:if>
													<!-- 현재 페이지가 아닐 경우 -->
													<c:if test="${currentPage != i }">
														<span> 
															<a class="font-18" href="${path}/student/myLectureList/${studentId }/${i}">${i}&nbsp;&nbsp;</a>
														</span>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${startPage+9<lastPage }">
												<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
													<!-- 현재 페이지일 경우 -->
													<c:if test="${currentPage == i }">
														<span> 
															<a id="pagingStyle" class="bg-secondary font-18">${i}&nbsp;&nbsp;</a>
														</span>
													</c:if>
													<!-- 현재 페이지가 아닐 경우 -->
													<c:if test="${currentPage != i }">
														<span> 
															<a class="font-18" href="${path}/student/myLectureList/${studentId }/${i}">${i}&nbsp;&nbsp;</a>
														</span>
													</c:if>
												</c:forEach>
											</c:if>
											<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
											<c:if test="${startPage+9<lastPage && lastPage != startPage}">
												<span> <a
													href="${path}/student/student/myLectureList/${studentId }/${startPage+10}">다음&nbsp;&nbsp;</a>
												</span>
											</c:if>
										</div>
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