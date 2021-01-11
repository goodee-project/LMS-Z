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

		<jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">자료 자세히 보기</h2>
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
	           					<h4 class="card-title">자료 내용</h4>
								<table id="reporstSubmitOneTable" class="table table" style="margin-top: 20px;  word-break:break-all;">
									<tr>
										<td style="width:140px" class="border-0 font-14 font-weight-medium text-muted px-2">강의</td> 
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureNo}(${lectureArchive.lecture.lectureName})
											</div>
										</td>
									</tr>
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">작성자</td>
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveWriter }(${lectureArchive.accountId })
											</div>
										</td>
										
									</tr>	
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">제목</td> 
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveTitle }
											</div>
										</td>
									</tr>	
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">내용</td>
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveContent }
											</div>
										</td>
									</tr>	
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">작성일</td>
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveCreatedate }
											</div>
										</td>
									</tr>
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">수정일</td>
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveUpdatedate }
											</div>
										</td>
									</tr>	
									<tr>	
										<td class="border-0 font-14 font-weight-medium text-muted px-2">조회수</td> 
										<td class="font-weight-medium text-dark border-top-0 px-2">
											<div class="d-flex no-block align-items-center">
												${lectureArchive.lectureArchiveCount }
											</div>
										</td>
									
									</tr>
									<tr>
										<td class="border-0 font-14 font-weight-medium text-muted px-2">첨부파일</td>
										<c:if test="${!empty lectureArchive.lectureArchiveFileList}">
											<c:forEach var="laf" items="${lectureArchive.lectureArchiveFileList}">
													<tr>
														<td class="border-0 font-14 font-weight-medium text-muted px-2"></td>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4">
															<div class="d-flex no-block align-items-center">
																<a href="${path}/student/lectureArchiveFileCountUp/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a>
																&emsp;(다운로드 횟수: &nbsp; ${laf.lectureArchiveFileCount})
															</div>
														</td>
													</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty lectureArchive.lectureArchiveFileList}">
											<td class="font-weight-medium text-dark border-top-0 px-2">
												<div class="d-flex no-block align-items-center">
													등록된 첨부파일이 없습니다.
												</div>
											</td>		
										</c:if>
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
</html>