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
    <style>
		body {
			width: 100%;
			height: 100%;
		    margin: 0;
		    padding: 0;
		}
		
		#myInfoTable{
    		width:100%;
    		table-layout:fixed;
    		white-space: nowrap;
    	}
		
    	#myInfoTable td{
    		text-align: center;
    		vertical-align: middle;
    		word-break: break-all;
    		
    	}
    	
    </style>
</head>

<body>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">My Page</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">Members</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
                
                <!-- 2번째 라인 카드 -->
                <div class="row">
                    <div class="col-md-3 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">내 정보 관리</h4>
                                </div>
                                <div class="pl-1 mb-1">
									<jsp:include page="/WEB-INF/view/manager/inc/myInfoMenu.jsp" flush="false"></jsp:include>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-9 col-lg-9">
	                    <div class="row">
		                    <div class="col-md-6 col-lg-6"> 
		                        <div class="card" style="height:270px">
		                            <div class="card-body">
		                            	<div class="d-flex align-items-center">
				                            <div class="col-md-6 col-lg-12">
				                            	<h4 class="card-title">프로필</h4>
				                            	<div class="mb-3"></div>
				                            	<div class="card-text">
					                            	<table class="table table" id="myInfoTable">
					                            		<tr>
					                            			<th rowspan="2"><img src="${path}/images/${managerOne.managerImage}" style="width:150px;height:170px"></th>
					                            			<td>${managerOne.managerName}</td>
					                            		</tr>
					                            		<tr>
					                            			<td>${managerOne.managerGender}</td>
					                            		</tr>
					                            	</table>
				                            	</div>
				                            </div>
		
		                       			</div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-md-6 col-lg-6"> 
		                        <div class="card" style="height:270px">
		                            <div class="card-body">
		                            	<div class="d-flex align-items-center">
				                            <div class="col-md-6 col-lg-12">
				                            	<h4 class="card-title">연락처/생일</h4>
				                            	<div class="mb-3"></div>
				                            	<div class="card-text">
					                            	<table class="table table" id="myInfoTable">
					                            		<tr>
					                            			<th>이메일</th>
					                            			<td>${managerOne.managerEmail}</td>
					                            		</tr>
					                            		<tr>
					                            			<th>핸드폰 번호</th>
					                            			<td>${managerOne.managerPhone}</td>
					                            		</tr>
					                            		<tr>
					                            			<th>생일</th>
					                            			<td>
					                            				${managerOne.managerBirth}
					                            			</td>
					                            		</tr>
					                            	</table>
				                            	</div>
		                       				</div>
		                          	  </div>
		                       	 </div>
		                 	   </div>
	                  	  </div>
	                  	  
	                  	  <div class="col-md-6 col-lg-8"> 
		                        <div class="card" style="height:200px">
		                            <div class="card-body">
		                            	<div class="d-flex align-items-center">
				                            <div class="col-md-6 col-lg-12">
				                            	<h4 class="card-title">기타</h4>
				                            	<div class="mb-3"></div>
				                            	<div class="card-text">
					                            	<table class="table table" id="myInfoTable">
					                            		<tr>
					                            			<th>주소</th>
					                            			<td colspan="3">${managerOne.managerAddressMain} ${managerOne.managerAddressSub}</td>
					                            		</tr>
					                            		<tr>
					                            			<th>직책</th>
					                            			<td></td>
					                            			<td>${managerOne.managerPosition}</td>
					                            		</tr>
					                            	</table>
				                            	</div>
				                            </div>
		
		                       			</div>
		                            </div>
		                        </div>
		                    </div>
		                    
		                    <div class="col-md-6 col-lg-4"> 
		                        <div class="card" style="height:200px">
		                            <div class="card-body">
		                            	<div class="d-flex align-items-center">
				                            <div class="col-md-6 col-lg-12">
				                            	<h4 class="card-title">방문현황</h4>
				                            	<div class="mb-3"></div>
				                            	<div class="card-text">
					                            	<table class="table table" id="myInfoTable">
					                            		<tr>
					                            			<td>접속</td>
					                            			<td>${connectCount}번</td>
					                            		</tr>
					                            		<tr>
					                            			<td colspan="2">${managerOne.managerUpdatedate}</td>
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
  
</body>
</html>
























