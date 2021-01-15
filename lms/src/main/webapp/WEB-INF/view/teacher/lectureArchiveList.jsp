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
    <title>lectureArchiveList</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            					<h4 class="card-title">자료목록</h4>
            					
            					<div style="float:right; margin-bottom:20px;">
	            					<div class="row">
		            					<input type="hidden" id="teacherId" value="${teacherId}">
										<input class="form-control" style="width:70%; margin-right:8px;" type="text" id="title" placeholder="제목으로 검색됩니다"> 
										<a class="btn btn-outline-secondary" style="border-radius:4px;" id="btn" href="">검색</a>
									</div>
								</div>
								<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
									<thead>
										<tr>
											<th>강의 번호</th>
											<th>과목</th>
											<th>작성자</th>
											<th>제목</th>
											<th>작성일</th>
											<th>수정일</th>
											<th>조회수</th>
										</tr>
									</thead>
									
									<tbody>
										<c:if test="${!empty lectureArchiveList}">
											<c:forEach var="la" items="${lectureArchiveList}">
												<tr>	
													<td><a class="btn btn-outline-light text-secondary btn-block" href="${path}/teacher/lectureArchiveCountUp/${teacherId}/${la.lectureNo}/${la.lectureArchiveNo}">${la.lectureNo}(${la.lecture.lectureName})</a></td>
													<td>${la.subject.subjectName}</td>
													<td>${la.lectureArchiveWriter}</td>			
													<td>${la.lectureArchiveTitle}</td>
													<td>${la.lectureArchiveCreatedate}</td>
													<td>${la.lectureArchiveUpdatedate}</td>
													<td>${la.lectureArchiveCount}</td>
												</tr>	
											</c:forEach>
										</c:if>
										<c:if test="${empty lectureArchiveList}">
											<tr>
												<td colspan="8">등록된 게시물이 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<a class="btn btn-outline-secondary text-dark" style="border-radius:4px; float:left;" href="${path}/teacher/lectureOne/${lectureNo}">뒤로가기</a>
								<a class="btn btn-success" style="border-radius:4px; float:right;" href="${path}/teacher/lectureArchiveAdd/${teacherId}/${lectureNo}">자료 추가</a>
								<br>
								<div id="paging" style="text-align:center; padding:7px;">
									<c:if test="${listCurrentPage>1}">
										<a href="${path}/teacher/lectureArchiveList/${teacherId}/1">처음으로</a>
										<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage-1}">이전</a>
									</c:if>
									
									<c:forEach var="i" begin="${listUnderFirstPage}" end="${listUnderLastPage}">
										<c:if test="${i<=lastPage}">
											<a id="pagingStyle" class="bg-secondary font-18" href="${path}/teacher/lectureArchiveList/${teacherId}/${i}">${i}</a>
										</c:if>
									</c:forEach>
									
									<c:if test="${listCurrentPage<lastPage}">
										<a href="${path}/teacher/lectureArchiveList/${teacherId}/${listCurrentPage+1}">다음</a>
										<a href="${path}/teacher/lectureArchiveList/${teacherId}/${lastPage}">마지막으로</a>
									</c:if>
								</div>
								
								<!-- 검색 페이징 -->
								<c:if test="${lectureArchiveTitle != null}">
									<div id="paging" style="text-align:center; padding:7px;">
										<c:if test="${searchCurrentPage>1}">
											<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/1">처음으로</a>
											<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchCurrentPage-1}">이전</a>
										</c:if>
										
										<c:forEach var="s" begin="${searchUnderFirstPage}" end="${searchUnderLastPage}">
											<c:if test="${s<=searchLastPage}">
												<a id="pagingStyle" class="bg-secondary font-18" href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${s}">${s}</a>
											</c:if>
										</c:forEach>
										
										<c:if test="${searchCurrentPage<searchLastPage}">
											<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchCurrentPage+1}">다음</a>
											<a href="${path}/teacher/lectureArchiveSearch/${teacherId}/${lectureArchiveTitle}/${searchLastPage}">마지막으로</a>
										</c:if>
									</div>
								</c:if>
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
<script>
	$('#btn').on('click',function(){
		if($('#title').val()!=''){
			$('#btn').prop('href',"${path}/teacher/lectureArchiveSearch/"+$('#teacherId').val()+"/"+$('#title').val()+"/1");
		} 
		if($('#title').val()==''){
		$('#btn').prop('href',"${path}/teacher/lectureArchiveList/"+$('#teacherId').val()+"/1");
		}
	});		
</script>
</html>