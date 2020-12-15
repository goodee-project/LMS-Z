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
                        <a href="index">
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
            </nav>
        </header>
        
        <!-- 로고 밑 메뉴 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">옵션</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="#"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">돌아가기</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">SIGN UP</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">Manager</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid text-center">
                <!-- 회원가입 란-->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                	<form method="post" action="${path}/managerSignup">
	                                    <table class="table no-wrap v-middle mb-0">
	                                    	<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">아이디</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="managerId" name="managerId">
	                                    			<div id="textId"></div>
	                                    		</td>
	                                    		<td class="border-0"><button id="btnId" class="btn btn-light" type="button">중복검사</button></td>    
	                                   		</tr>
	                                   		
	                                    	<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">비닐번호</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<div>
	                                    				<input type="password" name="managerPw">                                    			
	                                    			</div>
	                                    			<div>
	                                    				<input type="password">                                    			
	                                    			</div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">이름</th>
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="text" name="managerName"></td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">이메일</th>
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="text" name="managerEmail"></td>
	                                    		<td class="border-0"><button class="btn btn-light" type="button">중복검사</button></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">핸드폰 번호</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<select name="managerPhone1">
	                                    				<option value="010">010</option>
	                                    				<option value="011">011</option>
	                                    			</select>-
	                                    			<!-- insert테스트를 위한 name 변경 -->
	                                    			<input type="text" name="managerPhone">-
	                                    			<input type="text" name="managerPhone3">
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">성별</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="radio" name="managerGender" value="남">남
	                                    			<input type="radio" name="managerGender" value="여">여
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">메인 주소</th>
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="text" name="managerAddressMain"></td>
	                                    		<td class="border-0"><button class="btn btn-light" type="button">찾기</button></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">서브 주소</th>
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="text" name="managerAddressSub"></td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">생일</th>
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="date" name="managerBirth"></td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                    </table>
                                    <button type="submit">Sign Up</button>
                                    </form>
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
    <script>
    	// 아이디에 대한 제약 (정규 표현식)
    	// 첫 글자 영문, 영문하고 숫자 조합으로만 조합 가능, 6~14글자
		var checkId = /^[A-Za-z][A-Z0-9a-z]{5,13}$/;
		// 아이디 입력란의 input 실시간 감지
		// 제약이 맞으면 "형식확인", 아니면 "아이디 형식을 확인해 주세요" 출력
		$("#managerId").on("propertychange change keyup paste input", function(){
			if(!checkId.test($('#managerId').val())){
				$('#textId').text("아이디 형식을 확인해 주세요");
			}
			else{
				$('#textId').text("형식 확인");
			}
		});

    </script>
</body>
</html>


















