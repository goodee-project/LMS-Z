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
    <title>lms</title>
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
					<div class="col-md-5 col-lg-12">
						<div class="card" id="cardStyle">
							<div class="card-body">
								<h4 class="card-title"></h4>
								<div class="">
									<form method="post" action="${path }/manager/addFaqList/${currentPage}">
										<table class="table no-wrap v-middle mb-0">
										<tr class="border-top-0 px-2 py-4">
											<th>
												작성자
											</th>
											<td>
												<input type="text" name="accountId" value="${managerId }" readonly="readonly" hidden="hidden">
												<input type="text" name="faqWriter" value="${faqWriter }" readonly="readonly" style="width:560px">
											</td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" name="faqTitle" id="faqTitle" style="width:560px"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea class="form-control" name="faqContent" id="faqContent" rows="6"></textarea></td>
										</tr>
										<tr class="border-1">
											<th>카테고리</th>
											<td>
												<select name="faqCategory" style="width:560px">
													<c:forEach var="c" items="${categoryList}">
														<option value="${c.faqCategory }">${c.faqCategory }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr><th></th><td></td></tr>
									</table>
									<br>
									<div class="row">
										<span class="col-1"><a href="${path }/manager/faqList/강의/1">뒤로</a></span>
										<span class="col-1 ml-auto">
											<button class="align-self-center" type="button" id="insertBtn">입력</button>
										</span>
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
		$(document).ready(function() {
			// SmartEditor2 스크립트 추가
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : 'faqContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#insertBtn').click(function(){
				oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#faqTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#faqContent').val() == '<p>&nbsp;</p>' ||$('#faqContent').val() == ''){
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







