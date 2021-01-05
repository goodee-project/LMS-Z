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
    <title>CourseGrades</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>
<body>
	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
        <jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
        
        <div class="page-wrapper">
            <div class="page-breadcrumb">
            	<div class="row">
					<div class="col-md-8 col-lg-8">
						<canvas id="barChart">
						</canvas>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-lg-12">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<h4 class="card-title">● 성적 및 평균 점수</h4>
								<div class="table-responsive">
									<table class="table no-wrap v-middle mb-0">
										<thead>
										<tr class="border-top-0 px-2 py-4">
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													JAVA123
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													fintech
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													JAVAcc
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													Doraemon
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													DigitalEngineering
												</span>
											</td>
											<td class="font-14 font-weight-medium text-muted px-2">
												<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
													Cshop
												</span>
											</td>
										</tr>
										</thead>
										<tbody id="tableBody">
										
										</tbody>
									</table>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script>
		$(document).ready(function(){
			//script에서 session 값 받기
			let studentId = '<%=(String)session.getAttribute("studentId")%>'
			$.ajax({
				url:'${path}/chart/studentCourseGrades/'+studentId,
				type:"get",
				success:function(data){
						let html=
							`
							<tr class="border-top-0 px-2 py-4">
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										성적
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.JAVA123}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.fintech}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.JAVAcc}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.Doraemon}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.DigitalEngineering}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.Cshop}
									</span>
								</td>
							</tr>
							<tr class="border-top-0 px-2 py-4">
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										강의 평균 성적
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.JAVA123Avg}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.fintechAvg}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.JAVAccAvg}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.DoraemonAvg}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.DigitalEngineeringAvg}
									</span>
								</td>
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.CshopAvg}
									</span>
								</td>
							</tr>
							`
						$('#tableBody').html(html)
					var ctx = document.getElementById('barChart');
					var chart = new Chart(ctx,{
						type:'bar',
						data:{
							labels:['JAVA123','fintech','JAVAcc','Doraemon','DigitalEngineering','Cshop'],
							datasets:[{
								label:'강의별 성적',
								backgroundColor:'rgba(255, 99, 132, 0.5)',
					            borderColor: 'rgba(255, 99, 132, 1)',
						        data:[
									data.JAVA123,
									data.fintech,
									data.JAVAcc,
									data.Doraemon,
									data.DigitalEngineering,
									data.Cshop
							        ]
								}, {
								label:'강의별 평균 성적',
								backgroundColor:'rgba(54, 162, 235, 0.5)',
						        borderColor:'rgba(54, 162, 235, 1)',
							    data:[
									data.JAVA123Avg,
									data.fintechAvg,
									data.JAVAccAvg,
									data.DoraemonAvg,
									data.DigitalEngineeringAvg,
									data.CshopAvg
								    ]
								}]
							}
						})
					}
				})
			})
    </script>
</body>
</html>