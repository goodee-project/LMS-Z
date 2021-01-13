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
    <title>addSyllabus</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Syllabus</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-12 col-md-12">
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<h4 class="card-title">강의계획서 등록</h4>
            					
								<form id="syllabusForm" method="post" action="${path}/teacher/addSyllabus">
									<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
										<tr>
											<td style="width:10%;">강의계획</td>
											<td><textarea class="form-control" rows="5" cols="50" id="syllabuesContent" name="syllabusContent"></textarea></td>
										</tr>
										<tr>
											<td>강사 사인</td>
											<td>
												<canvas id="myCanvas" style="background-color: aliceblue" width="900" height="300"></canvas>
												<input type="hidden" id="syllabusTeachersign" name="syllabusTeachersign" value="">
												<div style="float:right;">
													<button class="btn btn-outline-secondary" style="border-radius:4px;" type="button" id="resetBtn">다시쓰기</button>
												</div>
											</td>
										</tr>
									</table>
									<div style="float:right;">
										
										<button class="btn btn-success" style="border-radius:4px;" type="button" onclick="resultBtn();">등록</button>	
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
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
		$('#resetBtn').click(function(){
			canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
		});	

		// oneclick 형태로 확인을 누르고 조건이 만족할 경우 그려진 사인과 content가 submit
		function resultBtn(){
			if(isCanvasBlank(canvas) == true){
				alert('강사 사인을 입력해주세요.');
			} else if($('#syllabuesContent').val().length < 1){
				alert('강의 계획을 입력해주세요.');
			} else{
				$('#syllabusTeachersign').val(canvas.toDataURL());
				$('#syllabusForm').submit();
			}
		}

		// 캔버스가 비었는지를 초반 DataURL가 비교
		function isCanvasBlank(canvas) {
		       var blank = document.createElement('canvas');
		       blank.width = canvas.width;
		       blank.height = canvas.height;

		       return canvas.toDataURL() == blank.toDataURL();
		}
	
		var canvas, context;
		canvas = document.getElementById("myCanvas");
		context = canvas.getContext("2d");
		 
		context.lineWidth = 2; // 선 굵기를 2로 설정
		context.strokeStyle = "blue";
		 
		// 마우스 리스너 등록. e는 MouseEvent 객체
		canvas.addEventListener("mousemove", function (e) { move(e) }, false);
		canvas.addEventListener("mousedown", function (e) { down(e) }, false);
		canvas.addEventListener("mouseup", function (e) { up(e) }, false);
		canvas.addEventListener("mouseout", function (e) { out(e) }, false);
		 
		// 드래깅동안, 처음 마우스가 눌러진 좌표
		var startX=0, startY=0;
		var drawing=false;
		function draw(curX, curY) {
		    context.beginPath();
		    context.moveTo(startX, startY);
		    context.lineTo(curX, curY);
		    context.stroke();
		}
		function down(e) {
		    startX = e.offsetX; startY = e.offsetY;
		    drawing = true;
		}
		function up(e) { drawing = false; }
		function move(e) {
			// 마우스가 눌러지지 않았으면 리턴
		    if(!drawing) return; 
		    var curX = e.offsetX, curY = e.offsetY;
		    draw(curX, curY);
		    startX = curX; startY = curY;
		}
		function out(e) { drawing = false; }
	</script>
</html>