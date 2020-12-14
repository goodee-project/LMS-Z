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
                                        class="text-dark">박대표</span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <!-- 드롭다운 내용 -->
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Inbox</a>
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

                        <li class="sidebar-item"> <a class="sidebar-link" href="${path}/teacher/questionList"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">1
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-chat.html"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">2</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-calendar.html"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">3</span></a></li>
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
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="authentication-login1.html"
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">소제목</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">index</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
               
                <!-- 카드를 만들어서 바로 옆에 공백 없이 이어 버리고 싶을때 사용하고 싶으시면 아래 주석 참고 -->
                <!--
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">236</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">New Clients</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                                            class="set-doller">$</sup>18,306</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Earnings of Month
                                    </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="dollar-sign"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				 -->

				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">1</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">2</h4>
                                <!-- pl이 가로로 여백 mb가 세로로 여백 -->
                                <div class="pl-4 mb-3">
                                	내용 내용 내용
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">3</h4>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 2번째 라인 카드 -->
                <div class="row">
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">4</h4>
                                    <div class="ml-auto">
                                        <div class="dropdown sub-dropdown">
                                            <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                                id="dd1" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i data-feather="more-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd1">
                                                <a class="dropdown-item" href="#">Insert</a>
                                                <a class="dropdown-item" href="#">Update</a>
                                                <a class="dropdown-item" href="#">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pl-4 mb-5">
                                	내용 내용 내용
                                </div>
                                <ul class="list-inline text-center mt-4 mb-0">
                                    <li class="list-inline-item text-muted font-italic">test</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">5</h4>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 3번째 라인 카드 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">6</h4>
                                    <div class="ml-auto">
                                        <div class="dropdown sub-dropdown">
                                            <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                                id="dd1" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i data-feather="more-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd1">
                                                <a class="dropdown-item" href="#">Insert</a>
                                                <a class="dropdown-item" href="#">Update</a>
                                                <a class="dropdown-item" href="#">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap v-middle mb-0">
                                        <thead>
                                            <tr class="border-0">
                                                <th class="border-0 font-14 font-weight-medium text-muted">내용1</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">내용2</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted">내용3</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted text-center">내용4</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted text-center">내용5</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted">내용6</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="border-top-0 px-2 py-4">
                                                    <div class="d-flex no-block align-items-center">
                                                    	<!-- 굵은 글씨 -->
                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">내용1 굵은</h5>
                                                        <!-- 앏은 글씨 -->
                                                        <span class="text-muted font-14">내용1 앏은</span>
                                                    </div>
                                                </td>
                                                <td class="border-top-0 text-muted px-2 py-4 font-14">내용2</td>
                                                
                                                <!-- 아이콘 활용한 부트스트랩 -->
                                                <td class="border-top-0 px-2 py-4">
                                                    <div class="popover-icon">
                                                        <a class="btn btn-primary rounded-circle btn-circle font-12"
                                                            href="javascript:void(0)">DS</a>
                                                        <a class="btn btn-danger rounded-circle btn-circle font-12 popover-item"
                                                            href="javascript:void(0)">SS</a>
                                                        <a class="btn btn-cyan rounded-circle btn-circle font-12 popover-item"
                                                            href="javascript:void(0)">RP</a>
                                                        <a class="btn btn-success text-white rounded-circle btn-circle font-20"
                                                            href="javascript:void(0)">+</a>
                                                    </div>
                                                </td>
                                                
                                                <!-- 눌렀을때 추가 옵션 -->
                                                <td class="border-top-0 text-center px-2 py-4"><i
                                                        class="fa fa-circle text-primary font-12" data-toggle="tooltip"
                                                        data-placement="top" title="In Testing"></i></td>
                                                
                                                <!-- 살짝 굵은 글씨 -->
                                                <td
                                                    class="bord	er-top-0 text-center font-weight-medium text-muted px-2 py-4">
                                                    살짝 굵은 글씨
                                                </td>
                                                
                                                <!-- 일반적인 글씨 -->
                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">일반적인 글씨
                                                </td>
                                            </tr>   
                                        </tbody>
                                    </table>
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