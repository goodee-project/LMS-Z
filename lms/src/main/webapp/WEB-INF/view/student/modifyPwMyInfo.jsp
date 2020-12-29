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
									<jsp:include page="/WEB-INF/view/student/inc/myInfoMenu.jsp" flush="false"></jsp:include>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body text-muted font-12">
                                <h4 class="card-title">Pw변경</h4>
                                <div class="mb-3">
	                            	비닐번호를 주기적으로 변경해주세요.
                            	</div>
                            	<form id="modifyPwMyInfo" method="post" action="${path}/student/modifyPwMyInfo">
	                                <table id="myInfoTable2" class="table table">
										<tr>
											<th class=" font-14 font-weight-medium text-dark">현재 비밀번호</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" id="studentPw" class="form-control-plaintext form-control-lg bg-light">
												<input type="hidden" id="accountId" name="accountId" value="${studentId}">
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 비밀번호</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" id="studentNewPw" class="form-control-plaintext form-control-lg bg-light" name="accountPw">
												<div id="textNewPw">
													영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.
												</div>
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 비밀번호 확인</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" class="form-control-plaintext form-control-lg bg-light" id="studentNewPw2">
												<div id="textNewPw2">
													비밀번호를 다시 한번 입력해주세요.
												</div>
											</td>
										</tr>
	                            	</table>
	                            	<div id="btnStyle">
		                            	<button type="button" class="btn btn-outline-secondary text-dark" id="btnReset">새로 입력</button>
		                            	<button type="button" class="btn btn-outline-secondary text-dark" id="btnResult">확인</button>
	                            	</div>
                            	</form>
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
		var studentPwCheck = '';
		var studentNewPwCheck = '';
		var studentNewPw2Check = '';
    
    	// 새로 입력 버튼 클릭 시 val값 초기화
		$('#btnReset').click(function(){
			$('#studentPw').val('');
			$('#studentNewPw').val('');
			$('#studentNewPw2').val('');
			$('#textNewPw').text('영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.')
  			   			   .attr('class', '');
			$('#textNewPw2').text('비밀번호를 다시 한번 입력해주세요.')
  			   			   .attr('class', '');
			studentPwCheck = '';
			studentNewPwCheck = '';
			studentNewPw2Check = '';
			alert('초기화 하였습니다.');
		});
		
		// 확인 버튼 클릭 시 각각의 입력 값 체크
		// 마지막으로 현재 패스워드가 맞는지 확인 후 판단
		$('#btnResult').click(function(){
			if(studentPwCheck == ''){
				alert('현재 비밀번호를 입력해주세요.');
			} else if(studentNewPwCheck == ''){
				alert('새 비밀번호를 형식에 맞게 입력해주세요.');
			} else if(studentNewPw2Check == ''){
				alert('새 비밀번호 확인을 형식에 맞게 입력해주세요.');
			} else{
				$.ajax({
					url:'${path}/student/myInfoPwCheck',
					type:'GET',
					// data타입을 accoutId에 세션값을, accountPw에 적은 값을 넘긴다
					data:{accountId: $('#accountId').val(), accountPw: $('#studentPw').val()},
					success:function(data){
						if(data.accountPwCheck == 0){
							alert('기존 비밀번호가 일치하지 않습니다.');
							$('#studentPw').val('');
							studentPwCheck = '';	
						} else{
							if(confirm('비밀번호를 변경하겠습니다')){
								alert('비밀번호를 변경하셨습니다. 로그인을 다시 해주세요.');
								$('#modifyPwMyInfo').submit();
							}
							
						}
					}
				});	
			}
		});

		// 현재 비밀번호 입력란에 값이 들어가면 check
		$('#studentPw').blur(function(){
			if($('#studentPw').val().length > 0){
				studentPwCheck = 'check';
			} else{
				studentPwCheck = '';
			}
		});

		// checkPw는 입력란에 8~20자를 적을 수 있고 영문자와 숫자, 특수문자를 포함하는 지 확인하기 위한 변수
		// checkPw2는 특수문자가 비닐번호에 하나라도 포함됬는지 확인하기 위한 변수
		var checkPw = /^[A-z0-9a-z~!@#$%^&*()_+|<>?:{}]{8,20}$/;
		var checkPw2 = /[~!@#$%^&*()_+|<>?:{}]/gi;
		// 새 비밀번호 입력란에 정규표현식이 맞는지 확인
		$('#studentNewPw').blur(function(){
			if(checkPw.test($('#studentNewPw').val())){
				if(checkPw2.test($('#studentNewPw').val())){
					$('#textNewPw').text('○ 사용 가능한 비밀번호힙니다.')
		   		      			   .attr('class', 'text-primary');
	      			studentNewPwCheck = 'check';
				} else{
					$('#textNewPw').text('X 비밀번호에 특수문자를 추가해주세요.')
		 			   		       .attr('class', 'text-danger');
					studentNewPwCheck = '';
				}
			} else if($('#studentNewPw').val().length < 1){
				$('#textNewPw').text('X 새 비밀번호를 입력해주세요.')
				 			   .attr('class', 'text-danger');
				studentNewPwCheck = '';
			} else{
				$('#textNewPw').text('X 비밀번호는 8~20까지 입력 가능합니다.')
	 			   			   .attr('class', 'text-danger');
				studentNewPwCheck = '';
			}
		});

		// 새 비밀번호 확인 입력란의 값이 새 비밀번호 입력란의 값과 같은지 확인
		$('#studentNewPw2').blur(function(){
			if($('#studentNewPw').val().length < 1){
				$('#textNewPw2').text('X 새 비밀번호를 다시 한번 입력해주세요.')
	   		      	  	 	    .attr('class', 'text-danger');
				studentNewPwCheck = '';
			} else{
				if($('#studentNewPw').val() == $('#studentNewPw2').val()){
					$('#textNewPw2').text('○ 입력한 비밀번호가 일치합니다.')
	      			  			   .attr('class', 'text-primary');
					studentNewPw2Check = 'check';
				} else{
					$('#textNewPw2').text('X 입력한 비밀번호가 서로 일치하지 않습니다.')
	      	  	 	    			.attr('class', 'text-danger');
					studentNewPwCheck = '';
				}
			}
		});
		
    </script>
</body>
</html>