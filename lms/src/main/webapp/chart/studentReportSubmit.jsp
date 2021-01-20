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
						<canvas id="horizontalBarChart">
						</canvas>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-lg-12">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<h4 class="card-title">● 과제 점수 및 평균 점수</h4>
								<div class="table-responsive">
									<table class="table no-wrap v-middle mb-0">
										<thead>
											<tr id="lectureList" class="border-top-0 px-2 py-4">
												
											</tr>
										</thead>
										<tbody>
											<tr id="score" class="border-top-0 px-2 py-4">
											</tr>
											<tr id="scoreAvg">
											</tr>
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
			let studentId = '<%=(String)session.getAttribute("studentId")%>';
			let space =
				`
				<td></td>
				`
			$('#lectureList').append(space);
			let scoreTitle=
				`
				<td>
					성적
				</td>
				`
			let scoreAvgTitle=
				`
				<td>
					강의 평균 성적
				</td>
				`
			$('#score').append(scoreTitle);
			$('#scoreAvg').append(scoreAvgTitle);
			
			$.ajax({
				url:'${path}/chart/reportSubmit/'+studentId,
				type:"get",
				success:function(data){
					console.log(data);
					for(let i=0;i<data.lectureName.length;i++){
						let lectureName=
							`
							<td>
								\${data.lectureName[i]}
							</td>	
							`
						lectureList += "'"+data.lectureName[i]+"'";
						if(i<data.lectureName.length-1){
							lectureList += ",";
						}
						console.log(lectureList);
						$('#lectureList').append(lectureName);
					}
					for(let i=0;i<data.score.length;i++){
						let score=
							`
							<td>
								\${data.score[i]}
							</td>	
							`
						$('#score').append(score);
					}
					for(let i=0;i<data.scoreAvg.length;i++){
						let scoreAvg=
							`
							<td>
								\${data.scoreAvg[i]}
							</td>	
							`
						$('#scoreAvg').append(scoreAvg);
					}
					
					var ctx = document.getElementById('horizontalBarChart');
					var chart = new Chart(ctx,{
						type:'horizontalBar',
						data:{
							labels:[data.lectureName[0],data.lectureName[1],data.lectureName[2],data.lectureName[3],data.lectureName[4]],
							datasets:[{
								label:'과제 제출 빈도',
								backgroundColor:'rgba(255, 99, 132, 0.5)',
					            borderColor: 'rgba(255, 99, 132, 1)',
						        data:[
						        	data.score[0],
						        	data.score[1],
						        	data.score[2],
						        	data.score[3],
						        	data.score[4]
							        ]
								}, {
								label:'강의별 총 과제',
								backgroundColor:'rgba(54, 162, 235, 0.5)',
						        borderColor:'rgba(54, 162, 235, 1)',
							    data:[
							    	data.scoreAvg[0],
						    		data.scoreAvg[1],
						    		data.scoreAvg[2],
						    		data.scoreAvg[3],
						    		data.scoreAvg[4]
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