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
        
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
	               <div class="col-md-1 col-lg-1"></div>
                   <div class="col-md-7 col-lg-7">
                       <div class="card" id="cardStyle" style="height:370px;">
	                       <div class="card-body">
	                       		<div class="row">
                          			<div class="col-lg-5 col-md-5"></div>
			           				<div class="col-lg-6 col-md-6">
				                       <a href="index.html">
				                            <b class="logo-icon">
				                            	<!-- 사이트 이름 옆 로고 -->
				                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
				                            </b>
											
											<!-- 사이트 이름 -->
				                            <span class="logo-text">
												GOODEE LMS
				                            </span>
				                        </a>
		                        	</div>
		                        </div>
		                        <br>
	                            <div id="loginSubTitle" class="text-center text-dark font-20">
                           			회원님의 아이디는 휴면상태로 전환되었습니다.
                           		</div>
                           		<div id="loginSubTitle" class="text-center">
                           			회원님은 로그인 한 지 6개월 이상이 지나 아이디가 휴면상태로 전환되었습니다.
                           		</div>
                           		<div id="loginSubTitle" class="text-center">
                           			본인확인 후 다시 LMS 사용이 가능합니다.
                          		</div>
                          		<div id="loginSubTitle" class="text-center">
                           			요청 버튼을 클릭하시면 본인 email로 인증번호가 전송됩니다.
                          		</div>
                          		<hr>
                          		<div class="row">
                          			<div class="col-lg-3 col-md-3"></div>
			           				<div class="col-lg-9 col-md-9">
			           					<input type="text" maxlength="4" name="numCk" id="numCk" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&emsp;
			           					<input type="text" id="numMsg" hidden="hidden">
			           					<input type="text" id="studentId" value="${studentId }" hidden="hidden">
			           					<span id="timer"></span>&emsp;
		                          		<button type="button" id="requestBtn" class="col-2 btn btn-outline-info font-weight-bold" style="color:black">요청</button>
	                          		</div>
	                          	</div>
	                          	<hr>
                          		<div class="row">
                          			<div class="col-lg-5 col-md-5"></div>
			           				<div class="col-lg-6 col-md-6">
		                          		<a class="col-2 btn btn-success font-3 border-rad popover-item" 
		                          			style="color:white" href="${path }/">취소</a>&emsp;&emsp;
		                          		<a class="col-2 btn btn-success font-3 border-rad popover-item" id="confirmBtn"
		                          			style="color:white">확인</a>
	                          		</div>
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
		$(document).ready(function(){
			let studentId= $('#studentId').val();
			let time=120;//2분
			let min="";//분
			let sec="";//초

			$('#requestBtn').click(function(){
				let timer = setInterval(function(){
					min=parseInt(time/60);
					sec= time%60;
					document.getElementById("timer").innerHTML = min + " : " + sec;
					time--;

					if(time<0){
						clearInterval(timer);
						}
					},1000)
				$.ajax({
					url:'${path}/studentDormantMsg/'+studentId,
					type:'GET',
					success:function(data){
						console.log(data);
						$('#numMsg').attr("value",data);
						//2분 후에 실행 => 인증번호 삭제
						setTimeout(function(data){
							$('#numMsg').removeAttr("value");
							},120000)
						}
					})
				})
			$('#confirmBtn').click(function(){
				if($('#numCk').val() != $('#numMsg').val()){
						alert("인증번호를 다시 확인해주세요");
					}else{
						alert("인증에 성공하였습니다.");
						$('#confirmBtn').attr("href","${path}/studentDormantReleaseSuccess/${studentId}");
					}
				})
			})

    </script>
</body>
<!-- 
인증번호를 세션으로 받을 생각도 해봤지만 restController를 사용하여 데이터타입int로 받아와서
input value에 입력하고 비교하는 방법으로 새로고침할 때, 뒤로가기, 페이지 끄고 다시 들어올 때
인증 번호를 사라지게 하기 때문에 쉬운 방법으로 구현하였다.
 -->
</html>