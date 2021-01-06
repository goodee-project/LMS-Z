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
    <title>chart</title>
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
                    <div class="col-md-8 col-lg-8">
						<jsp:include page="/WEB-INF/view/manager/inc/chartMenu.jsp" flush="false"></jsp:include>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div>
	                            <div class="card-body">
	                           		<h4 class="card-title">● 강사 가입/탈퇴수</h4>   
									<div id="chartContainer">
										<canvas id="teacherInOutCountByYearChart"></canvas>
									</div>
									<div>
										<span id="teacherInOutCountByYear"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
</body>

   

<script>
	$('#teacherInOutCountByYearChart').remove();
	$("#chartContainer").append('<canvas id="teacherInOutCountByYearChart"></canvas>');
	$.ajax({
		url:'${path }/chart/teacherInOutCount/',
		type:'get',
		success:function(data){
			let ctx = document.getElementById('teacherInOutCountByYearChart').getContext('2d');
			let chart = new Chart(ctx,{
				type:'line',
				data:{
					labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
					datasets:[{
						label:data[0].account_state,
						backgroundColor:[
							'rgba(255, 99, 132, 0.2)'],
			            borderColor:[
				            'rgba(255, 99, 132, 0.2)'],    
			                data:[data[0].january,data[0].february,data[0].march,data[0].april,data[0].may,data[0].june,data[0].july,data[0].august,data[0].september,data[0].october,data[0].november,data[0].december],
			                file:false,
						},{
						label:data[1].account_state,
						backgroundColor:[
							'rgba(54, 162, 235, 0.2)'],
			            borderColor:[
			                'rgba(54, 162, 235, 0.2)'],    
			                data:[data[1].january,data[1].february,data[1].march,data[1].april,data[1].may,data[1].june,data[1].july,data[1].august,data[1].september,data[1].october,data[1].november,data[1].december],
						}]
					},
					options:{}
				});
			}
	});
	$('#teacherInOutCountByYear').html('teacherInOutCountByYear');
	$.ajax({
		
		url:'${path }/chart/teacherInOutCount/',
		type:'get',
		dataType: 'json',
		success:function(data){
			console.log(data);
			let html=`
				<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
					<thead>
						<tr>
							<th>계정상태</th>
							<th>january</th>
							<th>february</th>
							<th>march</th>
							<th>april</th>
							<th>may</th>
							<th>june</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].account_state}</td>
							<td>\${data[0].january}</td>
							<td>\${data[0].february}</td>
							<td>\${data[0].march}</td>
							<td>\${data[0].april}</td>
							<td>\${data[0].may}</td>
							<td>\${data[0].june}</td>
						</tr>
						<tr>
							<td>\${data[1].account_state}</td>
							<td>\${data[1].january}</td>
							<td>\${data[1].february}</td>
							<td>\${data[1].march}</td>
							<td>\${data[1].april}</td>
							<td>\${data[1].may}</td>
							<td>\${data[1].june}</td>
						</tr>
					</tbody>
				</table>
				<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
					<thead>
						<tr>
							<th>계정상태</th>
							<th>july</th>
							<th>august</th>
							<th>september</th>
							<th>october</th>
							<th>november</th>
							<th>december</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].account_state}</td>
							<td>\${data[0].july}</td>
							<td>\${data[0].august}</td>
							<td>\${data[0].september}</td>
							<td>\${data[0].october}</td>
							<td>\${data[0].november}</td>
							<td>\${data[0].december}</td>
						</tr>
						<tr>
							<td>\${data[1].account_state}</td>
							<td>\${data[1].july}</td>
							<td>\${data[1].august}</td>
							<td>\${data[1].september}</td>
							<td>\${data[1].october}</td>
							<td>\${data[1].november}</td>
							<td>\${data[1].december}</td>
						</tr>
					</tbody>
				</table>
				`;
			$('#teacherInOutCountByYear').html(html);
			}
	});
</script>
</html>