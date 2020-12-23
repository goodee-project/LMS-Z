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
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
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
									<jsp:include page="/WEB-INF/view/manager/inc/myInfoMenu.jsp" flush="false"></jsp:include>
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
										<th class=" font-14 font-weight-medium text-dark">아이디</th>
										<td class=" font-14 font-weight-medium text-dark">${managerOne.managerId}</td>
										<td></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">이름</th>
										<td class=" font-14 font-weight-medium text-dark"><input type="text" id="managerName" value="${managerOne.managerName}"></td>
										<td><button type="button" id="btnName" class="btn btn-dark">개명</button>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">이메일</th>
										<td class=" font-14 font-weight-medium text-dark"><input type="text" id="managerEmail" value="${managerOne.managerEmail}"></td>
										<td><button type="button" id="btnEmail" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">핸드폰 번호</th>
										<td class=" font-14 font-weight-medium text-dark">
											<select id="managerPhone1">
												<option value="${managerPhone1}">${managerPhone1}</option>
												<c:if test="${managerPhone1 == '010'}">
													<option value="011">011</option>
												</c:if>
												<c:if test="${managerPhone1 == '011'}">
													<option value="010">010</option>
												</c:if>
											</select>-
											<input type="text" id="managerPhone2" value="${managerPhone2}">-
											<input type="text" id="managerPhone3" value="${managerPhone3}">
											<input type="hidden" id="managerPhone" name="managerPhone" value="${managerOne.managerPhone}">
										</td>
										<td><button type="button" id="btnPhone" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">성별</th>
										<td class=" font-14 font-weight-medium text-dark">
											<c:if test="${managerOne.managerGender == '남'}">
												<input type="radio" id="managerGender" name="managerGender" value="남" checked>남
												<input type="radio" id="managerGender" name="managerGender" value="여">여
											</c:if>
											<c:if test="${managerOne.managerGender == '여'}">
												<input type="radio" id="managerGender" name="managerGender" value="남">남
												<input type="radio" id="managerGender2" name="managerGender" value="여" checked>여
											</c:if>
										</td>
										<td><button type="button" id="btnGender" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">생일</th>
										<td class=" font-14 font-weight-medium text-dark"><input type="date" id="managerBirth" value="${managerOne.managerBirth}"></td>
										<td><button type="button" id="btnBirth" class="btn btn-dark">변경</button></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">주소</th>
										<td class=" font-14 font-weight-medium text-dark">${managerOne.managerAddressMain}&nbsp;${managerOne.managerAddressSub}</td>
										<td><a href="${path}/manager/myInfoAddress/${managerId}" class="btn btn-dark">변경</a></td>
									</tr>
									<tr>
										<th class=" font-14 font-weight-medium text-dark">사진</th>
										<td class=" font-14 font-weight-medium text-dark">
											<form id="managerImageForm" method="post" enctype="multipart/form-data" action="${path}/manager/modifyImageMyInfo">
												<img src="${path}/images/${managerOne.managerImage}" id="preview" style="width:170px; height:200px;"/>
												
												<input type="file" name="managerImage" id="imgSelector"/>
												<input type="hidden" name="managerId" value="${managerId}">
											</form>
										</td>
										<td><button id="btnImage" type="button" class="btn btn-dark">변경</button></td>
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
    
    <script>
    	// 이름에 대한 변경값이 있을 경우에만 crud로 넘어감
		$('#btnName').click(function(){
			if($('#managerName').val() == '${managerOne.managerName}'){
				alert('현재 이름과 동일합니다.');
			} else if($('#managerName').val().length < 1){
				alert('사용하실 이름을 입력해주세요.');
			} else{
				if(confirm('입력하신 이름으로 변경합니다.')){
					location.href = '${path}/manager/modifyNameMyInfo/${managerId}/'+$('#managerName').val();
				}
			}
		});

		// 이메일에 대한 정규 표현식
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일에 대한 변경 값이 있고, 정규표현식에 만족할 경우에만 crud로 넘어감
		$('#btnEmail').click(function(){
			if($('#managerEmail').val() == '${managerOne.managerEmail}'){
				alert('현재 이메일과 동일합니다.');
			} else if($('#managerEmail').val().length < 1){
				alert('사용하실 이메일을 입력해주세요.');
			} else if(!checkEmail.test($('#managerEmail').val())){
				alert('이메일을 바른 형식으로 입력해주세요.');
			} else{
				$.ajax({
					url:'${path}/manager/myInfoByOverlapEmail',
					type:'GET',
					data:{managerEmail: $('#managerEmail').val()},
					success:function(data){
						if(data.managerEmailCheck == 0){
							if(confirm('입력하신 이메일로 변경합니다')){
								location.href = '${path}/manager/modifyEmailMyInfo/${managerId}/'+$('#managerEmail').val();
							}
						} else{
							alert('사용하실 이메일이 중복되었습니다.');
						}
					}
				});	
			}
		});
		// 최종 보내는 키 값
		var managerPhone = '';
		// 핸드폰 번호에 대한 정규표현식
		var checkPhone2 = /^\d{4}$/;
		var checkPhone3 = /^\d{4}$/;
		// 핸드폰 번호에 대한 변경 값이 있거나 정규표현식을 만족한 경우에만 crud로 넘어감
		$('#btnPhone').click(function(){
			managerPhone = $('#managerPhone1').val() + $('#managerPhone2').val() + $('#managerPhone3').val();
			if(managerPhone == $('#managerPhone').val()){
				alert('현재 핸드폰 번호와 동일합니다.');
			} else if($('#managerPhone2').val() == '' || $('#managerPhone3').val() == ''){
				alert('사용하실 핸드폰 번호를 입력해주세요.');
			} else if(!checkPhone2.test($('#managerPhone2').val()) || !checkPhone3.test($('#managerPhone3').val())){
				alert('핸드폰 번호를 바른 형식으로 입력해주세요.');
			} else{
				if(confirm('입력하신 핸드폰 번호로 변경합니다')){
					location.href = '${path}/manager/modifyPhoneMyInfo/${managerId}/'+ managerPhone;
				}
			}
		});

		// 성별에 대한 변경 값이 있을 경우에만 crud로 넘어감
		$('#btnGender').click(function(){
			if($('#managerGender:checked').val() == '${managerOne.managerGender}'){
				alert('현재 성별과 동일합니다.');
			} else{
				if(confirm('입력하신 성별로 변경합니다')){
					location.href = '${path}/manager/modifyGenderMyInfo/${managerId}/'+$('#managerGender:checked').val();
				}
			}
		});

		// 생일에 대한 변경 값이 있을 경우에만 crud로 넘어감
		$('#btnBirth').click(function(){
			if($('#managerBirth').val() == '${managerOne.managerBirth}'){
				alert('현재 생일과 동일합니다');
			} else{
				if(confirm('입력하신 생일로 변경합니다')){
					location.href = '${path}/manager/modifyBirthMyInfo/${managerId}/'+$('#managerBirth').val();
				}
			}
		});

		// 이미지 변경 값이 있는지 확인하는 변수
		var imageCheck = '';
		// 이미지에 대한 제약조건 명시
		$('#imgSelector').change(function(){
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg', 'jfif']) == -1) {
                alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                $(this).val('');
            } else {
            	 setImageFromFile(this, '#preview');
            	 imageCheck = 'check';
            }
		});

		// 이미지 미리보기에 대한 함수 정의
		function setImageFromFile(input, expression) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $(expression).attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}

		// 변경 버튼을 누를경우 submit
		$('#btnImage').click(function(){
			if(imageCheck == ''){
				alert('변경하실 이미지를 선택해주세요.');
			} else{
				$('#managerImageForm').submit();
			}
		});

    </script>
</body>
</html>
























