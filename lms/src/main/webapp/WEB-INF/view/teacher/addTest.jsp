<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>addTest</title>
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
        
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		        
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
		<div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">TEST</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-12 col-md-12">
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<h4 class="card-title">시험일정 등록</h4>

								<form method="post" id="addTest" action="${path}/teacher/addTest/${lectureNo}">
									<input type="hidden" name="lectureNo" value="${lectureNo}">
									<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
										<tr>
											<td style="width:10%;">시험내용</td>
											<td>
												<input class="form-control" type="text" name="testContent" id="testContent">
												<div id="checkContent"></div>
											</td>
										</tr>
										<tr>
											<td>시험 시작시간</td>
											<td>
												<input class="form-control" type="datetime-local" name="testStartdate" id="testStartdate">
												<div id="checkStart"></div>
											</td>
										</tr>
										<tr>
											<td>시험 종료시간</td>
											<td>
												<input class="form-control" type="datetime-local" name="testEnddate" id="testEnddate">
												<div id="checkEnd"></div>
											</td>
										</tr>
									</table>
									
									<a class="btn btn-outline-secondary" style="border-radius:4px;" href="${path}/teacher/testList/${lectureNo}">< 뒤로</a>
									<div style="float:right;">
										<button class="btn btn-success" style="border-radius:4px;" type="button" id="btn">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
	    var content = '';
		var startdate = '';
		var enddate = '';
		$('#btn').click(function(){
			if($('#testContent').val() == ''){
				$('#checkContent').text('시험내용을 입력해주세요.');
				content = '';
			}
			
			if($('#testStartdate').val() == ''){
				$('#checkStart').text('시작일을 선택해주세요.');
				startdate = '';
			}else{
				$('#checkStart').text('');
				startdate = 'success';
			}
			
			if($('#testEnddate').val() == ''){
				$('#checkEnd').text('종료일을 선택해주세요.');
				enddate = '';
			}else{
				$('#checkEnd').text('');
				enddate = 'success';
			}
			
			if(content == 'success' && startdate == 'success' && enddate == 'success'){
				$('#addTest').submit();
			}
		});
		
		$('#testContent').on('propertychange change keyup paste input', function(){
			if($('#testContent').val() == ''){
				$('#checkContent').text('시험내용을 입력해주세요.');
				content = '';
			}else{
				$('#checkContent').text('');
				content = 'success';
			}
		});
    </script>
</body>
</html>