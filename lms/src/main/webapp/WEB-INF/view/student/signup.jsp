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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>

<body>
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
								GOODEE LMS
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
                        <li class="nav-small-cap"><span class="hide-menu"></span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/studentLogin"
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"></h3>
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



	<!-- 회원가입 란-->
	<div class="row">
		<div class="col-md-2 col-lg-2"></div>
		<div class="col-md-7 col-lg-7">
				<div class="card" id="cardStyle">
					<div class="card-body">
						<div id="loginTitle" class="text-center font-7">
							<a>회원가입</a>
						</div>
								                        
						<div id="loginSubTitle" class="text-center">
							<a>학생</a>
						</div>
						                            	
						
						<form id="signupForm" method="post" action="${path}/studentSignup">
							<table class="table table" id="signupTable">
								<tr>
									<th class="font-14 font-weight-medium text-dark">아이디</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentId" name="studentId">
										<div id="textId">
											첫 글자 영문, 영문/숫자을 조합하여 6~14글자로 입력해주세요.
										</div>
										<div style="text-align:right; margin-top:7px">
											<button id="btnIdReset" class="btn btn-outline-secondary text-dark" type="button" disabled>재입력</button>
											<button id="btnId" class="btn btn-outline-secondary text-dark" type="button">중복검사</button>
										</div>
									</td> 
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">비밀번호</th>
									<td class="font-14 font-weight-medium text-dark">
										<div>
											<input type="password" class="form-control-plaintext form-control border-black" id="studentPw" name="studentPw">
											<div id="textPw">
												영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.
											</div>                                    			
										</div>
										<div>
											<input type="password" class="form-control-plaintext form-control border-black" id="studentPw2" style="margin-top:15px">
											<div id="textPw2">
												비밀번호를 다시 한번 입력해주세요.
											</div>                                    			
										</div>
									</td> 
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">이름</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentName" name="studentName">
										<div id="textName">
											이름을 입력해주세요.
										</div>
									</td>
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">이메일</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentEmail" name="studentEmail">
										<div id="textEmail">
											이메일을 문자 @을 붙인 형식으로 입력해주세요.
										</div>
										<div style="text-align:right; margin-top:7px">
											<button id="btnEmailReset" class="btn btn-outline-secondary text-dark" type="button" disabled>재입력</button>
											<button class="btn btn-outline-secondary text-dark" id="btnEmail" type="button">중복검사</button>
										</div>
									</td>
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">핸드폰 번호</th>
									<td class="font-14 font-weight-medium text-dark">
										<select class="form-control-plaintext form-control border-black" id="studentPhone1" name="studentPhone1">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
										</select>
										<input type="text" class="form-control-plaintext form-control border-black" id="studentPhone2" name="studentPhone2">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentPhone3" name="studentPhone3">
										<div id="textPhone">
											핸드폰 번호를 입력해주세요.
										</div>
									</td>
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">성별</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="radio" class="studentGender" name="studentGender" value="남">남
										<input type="radio" class="studentGender" name="studentGender" value="여" style="margin-left:15px;">여
										<div id="textGender">
											성별을 선택해주세요
										</div>
									</td>
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">메인 주소</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentAddressMain" name="studentAddressMain" placeholder="도로명을 입력해 주세요">
										<div style="width:100%; height:140px; overflow:auto">
											<table id="addressTable"></table>
										</div>
										<div style="text-align:right; margin-top:7px">
											<button id="btnAddressReset" class="btn btn-outline-secondary text-dark" type="button" disabled>재입력</button>
											<button class="btn btn-outline-secondary text-dark" id="btnAddress" type="button">찾기</button>
										</div>
									</td>
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">서브 주소</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="text" class="form-control-plaintext form-control border-black" id="studentAddressSub" name="studentAddressSub">
										<div id="textAddressSub">
											서브 주소를 입력해주세요. (선택)
										</div>
									</td>  
								</tr>
								                                   		
								<tr>
									<th class="font-14 font-weight-medium text-dark">생일</th>
									<td class="font-14 font-weight-medium text-dark">
										<input type="date" class="form-control-plaintext form-control border-black" id="studentBirth" name="studentBirth">
										<div id="textBirth">
											생일을 입력해주세요.
										</div>
									</td>
								</tr>
							</table>
							<div style="text-align:right; margin-top:7px">
								<button class="btn btn-outline-secondary text-dark" id="btnSignup" type="button">Sign Up</button>
							</div>
						</form>
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
		var successPw2 = '';
		var successName = '';
		var successEmail = '';
		var successPhone1 = '';
		var successPhone2 = '';
		var successPhone3 = '';
		var successGender = '';
		var successAddressMain = '';
		var successBirth = '';

		$('#btnSignup').click(function(){
			if(successId != '' && successPw != '' && successPw2 != '' && successName != '' && successEmail != '' && successPhone1 != '' && successPhone2 != '' && successPhone3 != '' && successGender != '' && successAddressMain != '' && successBirth != ''){
				if(confirm('입력하신 것으로 회원가입합니다.')){
					$('#signupForm').submit();
				}
			} else{
				alert('회원가입 입력란을 확인해주세요.');
			}
			
			if(successId == ''){
				$('#textId').text('X 첫 글자 영문, 영문/숫자을 조합하여 6~14글자로 입력해주세요.')
							.attr('class', 'text-danger');	
				$('#studentId').css('outline', '2px solid #FF0000');
			}

			if(successPw == ''){
				$('#textPw').text('X 영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.')
							.attr('class', 'text-danger');
				$('#studentPw').css('outline', '2px solid #FF0000');
			}

			if(successPw2 == ''){
				$('#textPw2').text('X 비밀번호를 다시 한번 입력해주세요.')
							 .attr('class', 'text-danger');
				$('#studentPw2').css('outline', '2px solid #FF0000');
			}

			if(successName == ''){
				$('#textName').text('X 이름을 입력해주세요.')
				  			  .attr('class', 'text-danger');
				$('#studentName').css('outline', '2px solid #FF0000');
			}

			if(successEmail == ''){
				$('#textEmail').text('X 이메일을 문자 @을 붙인 형식으로 입력해주세요.')
	   			   			   .attr('class', 'text-danger');
				$('#studentEmail').css('outline', '2px solid #FF0000');
			}

			if(successPhone1 == ''){
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
				  			   .attr('class', 'text-danger');
				$('#studentPhone1').css('outline', '2px solid #FF0000');
			}
			
			if(successPhone2 == ''){
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
				  			   .attr('class', 'text-danger');
				$('#studentPhone2').css('outline', '2px solid #FF0000');
			}
			
			if(successPhone3 == ''){
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
				  			   .attr('class', 'text-danger');
				$('#studentPhone3').css('outline', '2px solid #FF0000');
			}

			if(successGender == ''){
				$('#textGender').text('X 성별을 선택해주세요.')
	  			  			    .attr('class', 'text-danger');
			}

			if(successAddressMain == ''){
				$('#studentAddressMain').css('outline', '2px solid #FF0000');
			}

			if(successBirth == ''){
				$('#textBirth').text('X 생일을 입력해주세요.')
							   .attr('class', 'text-danger');	
				$('#studentBirth').css('outline', '2px solid #FF0000');
			}
		});

    	// 아이디에 대한 제약 (정규 표현식)
    	// 첫 글자 영문, 영문하고 숫자 조합으로만 조합 가능, 6~14글자
		var checkId = /^[A-Za-z][A-Z0-9a-z]{5,13}$/;
		// 아이디 입력란의 input blur 감지
		// 제약이 맞으면 "형식확인", 아니면 "아이디 형식을 확인해 주세요" 출력
		$('#studentId').blur(function(){
			if(successId == 'success'){
			
			} else{
				if(checkId.test($('#studentId').val())){				
					$('#textId').text('X 중복 검사를 해주세요')
								.attr('class', 'text-danger');	
					$(this).css('outline', '2px solid #FF0000');		
					successId = '';
				} else{
					$('#textId').text('X 첫 글자 영문, 영문/숫자을 조합하여 6~14글자로 입력해주세요.')
								.attr('class', 'text-danger');	
					$(this).css('outline', '2px solid #FF0000');
				}
			}
		});

		// 아이디에 대한 규약이 맞을 때만 중복검사 버튼 활성화
		// ajax를 통해 아이디값을 비교 후 값이 있다면 confirm창, 없다면 바로 alert창 실행
		$('#btnId').click(function(){
			if(!checkId.test($('#studentId').val())){
				$('#studentId').css('outline', '2px solid #FF0000');
				alert('아이디 형식을 확인해 주세요.');
			} else{
				$.ajax({
					url:'${path}/studentOverlapId',
					type:'GET',
					data:{accountId: $('#studentId').val()},
					success:function(data){
						if(data.overlapId == 0){
							if(confirm('사용 가능한 아이디입니다. 사용하시겠습니까?')){
								$('#studentId').prop('readonly', true)
											   .css('outline', '2px solid #5CD1E5');
								$('#btnId').prop('disabled', true);
								$('#btnIdReset').prop('disabled', false);	
								$('#textId').text('');
								successId = 'success';
							}
						} else{
							alert('입력하신 아이디는 중복 된 아이디입니다');
							successId = '';
						}
					}
				});	
			}
		});

		// id와 관련된 옵션 초기값으로 초기화
		$('#btnIdReset').click(function(){
			$('#studentId').removeAttr('style')
						   .prop('readonly', false)
						   .val('');
			$('#textId').removeAttr('class', 'text-danger')
						.text('첫 글자 영문, 영문/숫자을 조합하여 6~14글자로 입력해주세요.');
			$('#btnId').prop('disabled', false);
			$('#btnIdReset').prop('disabled', true);
			successId = '';
		});

		// checkPw는 입력란에 8~20자를 적을 수 있고 영문자와 숫자, 특수문자를 포함하는 지 확인하기 위한 변수
		// checkPw2는 특수문자가 비닐번호에 하나라도 포함됬는지 확인하기 위한 변수
		var checkPw = /^[A-z0-9a-z~!@#$%^&*()_+|<>?:{}]{8,20}$/;
		var checkPw2 = /[~!@#$%^&*()_+|<>?:{}]/;
		// studentPw에 대해서 blur로 감지
		// 만약 비닐번호가 특수문자를 포함하고 규약에 맞다면 Pw 활성화
		$('#studentPw, #studentPw2').blur(function(){
			if(checkPw.test($('#studentPw').val())){
				if(checkPw2.test($('#studentPw').val())){
					$('#textPw').text('');
					$(this).css('outline', '2px solid #5CD1E5');
					successPw = 'success';
				} else{
					$('#textPw').text('X 특수문자를 포합해주세요')
								.attr('class', 'text-danger');
					$(this).css('outline', '2px solid #FF0000');
					successPw = '';
				}
			} else{
				$('#textPw').text('X 영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.')
							.attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successPw = '';
			}

			if(successPw2 == 'success' && $('#studentPw').val() != $('#studentPw2').val()){
				$('#textPw2').text('X 비닐번호가 서로 다릅니다')
				   			 .attr('class', 'text-danger');
				$('#studentPw2').css('outline', '2px solid #FF0000');
				successPw2 = '';
			}
		});

		// studentPw2에 대한 체크 규약
		// studentPw2는 비닐번호를 제대로 입력하였는지 확인 하는 수단으로 studentPw와 studentPw2가 같을 경우 textPw2를 통해 출력
		$('#studentPw2').blur(function(){
			if(successPw == ''){
				$('#textPw2').text('X 비밀번호를 먼저 입력해주세요.')
							 .attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successPw2 = '';
			} else if($('#studentPw').val() == $('#studentPw2').val()){
				$('#textPw2').text('');
				$(this).css('outline', '2px solid #5CD1E5');
				successPw2 = 'success';
			} else{
				$('#textPw2').text('X 비닐번호가 서로 다릅니다')
						     .attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successPw2 = '';
			}
		});

		// studentName의 값이 들어가있다면 형식 확인 출력 없다면 공백
		$('#studentName').blur(function(){
			if($(this).val().length < 1){
				$('#textName').text('X 이름을 입력해주세요.')
							  .attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successName = '';
			} else{
				$('#textName').text('');
				$(this).css('outline', '2px solid #5CD1E5');
				successName = 'success';
			}
		});	

		// manageEmail 입력란에 @을 포합해야되는 등의 규약
		// 그것을 bur로 감지하여 text로 표시
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$('#studentEmail').blur(function(){
			if(checkEmail.test($(this).val())){
				$('#textEmail').text('X 중복 검사를 해주세요')
				 			   .attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successEmail = 'success';
			} else{
				$('#textEmail').text('X 이메일을 문자 @을 붙인 형식으로 입력해주세요.')
	 			   			   .attr('class', 'text-danger');
				$(this).css('outline', '2px solid #FF0000');
				successEmail = '';
			}
		});

		// studentEmail옆에 중복검사 버튼을 눌렀을 경우 ajax를 통해 중복검사
		// 중복되었을 경우 alert로 사용 가능 할 경우 confirm으로 알림창 표시
		$('#btnEmail').click(function(){
			if(successEmail == ''){
				alert('이메일 형식을 확인해 주세요.');
			} else{
				$.ajax({
					url:'${path}/studentOverlapEmail',
					type:'GET',
					data:{studentEmail: $('#studentEmail').val()},
					success:function(data){
						if(data.overlapEmail == 0){
							if(confirm('사용 가능한 이메일입니다. 사용하시겠습니까?')){
								$('#studentEmail').prop('readonly', true)
												  .css('outline', '2px solid #5CD1E5');
								$('#btnEmail').prop("disabled", true);
								$('#btnEmailReset').prop('disabled', false);
								$('#textEmail').text('');
								successEmail = 'success';
							}
						} else{
							alert('중복 된 이메일입니다');
						}
					}
				});	
			}
		});

		// email과 관련된 옵션 초기값으로 초기화
		$('#btnEmailReset').click(function(){
			$('#studentEmail').removeAttr('style')
						   .prop('readonly', false)
						   .val('');
			$('#textEmail').removeAttr('class', 'text-danger')
						.text('첫 글자 영문, 영문/숫자을 조합하여 6~14글자로 입력해주세요.');
			$('#btnEmail').prop('disabled', false);
			$('#btnEmailReset').prop('disabled', true);
			successEmail = '';
		});

		// studentGender의 radio 버튼을 누를경우 선택을 한 것이므로 형식 확인 출력
		$('.studentGender').on('ropertychange change keyup paste input', function(){
			$('#textGender').text('');
			successGender = 'success';
		});

		// studentPhone을 총 3개로 나누고 그 중 2개에 규약 설정
		// 가운데 번호와 끝번호에는 4자리의 번호로만 이루어져야함
		var checkPhone2 = /^\d{4}$/;
		var checkPhone3 = /^\d{4}$/;

		// studentPhone을 첫번째를 실시간 입력감지하고 가운데랑 마지막 번호는 blur로 감지
		// 3개 다 규약에 맞는 값이 들어가야 완료
		$('#studentPhone1').on('ropertychange change keyup paste input', function(){
			if(!$(this).val() == ''){
				$(this).css('outline', '2px solid #5CD1E5');
				successPhone1 = 'success';
			} else{
				$(this).css('outline', '2px solid #FF0000');
				successPhone1 = '';
			}
			
			if(successPhone1 != '' && successPhone2 != '' && successPhone3 != ''){
				$('#textPhone').text('');
			} else{
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
	   			   			   .attr('class', 'text-danger');
			}
		});

		$('#studentPhone2').blur(function(){
			if(checkPhone2.test($(this).val())){
				$(this).css('outline', '2px solid #5CD1E5');
				successPhone2 = 'success';
			} else{
				$(this).css('outline', '2px solid #FF0000');
				successPhone2 = '';
			}
			
			if(successPhone1 != '' && successPhone2 != '' && successPhone3 != ''){
				$('#textPhone').text('');
			} else{
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
	   			   			   .attr('class', 'text-danger');
			}
		});

		$('#studentPhone3').blur(function(){
			if(checkPhone3.test($(this).val())){
				$(this).css('outline', '2px solid #5CD1E5');
				successPhone3 = 'success';
			} else{
				$(this).css('outline', '2px solid #FF0000');
				successPhone3 = '';
			}
			
			if(successPhone1 != '' && successPhone2 != '' && successPhone3 != ''){
				$('#textPhone').text('');
			} else{
				$('#textPhone').text('X 핸드폰 번호를 입력해주세요.')
				   			   .attr('class', 'text-danger');
			}
		});

		// studentAddressMain 옆에 있는 버튼을 누를경우 ajax를 통해 주소 검색란 표시
		// 테이블을 스크롤의 형태로 출력을 하고 a태그의 oneclick옵션을 이용하여 키 값을 스크립트의 함수로 옮겨준뒤 처리한다
		$('#btnAddress').click(function(){
			$('#addressTable').empty();
			$.ajax({
				url:'${path}/studentAddressSearch',
				type:'GET',
				data:{doro: $('#studentAddressMain').val()},
				success:function(data){
					if(data.addressList.length == 0){
						var strHeadSet = '<thead>';
						strHeadSet += '</tr><td>';
						strHeadSet += '검색 결과가 없습니다.';			
						strHeadSet += '<td></tr>';
						strHeadSet += '</thead>';
						$('#addressTable').append(strHeadSet);
						
						$('#studentAddressMain').css('outline', '2px solid #FF0000');
					} else{
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
				}
			});	
		});

		// 주소 검색 테이블에서 해당 버튼을 눌렀을 경우 studentAddressMain이 채워진다.
		function addressClick(dataSet){
			$('#studentAddressMain').val(dataSet);
			$('#addressTable').empty();
			$('#studentAddressMain').css('outline', '2px solid #5CD1E5')
									.prop('readonly', 'true');
			$('#btnAddress').prop('disabled', true);
			$('#btnAddressReset').prop('disabled', false);
			successAddressMain = 'success';
		}

		// addressMain과 관련된 옵션 초기값으로 초기화
		$('#btnAddressReset').click(function(){
			$('#studentAddressMain').removeAttr('style')
						   .prop('readonly', false)
						   .val('');
			$('#btnAddress').prop('disabled', false);
			$('#btnAddressReset').prop('disabled', true);
			successAddressMain = '';
		});

		// studentBirth의 input타입 birth를 선택을 하였다면 형식 확인 출력
		$('#studentBirth').on('ropertychange change keyup paste input', function(){
			$('#textBirth').text('');
			$(this).css('outline', '2px solid #5CD1E5');
			successBirth = 'success';
		});	

    </script>
</body>
</html>


















