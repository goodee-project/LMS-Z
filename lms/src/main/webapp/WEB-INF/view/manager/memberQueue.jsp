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
    <title>memberQueue</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">강사/학생관리</a></h3>
                    </div>
                </div>
            </div>
             <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">학생 목록</h4>
	                            <div>
	                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<thead>
											<tr>
												<th>student_id</th>
												<th>student_email</th>
												<th>student_name</th>
												<th>student_phone</th>
												<th>student_gender</th>
												<th>student_birth</th>
												<th>student_address_main</th>
												<th>student_address_sub</th>
												<th>account_level</th>
												<th>승인</th>
												<th>거절</th>
											</tr>
										</thead>
	                            		<tbody>
											<c:forEach var="s" items="${studentList }">
												<tr>
													<td>${s.studentId }</td>
													<td>${s.studentEmail }</td>
													<td>${s.studentName }</td>
													<td>${s.studentPhone }</td>
													<td>${s.studentGender }</td>
													<td>${s.studentBirth }</td>
													<td>${s.studentAddressMain }</td>
													<td>${s.studentAddressSub }</td>
													<td>${s.account.accountLevel }</td>
													<td><a class="btn btn-outline-primary" style="border-radius: 4px;" href="${path}/manager/insertStudentQueue/${s.studentId}/활성화/${managerId}/${currentPageS}/${currentPageT}">승인</a></td>
													<td><a class="btn btn-outline-danger" style="border-radius: 4px;" href="${path}/manager/deleteStudentQueue/${s.studentId}/거절/${currentPageS}/${currentPageT}">거절</a></td>
												</tr>
											</c:forEach>
										</tbody>
	                            	</table>
	                            	<br>
							       	<div>
							       		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
							       		<c:if test="${startPageS!=1 && lastPageS!=1}">
							        		<span>
							        			<a href="${path}/manager/memberQueue/${startPageS-10}/${currentPageT}">이전&nbsp;&nbsp;</a>
							        		</span>
							       		</c:if>
							       		<!-- lastPage가 10개를 채울수 없을 때 -->
							       		<c:if test="${startPageS+9 > lastPageS }">
							         	<c:forEach var="i" begin="${startPageS }" end="${lastPageS}">
							         		<!-- 현재 페이지일 경우 -->
							         		<c:if test="${currentPageS == i }">
								          		<span>
								          			<a>${i}&nbsp;&nbsp;</a>
								          		</span>
							         		</c:if>
							         		<!-- 현재 페이지가 아닐 경우 -->
							         		<c:if test="${currentPageS != i }">
								          		<span>
								          			<a href="${path}/manager/memberQueue/${i}/${currentPageT}">${i}&nbsp;&nbsp;</a>
								          		</span>
							         		</c:if>
							         	</c:forEach>
							        	</c:if>
							        	<c:if test="${startPageS+9<lastPageS }">
							        		<c:forEach var="i" begin="${startPageS }" end="${startPageS+9}">
							         		<!-- 현재 페이지일 경우 -->
							         		<c:if test="${currentPageS == i }">
								          		<span>
								          			<a>${i}&nbsp;&nbsp;</a>
								          		</span>
							         		</c:if>
							         		<!-- 현재 페이지가 아닐 경우 -->
							         		<c:if test="${currentPageS != i }">
								          		<span>
								          			<a href="${path}/manager/memberQueue/${i}/${currentPageT}">${i}&nbsp;&nbsp;</a>
								          		</span>
							         		</c:if>
							         	</c:forEach>
							        	</c:if>
							        	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
							        	<c:if test="${startPageS+9<lastPageS && lastPageS != startPageS}">
								         	<span>
								         		<a href="${path}/manager/memberQueue/${startPageS+10}/${currentPageT}">다음&nbsp;&nbsp;</a>
								         	</span>
							        	</c:if>
							       	</div>
					       	 	</div>
                            </div>
                           </div>
                       </div>
                   </div>   
                <!-- 2번째 라인 카드 -->
	                <div class="row">
	                    <div class="col-lg-12 col-md-12">
	                        <div class="card" id="cardStyle">
	                            <div class="card-body">
	                               <h4 class="card-title">강사 목록</h4>
		                            <div>
		                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
		                            		<thead>
												<tr>
													<th>아이디</th>
													<th>이메일</th>
													<th>이름</th>
													<th>전화번호</th>
													<th>성별</th>
													<th>생일</th>
													<th>메인주소</th>
													<th>상세주소</th>
													<th>직책</th>
													<th>승인</th>
													<th>거절</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="t" items="${teacherList }">
													<tr>
														<td>${t.teacherId }</td>
														<td>${t.teacherEmail }</td>
														<td>${t.teacherName }</td>
														<td>${t.teacherPhone }</td>
														<td>${t.teacherGender }</td>
														<td>${t.teacherBirth }</td>
														<td>${t.teacherAddressMain }</td>
														<td>${t.teacherAddressSub }</td>
														<td>${t.account.accountLevel }</td>
														<td><a class="btn btn-outline-primary" style="border-radius: 4px;" href="${path}/manager/insertTeacherQueue/${t.teacherId}/활성화/${managerId}/${currentPageS}/${currentPageT}">승인</a></td>
														<td><a class="btn btn-outline-danger" style="border-radius: 4px;" href="${path}/manager/deleteTeacherQueue/${t.teacherId}/거절/${currentPageS}/${currentPageT}">거절</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- 페이징 -->
									    <br>
								       	<div>
								       		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
								       		<c:if test="${startPageT!=1 && lastPageT!=1}">
								        		<span>
								        			<a href="${path}/manager/memberQueue/${currentPageS}/${startPageT-10}">이전&nbsp;&nbsp;</a>
								        		</span>
								       		</c:if>
								       		<!-- lastPage가 10개를 채울수 없을 때 -->
								       		<c:if test="${startPageT+9 > lastPageT }">
								         	<c:forEach var="i" begin="${startPageT }" end="${lastPageT}">
								         		<!-- 현재 페이지일 경우 -->
								         		<c:if test="${currentPageT == i }">
									          		<span>
									          			<a>${i}&nbsp;&nbsp;</a>
									          		</span>
								         		</c:if>
								         		<!-- 현재 페이지가 아닐 경우 -->
								         		<c:if test="${currentPageT != i }">
									          		<span>
									          			<a href="${path}/manager/memberQueue/${currentPageS}/${i}">${i}&nbsp;&nbsp;</a>
									          		</span>
								         		</c:if>
								         	</c:forEach>
								        	</c:if>
								        	<c:if test="${startPageT+9<lastPageT }">
								        		<c:forEach var="i" begin="${startPageT }" end="${startPageT+9}">
								         		<!-- 현재 페이지일 경우 -->
								         		<c:if test="${currentPageT == i }">
									          		<span>
									          			<a>${i}&nbsp;&nbsp;</a>
									          		</span>
								         		</c:if>
								         		<!-- 현재 페이지가 아닐 경우 -->
								         		<c:if test="${currentPageT != i }">
									          		<span>
									          			<a href="${path}/manager/memberQueue/${currentPageS}/${i}">${i}&nbsp;&nbsp;</a>
									          		</span>
								         		</c:if>
								         	</c:forEach>
								        	</c:if>
								        	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
								        	<c:if test="${startPageT+9<lastPageT && lastPageT != startPageT}">
									         	<span>
									         		<a href="${path}/manager/memberQueue/${currentPageS}/${startPageT+10}">다음&nbsp;&nbsp;</a>
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