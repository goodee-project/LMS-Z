<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">LMS 공지사항</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="">강사</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-11 col-md-11">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                            	<div class="row">
                            		<div class="col-lg-2 col-md-2" style="text-align: left">
                            			<a class="btn btn-outline-secondary" style="border-radius: 4px;" href="${path}/teacher/lmsNoticeList/1">전체</a>
                            		</div>
                            		<div class="col-lg-4 col-md-4"></div>
                            		<div id="searchStyle" class="col-lg-6 col-md-6">
                            			<input type="text" class="form-control-plaintext form-control border-black form-sm" name="searchTitle" id="searchTitle" value="${searchTitle}" placeholder="title">
                            			<button class="btn btn btn-outline-secondary" style="border-radius: 4px;" type="button" id="btnSearch">찾기</button>
                            		</div>
                            	</div>

	                            <div>
									<table id="lmsNoticeTable" class="table table">
										<thead>
											<tr>
												<th class="font-weight-bold">번호	</th>
												<th class="font-weight-bold">작성자</th>
												<td class="font-weight-bold">제목</td>
												<th class="font-weight-bold">방문자 수</th>
												<th class="font-weight-bold">작성 날짜</th>
											</tr>
										</thead>
										<c:if test="${fn:length(lmsNoticeList) != 0}">
											<tbody>
												<c:forEach var="l" items="${lmsNoticeList}">
													<tr>
														<td>${l.lmsNoticeNo}</td>
														<td>${l.lmsNoticeWriter}</td>
														<td><a class="btn btn-outline-light text-secondary btn-block" style="border-radius: 4px;" href="${path}/teacher/modifyLmsNoticeCount/${l.lmsNoticeNo}/${currentPage}">${l.lmsNoticeTitle}</a></td>
														<td>${l.lmsNoticeCount}</td>
														<td>${l.lmsNoticeCreatedate}</td>
													</tr>
												</c:forEach>
											</tbody>
										</c:if>
										<c:if test="${fn:length(lmsNoticeList) == 0}">
											<tbody>
												<tr>
													<td colspan="4">해당 제목의 LMS공지사항이 없습니다.</td>
												</tr>
											</tbody>
										</c:if>
									</table>
								   	<div id="paging" style="text-align: center; padding: 7px;">
								   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
								   		<c:if test="${startPage!=1 && lastPage!=1}">
								    		<span>
								    			<a href="${path}/teacher/lmsNoticeList/${startPage-10}">이전</a>
								    		</span>
								   		</c:if>
								   		<!-- lastPage가 10개를 채울수 없을 때 -->
								   		<c:if test="${startPage+9 > lastPage }">
								     	<c:forEach var="i" begin="${startPage }" end="${lastPage}">
								     		<!-- 현재 페이지일 경우 -->
								     		<c:if test="${currentPage == i }">
									      		<span>
									      			<a id="pagingStyle" class="bg-secondary font-18">${i}</a>
									      		</span>
								     		</c:if>
								     		<!-- 현재 페이지가 아닐 경우 -->
								     		<c:if test="${currentPage != i }">
									      		<span>
									      			<a class="font-18" href="${path}/teacher/lmsNoticeList/${i}">${i}</a>
									      		</span>
								     		</c:if>
								     	</c:forEach>
								    	</c:if>
								    	<c:if test="${startPage+9<lastPage }">
								    		<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
									     		<!-- 현재 페이지일 경우 -->
									     		<c:if test="${currentPage == i }">
										      		<span>
										      			<a id="pagingStyle" class="bg-secondary font-18">${i}</a>
										      		</span>
									     		</c:if>
									     		<!-- 현재 페이지가 아닐 경우 -->
									     		<c:if test="${currentPage != i }">
										      		<span>
										      			<a class="font-18" href="${path}/teacher/lmsNoticeList/${i}">${i}</a>
										      		</span>
									     		</c:if>
								     		</c:forEach>
								    	</c:if>
								    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
								    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
									     	<span>
									     		<a href="${path}/teacher/lmsNoticeList/${startPage+10}">다음</a>
									     	</span>
								    	</c:if>
								   	</div>
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
		$('#btnSearch').click(function(){
			location.href = '${path}/teacher/lmsNoticeList/${currentPage}?searchTitle=' + $('#searchTitle').val();
		});

		
    </script>
   
</body>

</html>






















