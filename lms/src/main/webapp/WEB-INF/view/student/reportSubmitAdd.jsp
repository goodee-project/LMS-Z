<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 위의 사이트 아이콘 -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/assets/images/favicon.png">
<title>Insert title here</title>
<link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
<link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
<link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
<link href="${path}/dist/css/style.min.css" rel="stylesheet">
<link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
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
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">과제 작성</h2>
					</div>
				</div>
			</div>	
			<br>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 col-md-8">
						<div class="card" id="cardStyle">
							<div class="card-body">
							<h4 class="card-title">제출 과제</h4>
								<div class="table-responsive">
									<form method="post" id="reportSubmitAdd" action="${path}/student/reportSubmitAdd/${studentId}" enctype="multipart/form-data">	
										<table id="reportSubmitTable" class="table table" style="margin-top: 10px;">
											<tr>
												<td class="border border-0">
													제목 <input type="text" name="reportSubmitTitle" id="reportSubmitTitle" style="width:420px">
												</td>
											</tr>
											<tr>
												<td class="border border-0">
													<textarea class="form-control" style="width:80%;" style="resize:none;overflow:visible;" rows="10" name="reportSubmitContent" id="reportSubmitContent"></textarea>
												</td>
											</tr>
										</table>	
										<table id="reportFileTable" class="table table" style="margin-top:20px;">
											<tr>
												<td class="border border-0">첨부파일</td>
												<td class="border border-0" style="width:55%;">
													<div id="fileinput"></div>
												</td>
												<td class="border border-0">
													<div>
														<button type="button" class="btn btn-outline-success" id="addBtn">파일 추가</button>
														<button type="button" class="btn btn-outline-danger" id="delBtn">파일 삭제</button>
													</div>
												</td>
											</tr>
										</table>	
										<table id="reportFileTable" class="table table" style="margin-top:20px;">
											<tr class="border border-0">
												<td class="border border-0">
													<button class="btn btn-outline-success" type="button" id="submitBtn">과제 제출</button>
													<a type="button" class="btn btn-outline-secondary" href="${path}/student/reportSubmitOne/${report.reportNo}/${studentId}">이전 페이지</a>
												</td>
											</tr>	
										</table>
										<input type="hidden" readonly="readonly" name="reportSubmitWriter" value="${student.studentName}">
										<input type="hidden" name="reportNo" readonly="readonly" value="${report.reportNo}">
										<input type="hidden" name="accountId" value="${studentId}">
									</form>	
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<h4 class="card-title">과제</h4>
								<div class="table-responsive">
									<table id="reportTable" class="table table" style="margin-top: 10px; table-layout:fixed; word-break:break-all;">
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
												<td class="border-0 font-14 font-weight-medium text-muted px-2">과제 시작일</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">	
														${report.reportStartdate}
													</div>
												</td>
											<tr>	
												<td class="border-0 font-14 font-weight-medium text-muted px-2">과제 마감일</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">	
														${report.reportEnddate}
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
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
	$(document).ready(function() {
		// SmartEditor2 스크립트 추가
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'reportSubmitContent',
			sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		})
		$('#addBtn').click(function(){
			let html= '<div><input type="file" name="reportSubmitFile" class="reportSubmitFile"></div>';	
			$('#fileinput').append(html);
		});
	
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});
	
		$('#submitBtn').click(function(){
			var blank_patten = /\s|　/gi;
			var reportSubmitContent = $('#reportSubmitContent').val();
			let ck = true;
			oEditors.getById["reportSubmitContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$('.reportSubmitFile').each(function(index, item){
				if($(item).val()==''){
					ck = false;	
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
			}
			else if($('#reportSubmitTitle').val().replace(blank_patten,"")==""){
				alert('제목을 입력해 주세요');
				}
			else if($('#reportSubmitContent').val() == '<p>&nbsp;</p>' ||$('#reportSubmitContent').val() == ''){
				alert('내용을 입력해 주세요');
				}
			else{
				$('#reportSubmitAdd').submit();
			}
		})
	})
</script>
</html>