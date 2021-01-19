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
					<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">질문 수정</h2>
				</div>
			</div>
		</div>	
		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<div class="table-responsive">
								<form method="post" id="updateQuesitonForm" enctype="multipart/form-data" action="${path}/student/questionModify/${studentId}?questionNo=${question.questionNo}">
									<table id="questionTable" class="table table" style="margin-top: 10px;">
		
										<tr>
											<td class="border border-0 d-flex justify-content-start">
												<h4>작성일 &emsp;${question.questionCreatedate}</h4>
											</td>
										</tr>
									
										<tr>
											<td class="border border-0 d-flex justify-content-start">강의
												&nbsp;
												<select style="width:40%;" name="lectureNo">
													<c:forEach var="l" items="${lectureList}">
														<option value="${l.lectureNo}">${l.lectureName}</option>
													</c:forEach>
												</select>
												
											</td>
										</tr>
										<tr>
											<td class="border border-0 d-flex justify-content-start">
												제목 &nbsp; <input type="text" class="form-control" style="width:80%;" name="questionTitle" id="questionTitle" value="${question.questionTitle}">
											</td>
										</tr>
										<tr>
											<td class="border border-0">
												<textarea class="form-control" style="width:100%;" style="resize:none;overflow:visible;" rows="10" name="questionContent" id="questionContent">${question.questionContent}</textarea>
											</td>
											<td class="border border-0" style="width:30%;"></td>
										</tr>
										</table>
										<table id="questionFileTable" class="table" style="margin-top:20px;">
										<tr>
											<td class="border border-0">첨부파일</td>
											<td class="border border-0">				
												<c:forEach var="qf" items="${question.questionfile}">
													<div>
														<span id="${qf.questionFileOriginal}">${qf.questionFileOriginal}</span>
														<c:if test="${qf.questionFileUuid != null}">
															<span>
																<a href="${path}/student/questionFileRemove/${studentId}?questionFileUuid=${qf.questionFileUuid}&questionNo=${question.questionNo}" onclick="return confirm('파일을 삭제하시겠습니까?');">삭제</a>
															</span>
														</c:if>
													</div>
												</c:forEach>
												<span id="fileinput"></span>
											</td>
											<td class="border border-0" style="width: 600px">
												<div>
													<button type="button" class="btn btn-outline-success" id="addBtn">파일추가</button>
													<button type="button" class="btn btn-outline-danger" id="delBtn">파일삭제</button>
												</div>
											</td>
										</tr>
										</table>	
											<table id="reportFileTable" class="table table" style="margin-top:20px;">
										<tr>
											<td class="border border-0 d-flex justify-content-start">
												질문 비밀번호
												&nbsp; <input type="text" class="form-control" style="width: 600px" name="questionPassword" value="${question.questionPassword}">
											</td>
										</tr>
										
										<tr>
											<td class="border border-0 d-flex justify-content-between">
												<a type="button" class="btn btn-outline-secondary" href="${path}/student/questionOne/${question.questionNo}/${studentId}/1">이전 페이지</a>
												<button type="button" class="btn btn-outline-success" id="submitBtn">수정 완료</button>	
												
											</td>
										</tr>
										
									</table>
								</form>	
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
			elPlaceHolder : 'questionContent',
			sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		})
	$('#addBtn').click(function(){
		let html='<div><input type="file" name="questionFile" class="questionFile"></div>';
		$('#fileinput').append(html);
		});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
		});

	$('#submitBtn').click(function(){
		let ck=true;
		oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []);
		$('.questionFile').each(function(index, item){
			if($(item).val()==''){
				ck=false;
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
				}
			else if($('#questionTitle').val() ==""){
				alert('제목을 입력해주세요.');
				}
			else if($('#questionContent').val() == '<p>&nbsp;</p>' ||$('#questionContent').val() == ''){
				alert('내용을 입력해주세요.');
				}
			else{
					$('#updateQuesitonForm').submit();
				}
		})
	})
</script>
</html>
