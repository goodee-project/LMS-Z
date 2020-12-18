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
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacherLogin"
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
                                    <li class="breadcrumb-item"><a href="index.html">teacher</a>
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
                                	<form method="post" action="${path}/teacherSignup">
	                                    <table class="table no-wrap v-middle mb-0">
	                                    	<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">아이디</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="teacherId" name="teacherId">
	                                    			<div id="textId"></div>
	                                    		</td>
	                                    		<td class="border-0"><button id="btnId" class="btn btn-light" type="button" disabled="disabled">중복검사</button></td>    
	                                   		</tr>
	                                   		
	                                    	<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">비닐번호</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<div>
	                                    				<input type="password" id="teacherPw" name="teacherPw">
	                                    				<div id="textPw"></div>                                    			
	                                    			</div>
	                                    			<div>
	                                    				<input type="password" id="teacherPw2" readonly>
	                                    				<div id="textPw2"></div>                                    			
	                                    			</div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">이름</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="teacherName" name="teacherName">
	                                    			<div id="textName"></div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">이메일</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="teacherEmail" name="teacherEmail">
	                                    			<div id="textEmail"></div>
	                                    		</td>
	                                    		<td class="border-0"><button class="btn btn-light" id="btnEmail" type="button" disabled="disabled">중복검사</button></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">핸드폰 번호</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<select id="teacherPhone1" name="teacherPhone1">
	                                    				<option value="">선택</option>
	                                    				<option value="010">010</option>
	                                    				<option value="011">011</option>
	                                    			</select>-
	                                    			<input type="text" id="teacherPhone2" name="teacherPhone2">-
	                                    			<input type="text" id="teacherPhone3" name="teacherPhone3">
	                                    			<div id="textPhone"></div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">성별</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="radio" class="teacherGender" name="teacherGender" value="남">남
	                                    			<input type="radio" class="teacherGender" name="teacherGender" value="여">여
	                                    			<div id="textGender"></div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">메인 주소</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="teacherAddressMain" name="teacherAddressMain">
	                                    			<div style="width:100%; height:200px; overflow:auto">
		                                    			<table id="addressTable"></table>
	                                    			</div>
	                                    		</td>
	                                    		<td class="border-0"><button class="btn btn-light" id="btnAddress" type="button">찾기</button></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">서브 주소</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="text" id="teacherAddressSub" name="teacherAddressSub">
	                                    			<div id="textAddressSub"></div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                   		
	                                   		<tr class="border-0">
	                                    		<th class="border-0 font-14 font-weight-medium">생일</th>
	                                    		<td class="font-weight-medium text-dark border-top-0">
	                                    			<input type="date" id="teacherBirth" name="teacherBirth">
	                                    			<div id="textBirth"></div>
	                                    		</td>
	                                    		<td class="border-0"></td>    
	                                   		</tr>
	                                    </table>
                                    <button id="btnSignup" type="button">Sign Up</button>
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
    	// 로그인이 되었는지 확인하는 변수
		var successId = '';
		var successPw = '';
		var successName = '';
		var successEmail = '';
		var successPhone = '';
		var successGender = '';
		var successAddressMain = '';
		var successAddressSub = '';
		var successBirth = '';

		// 회원가입 시 걸어논 규약을 만족해야만 회원가입 가능
		$('#btnSignup').click(function(){
			if(successId == 'success' && successPw == 'success' && successName == 'success' && successEmail == 'success' && successPhone == 'success' && successGender == 'success' && successAddressMain == 'success' && successAddressSub == 'success' && successBirth == 'success'){
				//alert('success');
				$('form').submit();
			} else{
				alert('입력란을 정상적으로 입력해 주세요');
			}
		})		

    	// 아이디에 대한 제약 (정규 표현식)
    	// 첫 글자 영문, 영문하고 숫자 조합으로만 조합 가능, 6~14글자
		var checkId = /^[A-Za-z][A-Z0-9a-z]{5,13}$/;
		// 아이디 입력란의 input 실시간 감지
		// 제약이 맞으면 "형식확인", 아니면 "아이디 형식을 확인해 주세요" 출력
		$('#teacherId').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#teacherId').val())){				
				$('#textId').text('중복 검사를 해주세요');
				$('#btnId').prop('disabled', false);				
			}
			else{
				$('#textId').text('아이디 형식을 확인해 주세요');
				$('#btnId').prop('disabled', true);
				successId = '';
			}
		});

		// 아이디에 대한 규약이 맞을 때만 중복검사 버튼 활성화
		// ajax를 통해 아이디값을 비교 후 값이 있다면 confirm창, 없다면 바로 alert창 실행
		$('#btnId').click(function(){
			$.ajax({
				url:'${path}/teacherOverlapId',
				type:'GET',
				data:{accountId: $('#teacherId').val()},
				success:function(data){
					if(data.overlapId == 0){
						if(confirm('사용 가능한 아이디입니다. 사용하시겠습니까?')){
							$('#teacherId').prop('readonly', true);
							$('#btnId').prop("disabled", true);
							$('#textId').text('');
							successId = 'success';
						}
					} else{
						alert('중복 된 아이디입니다');
						successId = '';
					}
				}
			});	
		});

		// checkPw는 입력란에 8~20자를 적을 수 있고 영문자와 숫자, 특수문자를 포함하는 지 확인하기 위한 변수
		// checkPw2는 특수문자가 비닐번호에 하나라도 포함됬는지 확인하기 위한 변수
		var checkPw = /^[A-z0-9a-z~!@#$%^&*()_+|<>?:{}]{8,20}$/;
		var checkPw2 = /[~!@#$%^&*()_+|<>?:{}]/;
		// teacherPw에 대해서 실시간으로 입력감지를 하게 하고 teacherPw2는 비활성화
		// 만약 비닐번호가 특수문자를 포함하고 규약에 맞다면 Pw 활성화
		$('#teacherPw').on('ropertychange change keyup paste input', function(){
			if(checkPw.test($('#teacherPw').val())){
				if(checkPw2.test($('#teacherPw').val())){
					$('#textPw').text('형식 확인');
					$('#teacherPw2').prop('readonly', false);
				} else{
					$('#textPw').text('특수문자를 포합해주세요');
					$('#teacherPw2').prop('readonly', true);
					
				}
			} else{
				$('#textPw').text('비닐번호 형식을 확인해 주세요');
				$('#teacherPw2').prop('readonly', true);
			}
		});

		// teacherPw2에 대한 체크 규약
		// teacherPw2는 비닐번호를 제대로 입력하였는지 확인 하는 수단으로 teacherPw와 teacherPw2가 같을 경우 textPw2를 통해 출력
		$('#teacherPw2').on('ropertychange change keyup paste input', function(){
			if($('#teacherPw').val() == $('#teacherPw2').val()){
				$('#textPw2').text('형식 확인');
				successPw = 'success';
			} else if($('#teacherPw2').val() == ""){
				$('#textPw2').text('');
				successPw = '';
			} else{
				$('#textPw2').text('비닐번호가 다릅니다');
				successPw = '';
			}
		});

		// teacherName의 값이 들어가있다면 형식 확인 출력 없다면 공백
		$('#teacherName').on('ropertychange change keyup paste input', function(){
			if($('#teacherName').val().length < 1){
				$('#textName').text('');
				successName = '';
			} else{
				$('#textName').text('형식 확인');
				successName = 'success';
			}
		});	

		// manageEmail 입력란에 @을 포합해야되는 등의 규약
		// 그것을 실시간으로 입력감지하여 text로 표시
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$('#teacherEmail').on('ropertychange change keyup paste input', function(){
			if(checkEmail.test($('#teacherEmail').val())){
				$('#textEmail').text('중복 검사를 해주세요');
				$('#btnEmail').prop('disabled', false);
			} else{
				$('#textEmail').text('');
				$('#btnEmail').prop('disabled', true);
				successEmail = '';
			}
		});

		// teacherEmail옆에 중복검사 버튼을 눌렀을 경우 ajax를 통해 중복검사
		// 중복되었을 경우 alert로 사용 가능 할 경우 confirm으로 알림창 표시
		$('#btnEmail').click(function(){
			$.ajax({
				url:'${path}/teacherOverlapEmail',
				type:'GET',
				data:{teacherEmail: $('#teacherEmail').val()},
				success:function(data){
					if(data.overlapEmail == 0){
						if(confirm('사용 가능한 이메일입니다. 사용하시겠습니까?')){
							$('#teacherEmail').prop('readonly', true);
							$('#btnEmail').prop("disabled", true);
							$('#textEmail').text('');
							successEmail = 'success';
						}
					} else{
						alert('중복 된 이메일입니다');
					}
				}
			});	
		});

		// teacherGender의 radio 버튼을 누를경우 선택을 한 것이므로 형식 확인 출력
		$('.teacherGender').on('ropertychange change keyup paste input', function(){
			$('#textGender').text('형식 확인');
			successGender = 'success';
		});

		// teacherPhone을 총 3개로 나누고 그 중 2개에 규약 설정
		// 가운데 번호와 끝번호에는 4자리의 번호로만 이루어져야함
		var checkPhone2 = /^\d{4}$/;
		var checkPhone3 = /^\d{4}$/;

		// teacherPhone을 3개를 실시간 입력감지하여 text로 표시
		// 3개 다 규약에 맞는 값이 들어가야 완료
		$('#teacherPhone1').on('ropertychange change keyup paste input', function(){
			if(($('#teacherPhone1').val() == "") || !checkPhone2.test($('#teacherPhone2').val()) || !checkPhone3.test($('#teacherPhone3').val())){
				$('#textPhone').text('');
				successPhone = '';
			} else{
				$('#textPhone').text('형식확인');
				successPhone = 'success';
			}
		});

		$('#teacherPhone2').on('ropertychange change keyup paste input', function(){
			if(($('#teacherPhone1').val() == "") || !checkPhone2.test($('#teacherPhone2').val()) || !checkPhone3.test($('#teacherPhone3').val())){
				$('#textPhone').text('');
				successPhone = '';
			} else{
				$('#textPhone').text('형식확인');
				successPhone = 'success';
			}
		});

		$('#teacherPhone3').on('ropertychange change keyup paste input', function(){
			if(($('#teacherPhone1').val() == "") || !checkPhone2.test($('#teacherPhone2').val()) || !checkPhone3.test($('#teacherPhone3').val())){
				$('#textPhone').text('');
				successPhone = '';
			} else{
				$('#textPhone').text('형식확인');
				successPhone = 'success';
			}
		});

		// teacherAddressMain 옆에 있는 버튼을 누를경우 ajax를 통해 주소 검색란 표시
		// 테이블을 스크롤의 형태로 출력을 하고 a태그의 oneclick옵션을 이용하여 키 값을 스크립트의 함수로 옮겨준뒤 처리한다
		$('#btnAddress').click(function(){
			$('#addressTable').empty();
			$.ajax({
				url:'${path}/teacherAddressSearch',
				type:'GET',
				data:{doro: $('#teacherAddressMain').val()},
				success:function(data){
					var strHead = '<thead>';
					strHead += '</tr><td>';
					strHead += '주소';			
					strHead += '<td></tr>';
					strHead += '</thead>';
	
					$('#addressTable').append(strHead);
					
					$.each(data.addressList, function(index, address){
						var dataSet = address.sido + ' ' + address.sigungu + ' ' + address.doro + ' ' + address.buildno1 + '-' + address.buildno2;
						
						var strBody = '<tbody>';
						strBody += '<tr><td>';
						strBody += '<a href="javascript:click()" onclick="addressClick(\'' + dataSet + '\')">';						
						strBody += dataSet;						
						strBody += '</a>';
						strBody += '</td></tr>';
						strBody += '</tbody>';

						$('#addressTable').append(strBody);
					})
				}
			});	
		});

		// 주소 검색 테이블에서 해당 버튼을 눌렀을 경우 teacherAddressMain이 채워진다.
		function addressClick(dataSet){
			$('#teacherAddressMain').val(dataSet);
			$('#addressTable').empty();
			successAddressMain = 'success';
		}

		// teacherAddressSub의 input text 안에 값이 있다면 형식 확인 출력
		$('#teacherAddressSub').on('ropertychange change keyup paste input', function(){
			if($('#teacherAddressSub').val().length < 1){
				$('#textAddressSub').text('');
				successAddressSub = ''
			} else{
				$('#textAddressSub').text('형식 확인');
				successAddressSub = 'success';
			}
		});

		// teacherBirth의 input타입 birth를 선택을 하였다면 형식 확인 출력
		$('#teacherBirth').on('ropertychange change keyup paste input', function(){
			if($('#teacherBirth').val().length < 1){
				$('#textBirth').text('');
				successBirth = '';
			} else{
				$('#textBirth').text('형식 확인');
				successBirth = 'success';
			}
		});	

    </script>
</body>
</html>


















