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
    <title>Lecture</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">Lecture</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">평가 ${testOne.multiplechoiceId}번</h4>
	                            <div>
	                            	<form method="post" action="${path}/student/answerMultiplechoice/${lectureNo}/${studentId}/${currentPage}">
		                            	<table id="lmsTable" class="table table" style="margin-top: 20px;text-align:center;">
											<tr>
												<td style="width:10%;">문제</td>
												<td>
													${testOne.multiplechoiceQuestion}
													<input type="text" name="multiplechoiceNo" value="${testOne.multiplechoiceNo}" class="text-dark" hidden="hidden">
													<input type="text" name="accountId" hidden="hidden" value="${studentId }">
												</td>
											</tr>
											<tr>
												<td>답</td>
												<td>
													<c:forEach var="i" begin="1" end="5">
														${i}&emsp;<input type="radio" name="answerSelect" value="${i}">&emsp;
													</c:forEach> 
												</td>
											</tr>
											<tr>
												<td>점수</td>
												<td>
													${testOne.multiplechoiceScore}
													<input type="text" name="score" value="${testOne.multiplechoiceScore}" hidden="hidden">
												</td>
											</tr>
											<c:forEach var="me" items="${testOne.multiplechoiceExampleList}">
												<tr>
													<td>보기 ${me.multiplechoiceExampleId}번</td>
													<td>${me.multiplechoiceExampleContent}</td>
												</tr>
											</c:forEach>
											<tr><td></td></tr>
										</table>
										
										<br>
										<div>
											<button class="btn btn-outline-success" style="float:right;" type="button" id="submitBtn">제출</button>
										</div>
									</form>
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
			$('#submitBtn').click(function(){
				//답 체크를 하지 않았을 때
				if($("input[name='answerSelect']:not(:checked)").length==5){
					alert("답을 입력해주세요")
				}else{
					//alert($("input[name='answerSelect']:checked").val())
					$('#submitBtn').removeAttr("type")
					$('#submitBtn').attr("type","submit")
				}
			})
		})
    </script>
</body>
</html>