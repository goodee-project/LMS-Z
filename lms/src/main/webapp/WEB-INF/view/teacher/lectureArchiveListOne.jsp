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
    <title>lectureArchiveOne</title>
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
        
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		        
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
		<div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Lecture Archive</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-12 col-md-12">
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<h4 class="card-title">자료 상세보기</h4>
								
								<table id="lmsTable" class="table" style="margin-top:20px;">
									<tr>
										<td style="width:5%;">강의</td>
										<td>${lecture.lectureName}</td>
									</tr>
									<tr class="border-top-0">
										<td class="border-0">작성자</td>
										<td class="border-0">${lectureArchive.lectureArchiveWriter} (${lectureArchive.accountId })</td>
									</tr>
									<tr class="border-top-0">
										<td class="border-0">조회수</td>
										<td class="border-0">${lectureArchive.lectureArchiveCount}</td>
									</tr>	
									<tr class="border-top-0">
										<td class="border-0">수정일</td>
										<td class="border-0">${lectureArchive.lectureArchiveUpdatedate}</td>
									</tr>																	
									<tr class="border-top-0">
										<td class="border-0">제목</td>
										<td class="border-0">${lectureArchive.lectureArchiveTitle}</td>
									</tr>
									<tr class="border-top-0">
										<td>내용</td>
										<td>${lectureArchive.lectureArchiveContent}</td>
									</tr>
								</table>
								
								<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
									<c:forEach var="laf" items="${lectureArchive.lectureArchiveFileList}">
										<c:if test="${laf.lectureArchiveFileUuid != null}">
											<tr>
												<td style="width:10%;">첨부파일</td>
												<td><a href="${path}/teacher/lectureArchiveFileCountUp/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a></td>
												<td style="width:10%;">조회수</td>
												<td>${laf.lectureArchiveFileCount}</td>
											</tr>
										</c:if>
										<c:if test="${laf.lectureArchiveFileUuid == null}">
											<tr>
												<td>첨부파일이 없습니다.</td>
											</tr>
										</c:if>
									</c:forEach>	
								</table>
								<a class="btn btn-outline-secondary text-dark" style="border-radius:4px; float:left;" href="${path}/teacher/lectureArchiveList/${teacherId}/${lectureArchive.lectureNo}/1">뒤로가기</a>
								<div style="float:right;">
									<a class="btn btn-info" style="border-radius:4px;" href="${path}/teacher/lectureArchiveModify/${teacherId}/${lectureArchive.lectureArchiveNo}?lectureNo=${lectureArchive.lectureNo}">수정</a>
									<a class="btn btn-outline-danger" style="border-radius:4px;" href="${path}/teacher/lectureArchiveRemove/${lectureArchive.lectureArchiveNo}/${teacherId}" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
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