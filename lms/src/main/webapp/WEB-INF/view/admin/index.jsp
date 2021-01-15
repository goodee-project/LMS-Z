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
        
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md">
            	<!-- 사이드바 로고 -->
                <div class="navbar-header" data-logobg="skin6">
                    <div class="navbar-brand">
                        <!-- 사이트 이름 -->
                        <a href="">
                            <b class="logo-icon">
                            	<!-- 사이트 이름 옆 로고 -->
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                            </b>
							<!-- 사이트 이름 -->
                            <span class="logo-text">
								GOODEE LMS
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
                                <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span
                                        class="text-dark"><c:out value="${adminId}"/></span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <!-- 드롭다운 내용 -->
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="${path}/admin/logout"><i data-feather="power"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-small-cap"><span class="hide-menu">기타</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/admin/logout"
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Index</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="">관리자</a>
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
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <h4 class="card-title">승인 대기자</h4>
	                            <div>
									<table class="table no-wrap v-middle mb-0">
                                        <thead>
                                            <tr class="border-0">
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">아이디</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">이름</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">전화번호</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">이메일</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">성별</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">생일</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">주소</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">상세주소</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2"></th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="c" items="${managerQueueList}" varStatus="status">
	                                            <tr>
	                                                <td class="border-top-0 px-2 py-4">
	                                                    <div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerId}</h5>
	                                                    </div>
	                                                </td>
	                                                <td class="border-top-0 text-muted px-2 py-4 font-14">
	                                               		<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerName}</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 아이콘 활용한 부트스트랩 -->
	                                                <td class="border-top-0 px-2 py-4">
	                                                    <div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerPhone}</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 눌렀을때 추가 옵션 -->
	                                                <td class="border-top-0 text-center px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerEmail}</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 살짝 굵은 글씨 -->
	                                                <td class="bord	er-top-0 text-center font-weight-medium text-muted px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerGender}</h5>
	                                                    </div>
	                                                </td>
	                                                
	                                                <!-- 일반적인 글씨 -->
	                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerBirth}</h5>
	                                                    </div>
	                                                </td>
	                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerAddressMain}</h5>
	                                                    </div>
	                                                </td>
	                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4">
	                                                	<div class="d-flex no-block align-items-center">
	                                                    	<!-- 굵은 글씨 -->
	                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">${c.managerAddressSub}</h5>
	                                                    </div>
	                                                </td>
	                                                <td>
	                                                	<div class="popover-icon">
	                                                        <a class="btn btn-primary rounded-circle btn-circle font-12"
	                                                            href="${path}/admin/approved/${c.managerId}">승인</a>
                                                        </div>
	                                                </td>
	                                                <td>
	                                                	<div class="popover-icon">
	                                                        <a class="btn btn-danger rounded-circle btn-circle font-12 popover-item"
                                                            	id="disavowalBtn${status.count }" href="${path }/admin/disavowal/${c.managerId}">거부</a>
                                                        </div>
	                                                </td>
	                                            </tr>
	                                         </c:forEach>
                                        </tbody>
                                    </table>
	                            </div>
                            </div>
                        </div>
                    </div>
       			</div>
	        	<!-- 2번째 라인 카드 -->     
	        	<div class="row">
	                <div class="col-lg-12 col-md-12">
	                    <div class="card" id="cardStyle">
			                <div class="card-body">
			                    <h4 class="card-title">휴먼 상태 리스트</h4>
			                    <table class="table no-wrap v-middle mb-0">
                                     <thead>
                                        <tr class="border-0">
                                            <th class="border-0 font-14 text-dark px-2">아이디</th>
                                            <th class="border-0 font-14 text-dark px-2">최근 접속일</th>
                                            <th class="border-0 font-14 text-dark px-2">휴면계정 해지</th>
                                        </tr>
                                     </thead>
                                     <tbody>
                                       	<c:forEach var="d" items="${dormantStateList}">
	                                       <tr>
	                                           <td class="px-2 py-4">
	                                               <div class="d-flex no-block align-items-center">
	                                                	<!-- 굵은 글씨 -->
	                                                   <h5 class="text-dark mb-0 font-16 font-weight-medium">${d.accountId }</h5>
	                                                </div>
	                                           </td>
	                                           <td class="text-muted px-2 py-4 font-14">
	                                         		<div class="d-flex no-block align-items-center">
	                                                   	<!-- 굵은 글씨 -->
	                                                    <h5 class="text-dark mb-0 font-16 font-weight-medium">${d.connectUpdatedate }</h5>
	                                                </div>
	                                           </td>
	                                           <td>
	                                              	<div class="popover-icon">
	                                                   <a class="btn btn-primary rounded-circle btn-circle font-12"
	                                                            href="${path }/admin/changeActivation/${d.accountId}">변경</a>
                                                    </div>
	                                           </td>
	                                       </tr>
	                                    </c:forEach>
                                    </tbody>
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
    <script>
		$(document).ready(function(){
			for(let i=1;i<${managerQueueList.size()+1};i++)
			$('#disavowalBtn'+i).click(function(){
				let disavowalConfirm = confirm('승인 거부 하시겠습니까?');
				if(disavowalConfirm){
					$('#disavowalBtn').attr('href','${path }/admin/disavowal/'+$('#'+i).val());
				}
				else{
					$('#disavowalBtn'+i).removeAttr('href');
				}
			})
		})
    </script>
</body>

</html>







