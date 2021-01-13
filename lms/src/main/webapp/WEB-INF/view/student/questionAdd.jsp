<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">질문 등록</h2>
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
									<form method="post" id="questionAdd" action="${path}/student/questionAdd?studentId=${studentId}" enctype="multipart/form-data">
										<table id="questionAddTable" class="table table" style="margin-top: 10px;">
											<tr>
												<td class="border border-0 d-flex justify-content-start">강의
													&nbsp;
													<select name="lectureNo">
														<c:forEach var="l" items="${lectureList}">
															<option value="${l.lectureNo}">${l.lectureNo}: ${l.lectureName}</option>
														</c:forEach>
													</select>
													&emsp;제목 &nbsp;<input type="text" style="width:30%;" name="questionTitle" id="questionTitle" style="width:460px">
												</td>
											</tr>
											
											<tr class="border border-0">
												<td class="border border-0">
													<textarea class="form-control" style="width:100%;" style="resize:none;overflow:visible;" name="questionContent" id="questionContent" rows="10"></textarea>
												</td>
												<td class="border border-0" style="width:30%;"></td>
											</tr>
										</table>	
										<table id="questionFileTable" class="table" style="margin-top:20px;">	
											<tr>
												<td class="border border-0">첨부파일</td>
												<td class="border border-0">
													<span id="fileinput"></span>
												</td>
												<td class="border border-0" style="width: 600px">
													<div>
														
														<button type="button" class="btn btn-outline-success" id="addBtn">파일 추가</button>
														<button type="button" class="btn btn-outline-danger" id="delBtn">파일 삭제</button>
												
													</div>
												</td>
											</tr>
											</table>	
										<table id="questionPasswordTable" class="table" style="margin-top:20px;">
											<tr>
												<td class="border border-0">
													질문 비밀번호
												</td>
												<td class="border border-0" style="width: 900px">
													<input type="password" name="questionPassword">
												</td>
											</tr>
											<tr>
												<td class="border border-0">
													<button type="button" class="btn btn-outline-success" id="submitBtn">등록완료</button>
													<a type="button" class="btn btn-outline-secondary" href="${path}/student/questionList/${studentId}/1">이전 페이지</a>
												</td>
											</tr>
										</table>
										<input type="hidden" name="questionWriter" value="${student.studentName}">
										<input type="hidden" name="accountId" value="${studentId}">
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
			let html= '<div><input type="file" name="questionFile" class="questionFile"></div>';	
			$('#fileinput').append(html);
		});
	
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});
	
		$('#submitBtn').click(function(){
			let ck = true;
			oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$('.questionFile').each(function(index, item){
				if($(item).val()==''){
					ck = false;	
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
				$('#questionAdd').submit();
			}
		})
	})
</script>
</html>