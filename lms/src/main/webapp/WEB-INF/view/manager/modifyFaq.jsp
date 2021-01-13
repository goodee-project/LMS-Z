<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
    <title>faqModify</title>
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
        
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">FAQ</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">FAQ 수정</h4>
	                            <div>
	                            	<form method="post" action="${path}/manager/modifyFaq/${currentPage}">
	                            		<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            			<tr>
												<th style="width:10%;">제목</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="faqNo" value="${faqOne.faqNo }" hidden="hidden">
													<input class="form-control" style="width:100%;" type="text" name="faqTitle" id="faqTitle" value="${faqOne.faqTitle }" style="width:560px">
												</td>
											</tr>
											<tr>
												<th>카테고리</th>
												<td>
													<select class="form-control" style="width:100%;" name="faqCategory">
														<c:forEach var="c" items="${categoryList }">
															<c:if test="${category == c.faqCategory }">
																<option value="${c.faqCategory }" selected>${c.faqCategory }</option>
															</c:if>
															<c:if test="${category != c.faqCategory }">
																<option value="${c.faqCategory }">${c.faqCategory }</option>
															</c:if>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>
													<textarea class="form-control" style="resize:none;overflow:visible; width:100%;"  
													name="faqContent" id="faqContent" cols="50" rows="15">${faqOne.faqContent}</textarea>
												</td>
											</tr>
										</table>
										<a class="btn btn-outline-secondary" style="border-radius: 4px;" href="${path }/manager/faqOne/${faqOne.faqNo}/${currentPage}">뒤로가기</a>
										<button class="btn btn-success" style="border-radius: 4px; float:right;" type="button" id="updateBtn">수정완료</button>
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
			$('#updateBtn').click(function(){
				oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#faqTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#faqContent').val() == '<p>&nbsp;</p>'||$('#faqContent').val() == ''){
					alert('내용을 입력해주세요.');
					}
				else{
					$('#updateBtn').removeAttr("type");
					$('#updateBtn').attr("type","submit");
					}
				});
			
		})
	</script>
</body>
</html>