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
    <title>textbook</title>
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
                               <h4 class="card-title">교재 목록</h4>
	                            <div>
	                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<thead>
                            				<tr>
												<td style="width:20%;">도서번호</td>
												<td>제목</td>
												<td style="width:15%;">글쓴이</td>
												<td style="width:20%;">출판사</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="t" items="${textbookList }">
												<tr>
													<td>${t.textbookIsbn }</td>
													<td><a class="btn btn-outline-light bg-light text-secondary btn-block" href="${path }/manager/textbookOne/${t.textbookIsbn}">${t.textbookTitle }</a></td>
													<td>${t.textbookWriter }</td>
													<td>${t.textbookPublisher }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<a class="btn btn-success" style="border-radius: 4px; float:right;" href="${path }/manager/insertTextbook">교재 등록</a>
									<br>
								   	<div id="paging" style="text-align: center; padding: 7px;">
								   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
								   		<c:if test="${startPage!=1 && lastPage!=1}">
								    		<span>
								    			<a href="${path}/manager/textbookList/${startPage-10}">이전</a>
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
									      			<a class="font-18" href="${path}/manager/textbookList/${i}">${i}</a>
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
										      			<a class="font-18" href="${path}/manager/textbookList/${i}">${i}</a>
										      		</span>
									     		</c:if>
								     		</c:forEach>
								    	</c:if>
								    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
								    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
									     	<span>
									     		<a href="${path}/manager/textbookList/${startPage+10}">다음</a>
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