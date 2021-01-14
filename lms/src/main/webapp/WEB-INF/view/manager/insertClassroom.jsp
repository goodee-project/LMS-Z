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
    <title>insertClassroom</title>
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
        
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">Classroom</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-10 col-md-10">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">강의실 추가</h4>
	                            	<form id="classroom" method="post" action="${path }/manager/insertClassroomAction">
		                            	<input type="hidden" name="classroomState" value="빈강의실">
		                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
											<tr>
												<th style="width:20%">강의실 호수 :</th>
												<td>
													<input class="form-control" style="width:120%;"type="text" id="classroomNumber" name="classroomNumber" >
													<div id="number"></div>
												</td>
												<td><button class="btn btn-outline-secondary" style="border-radius: 4px;"id="btnNumber" type="button" disabled="disabled">중복검사</button></td>
											</tr>
											<tr>
												<th>강의실 크기 :</th>
												<td>
													<input class="form-control" style="width:120%;" type="text" id="classroomSize" name="classroomSize">
													<div id="size"></div>
												</td>
											</tr>
											<tr>
												<th>강의실 인원 :</th>
												<td>
													<input class="form-control" style="width:120%;" type="text" id="classroomTotal" name="classroomTotal">
													<div id="total"></div>
												</td>
											</tr>
										</table>
								 		<a  class="btn btn-outline-secondary" style="border-radius: 4px;"href="${path }/manager/classroomList/1">돌아가기</a>
									<button class="btn btn-success" style="border-radius: 4px; float:right;" id="btn" type="button">강의실 추가</button>
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
		var num = '';
		var size= '';
		var total = '';
		$('#btn').click(function(){
			if(num== 'success' && size== 'success' && total== 'success'){
				$('#classroom').submit();
				} else{
					alert('형식을 확인하세요');
				}
		})
		var checkId = /^[0-9]{1,3}$/;
		var checkNum = /^[0-9]{0,9}$/;
		$('#classroomNumber').on('propertychange change keyup paste input', function(){
			if(checkNum.test($('#classroomNumber').val())){				
				$('#number').text('중복 검사를 해주세요');
				$('#btnNumber').prop('disabled', false);				
			}else{
				$('#number').text('숫자를 입력해주세요');
				$('#btnNumber').prop('disabled', true);
				num = '';	
			}
		});
		$('#btnNumber').click(function(){
			$.ajax({
				url:'${path}/manager/classroomCk',
				type:'GET',
				data:{classroomNumber: $('#classroomNumber').val()},
				success:function(data){
					if(data.classroomNum == 0){
						if(confirm('추가 가능한 강의실입니다.')){
							$('#classroomNumber').prop('readonly', true);
							$('#btnNumber').prop("disabled", true);
							$('#number').text('');
							num = 'success';
						}
					} else{
						alert('이미 강의실이 등록되어 있습니다.');
						num = '';
					}
				}
			});	
		});
		$('#classroomSize').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#classroomSize').val())){				
				$('#size').text('');
				size='success';		
			}else{
				$('#size').text('1~3자리 숫자를 입력해주세요');
				size = '';	
			}
		});
		$('#classroomTotal').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#classroomTotal').val())){				
				$('#total').text('');
				total='success';			
			}else{
				$('#total').text('1~3자리 숫자를 입력해주세요');
				total = '';	
			}
		});
	</script>
</body>
</html>