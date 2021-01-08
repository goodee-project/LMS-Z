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
<form method="post" id="updateQuesitonForm" enctype="multipart/form-data" action="${path}/student/questionModify?questionNo=${question.questionNo}">
	<table id="questionTable" class="table table" style="margin-top: 20px;">
		<tr>
			<td class="border-0 font-14 font-weight-medium text-muted px-2">
				작성자
				<span class="d-flex no-block align-items-center">
					${student.studentName}(${question.accountId})
				</span>
			</td>
			<td>작성일: ${question.questionCreatedate}</td>
		</tr>
	
		<tr>
			<td>lecture_no
				<select name="lectureNo">
					<c:forEach var="l" items="${lectureList}">
						<option value="${l.lectureNo}">${l.lectureNo}: ${l.lectureName}</option>
					</c:forEach>
				</select>
			</td>
			<td>제목: <input type="text" name="questionTitle" id="questionTitle" value="${question.questionTitle}" style="width:460px"></td>
		</tr>
		<tr>
			<td>
				내용
				<textarea class="form-control" name="questionContent" id="questionContent">${question.questionContent}</textarea>
			</td>
		</tr>
		<tr>
			<td>question_password: <input type="text" name="questionPassword" value="${question.questionPassword}"></td>
		</tr>
		<tr>
			<td>question_file</td>
			<td>
			
				<c:forEach var="qf" items="${question.questionfile}">
					<div>
						<span id="${qf.questionFileOriginal}">${qf.questionFileOriginal}</span>
						<c:if test="${qf.questionFileUuid != null}">
							<span>
								<a href="${path}/student/questionFileRemove/${studentId}?questionFileUuid=${qf.questionFileUuid}&questionNo=${question.questionNo}">삭제</a>
							</span>
						</c:if>
					</div>
				</c:forEach>
		
				<div id="fileinput"></div>
			</td>
		
			<td>
				<div>
					<button type="button" id="addBtn">파일추가</button>
					<button type="button" id="delBtn">파일삭제</button>
				</div>
			</td>
		</tr>
	</table>
	<button type="button" id="submitBtn">수정 완료</button>
</form>	
	<a href="${path}/student/questionOne/${question.questionNo}/1">이전 페이지</a>
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
