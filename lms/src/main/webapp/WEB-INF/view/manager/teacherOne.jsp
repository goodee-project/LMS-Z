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
    <title>teacherOne</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">Teacher</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">강사 상세보기</h4>
	                            <div>
	                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<tr>
											<th style="width:15%;">이름 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherName }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>아이디 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherId }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>이메일 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherEmail }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>핸드폰 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherPhone }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>생일 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherBirth }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>성별 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherGender }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>주소 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherAddressMain },${teacherOne.teacherAddressSub }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>사진 :</th>
											<td><img src="/${path }/images/${teacherOne.teacherImage }" style="width:170px; height:200px;"></td>
										</tr>
										<tr>
											<th>승인날짜 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherAccessdate }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>수정날짜 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherUpdatedate }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>정보 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.teacherInfo }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>승인한운영자 :</th>
											<td><input class="form-control" style="width:100%;" type="text" value="${teacherOne.managerIdAccess }" readonly="readonly"></td>
										</tr>
									</table>
									<a class="btn btn-outline-secondary" style="border-radius: 4px;" href="${path }/manager/memberList/1/${searchLevel}">돌아가기</a>
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
</body>
</html>