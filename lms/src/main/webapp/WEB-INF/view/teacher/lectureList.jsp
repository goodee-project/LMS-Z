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
    <title>lecture</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">강의 목록</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-12 col-md-12">
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<div class="row">
            						<c:forEach var="l" items="${list}">
            							<div class="col-sm-1 col-lg-1"></div>
		            					<div class="col-sm-4 col-lg-4 text-center">
											<div class="card" id="cardStyle2">
												<div id="modifyBackground${l.lectureNo}" class="text-right modifyBackground">
													<a href="javascript:click()" onclick="colorChange('red', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:red'></i></a>
													<a href="javascript:click()" onclick="colorChange('orange', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:orange'></i></a>
													<a href="javascript:click()" onclick="colorChange('yellow', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:yellow'></i></a>
													<a href="javascript:click()" onclick="colorChange('green', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:green'></i></a>
													<a href="javascript:click()" onclick="colorChange('blue', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:blue'></i></a>
													<a href="javascript:click()" onclick="colorChange('indigo', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:indigo'></i></a>
													<a href="javascript:click()" onclick="colorChange('purple', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:purple'></i></a>
													<a href="javascript:click()" onclick="colorChange('black', ${l.lectureNo})"><i class='fas fa-square' style='font-size:24px;margin-top:7px; color:black'></i></a>
													<button class="btn btn-sm btn-outline-secondary" style="border-radius: 4px; margin-left:10%;margin-bottom: 3px;" type="button" onclick="resetBtn('${l.lectureNo}')">초기화</button>
													<button class="btn btn-sm btn-outline-secondary" style="border-radius: 4px; margin-bottom: 3px;margin-right:2%;" type="button" onclick="resultBtn('${l.lectureNo}')">저장</button>
												</div>
												<div id="modifyForm${l.lectureNo}" class="text-right modifyForm" style="margin-bottom: 3px;margin-right:2%;margin-top: 3px;">
													<button class="btn btn-sm btn-outline-secondary" style="border-radius: 4px;" type="button" onclick="modifyBtn('${l.lectureNo}')">수정</button>
												</div>
												<div>
													<canvas id="myCanvas${l.lectureNo}" height="250" style="background-image: url('${l.lectureImage}'); background-color:${l.lectureImageColor}; background-repeat: no-repeat; width: 100%; background-position: center center"></canvas>
												</div>
												<canvas class="myCanvas2"></canvas>
												<div class="card-body">
													<h4 class="card-title">${l.lectureName} (${l.lectureTotal})</h4>
													<p class="card-text">${l.lectureStartdate} ~ ${l.lectureEnddate}</p>
													<a href="${path}/teacher/lectureOne/${l.lectureNo}" class="btn btn-primary" style="border-radius: 4px;">상세보기</a>
												</div>
											</div>
		            					</div>
		            					<div class="col-sm-1 col-lg-1"></div>
	            					</c:forEach>
            					</div>
            					
            					<br>
            					<div id="paging" style="text-align: center; padding: 7px;">
							   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
							   		<c:if test="${startPage!=1 && lastPage!=1}">
							    		<span>
							    			<a href="${path}/teacher/lectureList/${teacherId}/${startPage-10}">이전</a>
							    		</span>
							   		</c:if>
							   		<!-- lastPage가 10개를 채울수 없을 때 -->
							   		<c:if test="${startPage+9 > lastPage }">
							     	<c:forEach var="i" begin="${startPage }" end="${lastPage}">
							     		<!-- 현재 페이지일 경우 -->
							     		<c:if test="${currentPage == i }">
								      		<span>
								      			<a id="pagingStyle" class="bg-secondary font-18">${i}</a>
								      		</span>
							     		</c:if>
							     		<!-- 현재 페이지가 아닐 경우 -->
							     		<c:if test="${currentPage != i }">
								      		<span>
								      			<a class="font-18" href="${path}/teacher/lectureList/${teacherId}/${i}">${i}</a>
								      		</span>
							     		</c:if>
							     	</c:forEach>
							    	</c:if>
							    	<c:if test="${startPage+9<lastPage }">
							    		<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
								     		<!-- 현재 페이지일 경우 -->
								     		<c:if test="${currentPage == i }">
									      		<span>
									      			<a id="pagingStyle" class="bg-secondary font-18">${i}</a>
									      		</span>
								     		</c:if>
								     		<!-- 현재 페이지가 아닐 경우 -->
								     		<c:if test="${currentPage != i }">
									      		<span>
									      			<a class="font-18" href="${path}/teacher/lectureList/${teacherId}/${i}">${i}</a>
									      		</span>
								     		</c:if>
							     		</c:forEach>
							    	</c:if>
							    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
							    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
								     	<span>
								     		<a href="${path}/teacher/lectureList/${teacherId}/${startPage+10}">다음</a>
								     	</span>
							    	</c:if>
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
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <script>
		var myColor = '';
		
		$('.myCanvas2').hide();
    
		function colorChange(color, lectureNo){
			if(color == 'red'){
				$('#myCanvas'+lectureNo).css('background-color', 'red');
				myColor = 'red';
			}
			if(color == 'orange'){
				$('#myCanvas'+lectureNo).css('background-color', 'orange');
				myColor = 'orange';
			}
			if(color == 'yellow'){
				$('#myCanvas'+lectureNo).css('background-color', 'yellow');
				myColor = 'yellow';
			}
			if(color == 'green'){
				$('#myCanvas'+lectureNo).css('background-color', 'green');
				myColor = 'green';
			}
			if(color == 'blue'){
				$('#myCanvas'+lectureNo).css('background-color', 'blue');
				myColor = 'blue';
			}
			if(color == 'indigo'){
				$('#myCanvas'+lectureNo).css('background-color', 'indigo');
				myColor = 'indigo';
			}
			if(color == 'purple'){
				$('#myCanvas'+lectureNo).css('background-color', 'purple');
				myColor = 'purple';
			}
			if(color == 'black'){
				$('#myCanvas'+lectureNo).css('background-color', 'black');
				myColor = 'black';
			}
		}

		function modifyBtn(lectureNo){
			$('#modifyBackground'+lectureNo).show();
			$('#modifyForm'+lectureNo).hide();
			canvas = document.getElementById("myCanvas"+lectureNo);
			context = canvas.getContext("2d");
			document.getElementById("myCanvas"+lectureNo).getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
			$('#myCanvas'+lectureNo).removeAttr('style');
			$('#myCanvas'+lectureNo).css('width', '100%');
			
			context.lineWidth = 2; // 선 굵기를 2로 설정
			context.strokeStyle = "white";
				 
			// 마우스 리스너 등록. e는 MouseEvent 객체
			canvas.addEventListener("mousemove", function (e) { move(e) }, false);
			canvas.addEventListener("mousedown", function (e) { down(e) }, false);
			canvas.addEventListener("mouseup", function (e) { up(e) }, false);
			canvas.addEventListener("mouseout", function (e) { out(e) }, false);
			
		}
    
		function resetBtn(lectureNo){
			document.getElementById("myCanvas"+lectureNo).getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
			$('#myCanvas'+lectureNo).removeAttr('style');
			$('#myCanvas'+lectureNo).css('width', '100%');
		}

		// oneclick 형태로 확인을 누르고 조건이 만족할 경우 그려진 사인과 content가 submit
		function resultBtn(lectureNo){
			var dataURL = canvas.toDataURL();
			$.ajax({
				url:'${path}/teacher/lectureImage',
				type:'GET',
				data:{lectureNo: lectureNo, lectureImage: dataURL, lectureImageColor: myColor},
				success:function(data){
					alert("변경 완료");
					$('#modifyBackground'+lectureNo).hide();
					$('#modifyForm'+lectureNo).show();

					canvas = document.getElementById("myCanvas2");
					context = canvas.getContext("2d");
					
					context.lineWidth = 2; // 선 굵기를 2로 설정
					context.strokeStyle = "white";
					 
					// 마우스 리스너 등록. e는 MouseEvent 객체
					canvas.addEventListener("mousemove", function (e) { move(e) }, false);
					canvas.addEventListener("mousedown", function (e) { down(e) }, false);
					canvas.addEventListener("mouseup", function (e) { up(e) }, false);
					canvas.addEventListener("mouseout", function (e) { out(e) }, false);
				}
				
			});	
		}

		$('.modifyBackground').hide();
		
		var canvas, context;

		canvas = document.getElementById("myCanvas2");
		context = canvas.getContext("2d");
		
		context.lineWidth = 3; // 선 굵기를 2로 설정
		context.strokeStyle = "white";
		 
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
</body>
</html>


