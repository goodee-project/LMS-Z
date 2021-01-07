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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Index</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="">운영자</a>
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
                    <div class="col-lg-7 col-md-7">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <h4 class="card-title">LMS 공지사항</h4>
	                            <div>
	                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<thead>
		                            		<tr>
		                            			<th>제목</th>
		                            			<td>작성자</td>
		                            			<td>수정일</td>
		                            		</tr>
	                            		</thead>
	                            		<tbody>
	                            			<c:forEach var="l" items="${lmsNoticeList}">
		                            			<tr>
		                            				<td>${l.lmsNoticeTitle}</td>
		                            				<td>${l.lmsNoticeWriter}</td>
		                            				<td>${l.lmsNoticeUpdatedate}</td>
		                            			</tr>
	                            			</c:forEach>
	                            		</tbody>
	                            	</table>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <h4 class="card-title">현재 방문자</h4>
                            	<table id="connectTable" class="table table" style="margin-top: 20px; text-align: center;">
                            		<thead>
                            			<tr class="border-0">
                            				<th class="border-top-0 text-muted px-2 py-4 font-14">정보</th>
                            				<th class="border-top-0 text-muted px-2 py-4 font-14">이름</th>
                            			</tr>
                            		</thead>
                            	</table>
                            </div>
                        </div>
                    </div>
       			</div>
	        	<!-- 2번째 라인 카드 -->     
	        	<div class="row">
	                <div class="col-lg-6 col-md-6">
	                    <div class="card" id="cardStyle">
			                <div class="card-body">
			                    <h4 class="card-title">미승인 강사</h4>
			                    <table id="teacherQueueTable" class="table table" style="margin-top: 20px; text-align: center;">
			                    	<thead>
			                    		<tr>
			                    			<th>아이디</th>
			                    			<th>이메일</th>
			                    			<th>이름</th>
			                    			<th>성별</th>
			                    		</tr>
			                    	</thead>
			                    </table>
			                </div>
	                    </div>
					</div>
					<div class="col-lg-6 col-md-6">
	                    <div class="card" id="cardStyle">
			                <div class="card-body">
			                    <h4 class="card-title">미승인 학생</h4>
			                    <table id="studentQueueTable" class="table table" style="margin-top: 20px; text-align: center;">
			                    	<thead>
			                    		<tr>
			                    			<th>아이디</th>
			                    			<th>이메일</th>
			                    			<th>이름</th>
			                    			<th>성별</th>
			                    		</tr>
			                    	</thead>
			                    </table>
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
    	// 페이지에 들어오면 현재 방문자 수 표시
    	// ajax를 통해 json형식을 받아옴
	    $(document).ready(function(){
	    	$.ajax({
				url:'${path}/manager/getConnectList',
				type:'GET',
				success:function(data){
					for(var i=0; i<data.connectList.length; i++){
						if(data.connectList[i].managerName != null){
							var managerBody = '<tbody>';
							managerBody += '<tr><td class="border-top-0 text-muted px-2 font-13">';
							managerBody += '운영자';						
							managerBody += '</td><td class="border-top-0 text-muted px-2 font-13">';						
							managerBody += data.connectList[i].managerName;						
							managerBody += '</td></tr>';
							managerBody += '</tbody>';

							$('#connectTable').append(managerBody);
						}
						if(data.connectList[i].studentName != null){
							var studentBody = '<tbody>';
							studentBody += '<tr><td class="border-top-0 text-muted px-2 font-13">';
							studentBody += '학생';						
							studentBody += '</td><td class="border-top-0 text-muted px-2 font-13">';						
							studentBody += data.connectList[i].studentName;						
							studentBody += '</td></tr>';
							studentBody += '</tbody>';

							$('#connectTable').append(studentBody);
						}
						if(data.connectList[i].teacherName != null){
							var teacherBody = '<tbody>';
							teacherBody += '<tr><td class="border-top-0 text-muted px-2 font-13">';
							teacherBody += '강사';						
							teacherBody += '</td><td class="border-top-0 text-muted px-2 font-13">';						
							teacherBody += data.connectList[i].teacherName;						
							teacherBody += '</td></tr>';
							teacherBody += '</tbody>';

							$('#connectTable').append(teacherBody);
						}
					}
				}
			});	
			//페이지에 들어오면 최근 회원가입 강사/학생 리스트 표시
			$.ajax({
				url:'${path}/manager/getTeacherQueueList',
				type:'GET',	
				success:function(data){
					if(data.teacherList.length == 0){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td colspan="4">' + '미승인 강사가 없습니다.' + '</td>';
						strBody += '</tr>';
						strBody += '</tbody>';

						$('#teacherQueueTable').append(strBody);
					} else{
						$.each(data.teacherList, function(index, teacherQueue){				
							var strBody = '<tbody>';
							strBody += '<tr>';
							strBody += '<td>' + teacherQueue.teacherId + '</td>';
							strBody += '<td>' + teacherQueue.teacherEmail + '</td>';
							strBody += '<td>' + teacherQueue.teacherName + '</td>';
							strBody += '<td>' + teacherQueue.teacherGender + '</td>';
							strBody += '</tr>';
							strBody += '</tbody>';
	
							$('#teacherQueueTable').append(strBody);
						})
					}
				}
				});
			$.ajax({
				url:'${path}/manager/getStudentQueueList',
				type:'GET',	
				success:function(data){
					if(data.studentList.length == 0){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td colspan="4">' + '미승인 학생이 없습니다.' + '</td>';
						strBody += '</tr>';
						strBody += '</tbody>';

						$('#studentQueueTable').append(strBody);
					} else{
						$.each(data.studentList, function(index, studentQueue){				
							var strBody = '<tbody>';
							strBody += '<tr>';
							strBody += '<td>' + studentQueue.studentId + '</td>';
							strBody += '<td>' + studentQueue.studentEmail + '</td>';
							strBody += '<td>' + studentQueue.studentName + '</td>';
							strBody += '<td>' + studentQueue.studentGender + '</td>';
							strBody += '</tr>';
							strBody += '</tbody>';
	
							$('#studentQueueTable').append(strBody);
						})
					}
				}
				});
	    	
	    });
    </script>
</body>

</html>







