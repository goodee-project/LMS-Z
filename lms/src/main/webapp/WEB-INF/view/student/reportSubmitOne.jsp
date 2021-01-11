<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/assets/images/favicon.png">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

		<jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
	<div class="page-wrapper">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-7 align-self-center">
					<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">과제 자세히 보기</h2>
					<div id="up"></div>
					<div id="add"></div>
					<span id="delUp"></span>
				</div>
			</div>
		</div>	
		<br>
			<div class="container-fluid">
				<div class="row">				
					<div class="col-lg-7 col-md-7">
				    	<div class="card" id="cardStyle">
				    		<div class="card-body">
				    			<div class="table-responsive">
           						<h4 class="card-title">제출 내용</h4>
								<table id="reporstSubmitOneTable" class="table table" style="margin-top: 20px; width=100; table-layout:fixed; word-break:break-all;">
									<c:if test="${!empty reportSubmit.reportSubmitContent}">	
										<tr>
											<td style="width:80px" class="border-0 font-14 font-weight-medium text-muted px-2">내용</td>
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">
													${reportSubmit.reportSubmitContent}
												</div>
											</td>
										</tr>
										<tr>	
											<td class="border-0 font-14 font-weight-medium text-muted px-2">점수</td> 
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">
													${reportSubmit.reportSubmitPoint}
												</div>
											</td>
										</tr>
										<tr>	
											<td class="border-0 font-14 font-weight-medium text-muted px-2">피드백</td>
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">
													${reportSubmit.reportSubmitFeedback}
												</div>
											</td>
										</tr>
										<tr>
											<td style="width:80px" class="border-0 font-14 font-weight-medium text-muted px-2">첨부파일</td>
											<c:forEach var="rsf" items="${reportSubmit.reportSubmitFile}">
												<c:if test="${!empty rsf.reportSubmitFileOriginal}">
													<tr>
														<td class="border-0 font-14 font-weight-medium text-muted px-2"></td>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4">
															<div class="d-flex no-block align-items-center">
																<a href="${path}/student/reportSubmitFileDownload/${rsf.reportSubmitFileUuid}">${rsf.reportSubmitFileOriginal}</a>
															</div>
														</td>				
													</tr>
												</c:if>	
												<c:if test="${empty rsf.reportSubmitFileOriginal}">
													<td class="font-weight-medium text-dark border-top-0 px-2">
														<div class="d-flex no-block align-items-center">
															등록된 첨부파일이 없습니다.
														</div>
													</td>						
												</c:if>
											</c:forEach>
										</tr>	
									</c:if>	
									<c:if test="${empty reportSubmit.reportSubmitContent}">
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												미제출 과제입니다.
											</div>
										</td>
									</c:if>
								</table>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-lg-5 col-md-5">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<h4 class="card-title">과제</h4>
							<div class="table-responsive">
									<table id="reportOneTable" class="table table" style="margin-top: 20px; table-layout:fixed; word-break:break-all;">
										<tr>	
											<td style="width:80px" class="border-0 font-14 font-weight-medium text-muted px-2">강의</td>
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">	
													${report.lectureNo} (${report.lecture.lectureName})
												</div>
											</td>
										</tr>	
										<tr>
											<td class="border-0 font-14 font-weight-medium text-muted px-2">제목</td>
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">	
													${report.reportTitle}
												</div>
											</td>
										</tr>	
										<tr>	
											<td class="border-0 font-14 font-weight-medium text-muted px-2">내용</td>
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">	
													 ${report.reportContent}
												</div>
											</td>
										</tr>	
										<tr>	
											<c:if test="${report.dateCha>0}">	
												<td class="border-0 font-14 font-weight-medium text-muted px-2">마감일</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${report.reportEnddate}(마감까지 ${report.dateCha}일)
													</div>
												</td>
											</c:if>
										</tr>
										<tr>	
											<c:if test="${report.dateCha==0}">	
												<td class="border-0 font-14 font-weight-medium text-muted px-2">제출기한</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														D-day
													</div>
												</td>
											</c:if>
										</tr>
										<tr>	
											<c:if test="${report.dateCha<0}">	
												<td class="border-0 font-14 font-weight-medium text-muted px-2">제출기한</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">	
													<div class="d-flex no-block align-items-center">
														과제가 마감되었습니다.
													</div>	
												</td>
											</c:if>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>	
					<input type="hidden" id="reportDateCha" value="${report.dateCha}">
					<input type="hidden" id="reportSubmitContent" value="${reportSubmit.reportSubmitContent}">
				</div>
			</div>
		</div>
	</div>
</body>
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
	$('#reportSubmitContent').each(function(index, item){
		let htmlAdd='<div><a type="button" class="btn btn-outline-secondary" href="${path}/student/reportSubmitAdd/${report.reportNo}/${studentId}">과제 작성</a></div>'
		let htmlUpdate='<span><a type="button" class="btn btn-outline-success" href="${path}/student/reportSubmitModify/${reportSubmit.reportNo}/${studentId}">과제 수정</a></span>'
		let htmlDelete='&emsp;<span><a type="button" class="btn btn-outline-danger" href="${path}/student/reportSubmitAllRemove?reportSubmitNo=${reportSubmit.reportSubmitNo}">과제 삭제</a></span>'
		if($(item).val()=='' && $('#reportDateCha').val()>=0){
			$('#add').append(htmlAdd);
		}
		if($(item).val()!='' && $('#reportDateCha').val()>=0){
			$('#add').append(htmlUpdate);
			$('#add').append(htmlDelete);
		}
		});

	$('#reportDateCha').each(function(index, item){
		let htmlUp='<h3>마감된 과제는 작성및 수정/삭제 할 수 없습니다.</h3>'	
		if($(item).val()<0){
			$('#up').append(htmlUp);
		}
	});
</script>
</html>