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
    <title>addLmsNotice</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
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
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center"></div>
					<div class="col-5 align-self-center text-right">
						<div class="col-12 align-self-center"></div>
					</div>
				</div>
				<br>
				<!-- 1번째 라인 카드 -->
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<h4 class="card-title"></h4>
								<div class="">
									<form method="post" action="${path }/manager/addLmsNotice">
										<table class="table no-wrap v-middle mb-0">
											<tr class="border-top-0 px-2 py-4">
												<th style="width:10%;">작성자</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="accountId" value="${managerId }" hidden="hidden">
													<input class="form-control" type="text" name="lmsNoticeWriter" value="${managerName}" readonly="readonly">
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="lmsNoticeTitle" id="lmsNoticeTitle" style="width:560px">
												</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>
													<textarea class="form-control" style="width:100%;" name="lmsNoticeContent" id="lmsNoticeContent" style="resize:none;overflow:visible;" rows="6"></textarea>
												</td>
											</tr>
										</table>
										<a class="btn btn-outline-secondary" style="border-radius: 4px;" href="${path }/manager/lmsNoticeList/${currentPage}">뒤로</a>
										<button class="btn btn-success" style="border-radius: 4px; float:right;" type="button" id="insertBtn">추가</button>
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
		$(document).ready(function() {
			// SmartEditor2 스크립트 추가
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : 'lmsNoticeContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#insertBtn').click(function(){
				oEditors.getById["lmsNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#lmsNoticeTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#lmsNoticeContent').val() == '<p>&nbsp;</p>' || $('#lmsNoticeContent').val() == ''){
					alert('내용을 입력해주세요.');
					}
				else{
					$('#insertBtn').removeAttr("type");
					$('#insertBtn').attr("type","submit");
					}
				});
			
		})
	</script>
</body>
</html>