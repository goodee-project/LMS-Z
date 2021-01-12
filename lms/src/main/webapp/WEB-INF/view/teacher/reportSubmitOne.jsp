<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위의 사이트 아이콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/assets/images/favicon.png">
<title>reportSubmitOne</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">과제 상세보기</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href=""></a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

		<div class="container-fluid">
		<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="card" id="cardStyle">
                            <div class="card-body">

								<table class="table table" id="tableOneStyle">
									<tr>
										<th>과제제출 제목</th>
										<td>${reportSubmitOne.reportSubmitTitle}</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${reportSubmitOne.reportSubmitWriter}</td>
									</tr>
									<tr>
										<th>과제제출 내용</th>
										<td><textarea class="form-control" rows="4" cols="50" readonly>${reportSubmitOne.reportSubmitContent}</textarea></td>
									</tr>
									<tr>
										<th>과제 점수</th>
										<td>${reportSubmitOne.reportSubmitPoint}점</td>
									</tr>
									<tr>
										<th>피드백</th>
										<td><textarea class="form-control" rows="4" cols="50" readonly>${reportSubmitOne.reportSubmitFeedback}</textarea></td>
									</tr>
									<tr>
									<th>파일</th>
										<c:forEach var="rf" items="${reportSubmitOne.reportSubmitFile}">
											<c:if test="${rf.reportSubmitFileUuid == null}">
												<td colspan="6">첨부파일이 없습니다.</td>
											</c:if>
											<c:if test="${rf.reportSubmitFileUuid != null}">
												<td><a href="${path}/teacher/questionFileDownload/${rf.reportSubmitFileUuid}">${rf.reportSubmitFileOriginal}</a></td>
											</c:if>
										</c:forEach>
									</tr>
								</table>
	
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<form id="modifyReportSubmit" method="post" action="${path}/teacher/modifyReportSubmit">
									<input type="hidden" name="reportSubmitNo" value="${reportSubmitOne.reportSubmitNo}">
									<table class="table table" id="tableOneStyle">
										<tr>
											<th>점수</th>
											<td>
												<input class="form-control" style="width:100%;"type="text" id="reportSubmitPoint" name="reportSubmitPoint">
												<div id = "score"></div>
											</td>
										</tr>
										<tr>
											<th>피드백</th>
											<td>
												<textarea class="form-control" style="width:100%;" rows="3" cols="50" id="reportSubmitFeedback" name="reportSubmitFeedback"></textarea>
												<div id = "feedBack"></div>
											</td>
										</tr>
									</table>
									
									<a class="btn btn-outline-secondary text-dark" href="${path}/teacher/reportOne/${reportSubmitOne.reportNo}">뒤로가기</a>
									<button class="btn btn-success" style="border-radius: 4px; float:right;" id="btn" type="button">점수 추가</button>
							</form>
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
		var score = '';
		$('#btn').click(function(){
			if(score== 'success'){
				$('#modifyReportSubmit').submit();
				} else{
					alert('형식을 확인하세요');
				}
		})
		var checkId = /^[0-9]{1,3}$/;
		$('#reportSubmitPoint').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#reportSubmitPoint').val())){				
				$('#score').text('');
				score='success';
			}else{
				$('#score').text('1~3자리 숫자를 입력해주세요');
				score = '';
			}
		});
	</script>
</body>
</html>