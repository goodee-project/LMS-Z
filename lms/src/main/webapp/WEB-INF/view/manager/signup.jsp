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
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/managerLogin"
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
	                                    		<td class="border-0"><button id="btnId" class="btn btn-light" type="button" disabled="disabled">중복검사</button></td>    
	                                   		</tr>
	                                   		
	                                    	<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">비닐번호</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<div>
	                                    				<input type="password" id="managerPw" name="managerPw">
	                                    				<div id="textPw"></div>                                    			
	                                    			</div>
	                                    			<div>
	                                    				<input type="password" id="managerPw2" readonly>
	                                    				<div id="textPw2"></div>                                    			
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
	                                    		<td class="font-weight-medium text-dark border-top-0"><input type="text" id="managerEmail" name="managerEmail"></td>
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
		$('#managerId').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#managerId').val())){				
				$('#textId').text('형식 확인');
				$('#btnId').prop('disabled', false);				
			}
			else{
				$('#textId').text('아이디 형식을 확인해 주세요');
				$('#btnId').prop('disabled', true);
			}
		});

		// 아이디에 대한 규약이 맞을 때만 중복검사 버튼 활성화
		// ajax를 통해 아이디값을 비교 후 값이 있다면 confirm창, 없다면 바로 alert창 실행
		$('#btnId').click(function(){
			$.ajax({
				url:'${path}/managerOverlap',
				type:'GET',
				data:{accountId: $('#managerId').val()},
				success:function(data){
					if(data.overlap == 0){
						if(confirm('사용 가능한 아이디입니다. 사용하시겠습니까?')){
							$('#managerId').prop('readonly', true);
							$('#btnId').prop("disabled", true);
							$('#textId').text('');
						}
					} else{
						alert('중복 된 아이디입니다');
					}
				}
			});	
		});

		// checkPw는 입력란에 8~20자를 적을 수 있고 영문자와 숫자, 특수문자를 포함하는 지 확인하기 위한 변수
		// checkPw2는 특수문자가 비닐번호에 하나라도 포함됬는지 확인하기 위한 변수
		var checkPw = /^[A-z0-9a-z~!@#$%^&*()_+|<>?:{}]{8,20}$/;
		var checkPw2 = /[~!@#$%^&*()_+|<>?:{}]/;
		// managerPw에 대해서 실시간으로 입력감지를 하게 하고 managerPw2는 비활성화
		// 만약 비닐번호가 특수문자를 포함하고 규약에 맞다면 Pw 활성화
		$('#managerPw').on('ropertychange change keyup paste input', function(){
			if(checkPw.test($('#managerPw').val())){
				if(checkPw2.test($('#managerPw').val())){
					$('#textPw').text('형식 확인');
					$('#managerPw2').prop('readonly', false);
				} else{
					$('#textPw').text('특수문자를 포합해주세요');
					$('#managerPw2').prop('readonly', true);
					
				}
			} else{
				$('#textPw').text('비닐번호 형식을 확인해 주세요');
				$('#managerPw2').prop('readonly', true);
			}
		});

		// managerPw2에 대한 체크 규약
		// managerPw2는 비닐번호를 제대로 입력하였는지 확인 하는 수단으로 managerPw와 managerPw2가 같을 경우 textPw2를 통해 출력
		$('#managerPw2').on('ropertychange change keyup paste input', function(){
			if($('#managerPw').val() == $('#managerPw2').val()){
				$('#textPw2').text('형식 확인');
			} else if($('#managerPw2').val() == ""){
				$('#textPw2').text('');
			} else{
				$('#textPw2').text('비닐번호가 다릅니다');
			}
		});
    </script>
</body>
</html>


















