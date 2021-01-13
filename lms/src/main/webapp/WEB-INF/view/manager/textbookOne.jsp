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
    <title>textbookOne</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">Textbook</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">교재 상세보기</h4>
	                            <div>
	                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<tr>
											<th style="width:15%;">도서 번호 :</th>
											<td><span id="textbookIsbn"><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookIsbn }" readonly="readonly"></span></td>
										</tr>
										<tr>
											<th>제목 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookTitle }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>글쓴이 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookWriter }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>출판사 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookPublisher }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>책 소개 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookInfo }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>가격 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookPrice }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>출판사 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${textbookOne.textbookPublishdate }" readonly="readonly"></td>
										</tr>
									</table>
									<a class="btn btn-success" style="border-radius: 4px;" href="${path }/manager/textbookList/1">돌아가기</a>
									<button class="btn btn-outline-danger" style="border-radius: 4px; float:right; margin-left: 8px;" id="deleteIsbn" type="button" >삭제</button>
									<button class="btn btn-outline-info" style="border-radius: 4px; float:right;" type="submit"  onclick="location.href='${path}/manager/modifyTextbookOne/${textbookOne.textbookIsbn}'">수정</button>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
		$('#deleteIsbn').click(function(){
			$.ajax({
				url:'${path}/manager/textbookCk',
				type:'GET',
				data:{textbookIsbn: $('#textbookIsbn').text()},
				success:function(data){
					if(data.textbookCount ==0){
						location.href='${path}/manager/deleteTextbookOne/'+${textbookOne.textbookIsbn};
					}else{
						alert('강좌에서 사용중인 교재입니다.');	
						return;
						}
					}
			});
		
		});
    </script>
</body>
</html>