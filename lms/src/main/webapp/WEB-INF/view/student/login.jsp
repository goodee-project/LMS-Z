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
            </nav>
        </header>
        
        <!-- 로고 밑 메뉴 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        
                        <!-- 사용 시 줄 표시 -->
                        <li class="list-divider"></li>

                        <li class="sidebar-item"> <a class="sidebar-link" href="${path}/adminLogin"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">관리자 로그인
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/managerLogin"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">매니저 로그인</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacherLogin"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">강사 로그인</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href=""
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">학생 로그인</span></a>
                    </ul>
                </nav>
            </div>
        </aside>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"></h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

                <!-- 2번째 라인 카드 -->
	               <div class="row">
	               		<div class="col-md-3 col-lg-3"></div>
	                    <div class="col-md-5 col-lg-4">
	                        <div class="card" id="cardStyle" style="height:370px;">
	                        	<form id="loginForm" method="post" action="${path}/studentLogin">
		                            <div class="card-body">
		                            <div id="loginTitle" class="text-center font-7">
		                            	<a>로그인</a>
		                            </div>
		                            <div id="loginSubTitle" class="text-center">
	                            		<a>학생</a>
                            		</div>
		                                <table id="loginTable">
		                                	<tr>
		                                		<td>
		                                			<input type="text" class="form-control-plaintext form-control-lg border-black" style="padding: 10px; margin-top:-5px;" id="accountId" name="accountId" value="student1">
		                                		</td>
		                                	</tr>
		                                	<tr>
		                                		<td>
		                                			<input type="password" class="form-control-plaintext form-control-lg border-black" style="padding: 10px;" id="accountPw" name="accountPw" value="qwer1234!">
		                                		</td>
		                                	</tr>
		                                </table>
		                                
		                                <button id="btnResult" class="btn btn-success font-3 btn-block btn-lg border-rad" type="submit">로그인</button>
		                            </div>
	                            </form>
	                            <div id="loginStyle">
			                        <a href="${path}/studentSignup">회원가입</a>&nbsp;&nbsp;|&nbsp; 
			                        <a href="${path}/studentLoginSearch">아이디/패스워드 찾기</a>
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
		$('#btnResult').click(function(){
			if($('#accountId').val().length < 1 || $('#accountPw').val().length < 1){
				alert('아이디와 비밀번호를 입력해주세요.');
			} else{
				$.ajax({
					url:'${path}/studentLoginCheck',
					type:'GET',
					data:{accountId: $('#accountId').val(), accountPw: $('#accountPw').val()},
					success:function(data){
						if(data.check == null){
							alert('입력하신 아이디와 비밀번호를 다시 확번 한인해 주세요.');
						} else if(data.check == '중복'){
							alert('현재 사용중인 아이디입니다.');
						} else{
							$('#loginForm').submit();
						}
					}
				});	
			}
		});
    </script>
</body>

</html>