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
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md">
            	<!-- 사이드바 로고 -->
                <div class="navbar-header" data-logobg="skin6">
                    <div class="navbar-brand">
                        <!-- 사이트 이름 -->
                        <a href="index.html">
                            <b class="logo-icon">
                            	<!-- 사이트 이름 옆 로고 -->
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                            </b>
							
							<!-- 사이트 이름 -->
                            <span class="logo-text">

                            </span>
                        </a>
                    </div>
                </div>

				<!-- 로고 오른쪽 메뉴 -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
					<!-- 뛰어쓰기 용 ul -->
                    <ul class="navbar-nav float-left mr-auto ml-3 pl-1"></ul>
                    <!-- 메뉴 오른쪽 마이페이지 -->
                    <ul class="navbar-nav float-right">
                    	<!-- 눌렀을 때 드롭다운 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <!-- 마이페이지 사진 -->
                                <img src="${path}/assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle"
                                    width="40">
                                <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span
                                        class="text-dark">${teacherId}</span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <!-- 드롭다운 내용 -->
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="${path}/teacher/myInfo/${teacherId}"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
                                    MY PAGE</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="power"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <!-- 로고 밑 메뉴 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="index.html"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Index</span></a></li>
                        <!-- 사용 시 줄 표시 -->
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">메뉴 옵션 1</span></li>
                        
                        <!-- 공지사항 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lmsNoticeList"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">공지사항
                                </span></a>
                        </li>
						<!-- 질문게시판 목록 -->
                        <li class="sidebar-item"> <a class="sidebar-link" href="${path}/teacher/questionList"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">질문게시판
                                </span></a>
                        </li>
						<!-- 강의목록 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lectureList/${teacherId}/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">강의목록
                                </span></a>
                        </li>
                        <!-- 과제 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/reportList"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">과제
                                </span></a>
                        </li>
                        <!-- FAQ -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/faqList"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">FAQ
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">4</span></a>
                            <!-- 메뉴안에 리스트 넣고 싶으면 사용 -->
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-inputs.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-1
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-input-grid.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-2
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-checkbox-radio.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-3
                                        </span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">기타</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/logout"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">Logout</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">My Page</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">Members</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
                
                <!-- 2번째 라인 카드 -->
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">내 정보 관리</h4>
                                </div>
                                <div class="pl-1 mb-1">
                                	<nav class="navbar">
                                		<ul class="navbar-nav">
											<li class="nav-item">
												<a class="nav-link" href="${path}/teacher/myInfo/${teacherId}">개인정보변경</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="${path}/teacher/myInfoId/${teacherId}">Id변경</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="${path}/teacher/myInfoPw">Pw변경</a>
											</li>
										</ul>
                                	</nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-9">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">개인정보변경</h4>
                                                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item">
                                    	
                                    </li>
                                </ol>
                            </nav>
                        </div>
                                <table class="table no-wrap v-middle mb-0">
									<tr>
										<th class=" font-14 font-weight-medium text-dark">Id</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherId}</td>
										<td><button type="button" class="btn btn-dark">Id 변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">이름</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherName}</td>
										<td><button type="button" class="btn btn-dark">개명</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">이메일</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherEmail}</td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">핸드폰 번호</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherPhone}</td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">성별</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherGender}</td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">생일</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherBirth}</td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">주소</th>
										<td class=" font-14 font-weight-medium text-dark">${teacherOne.teacherAddressMain}&nbsp;${teacherOne.teacherAddressSub}</td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">사진</th>
										<td class=" font-14 font-weight-medium text-dark"></td>
										<td><button type="button" class="btn btn-dark">변경</button></td>
									</tr>
                            	</table>
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