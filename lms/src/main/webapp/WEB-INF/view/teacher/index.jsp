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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Index</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">강사</a>
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
                                <h4 class="card-title">현재 접속자</h4>
	                            <div>
	                            	<table id="connectTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            		<thead>
		                            		<tr>
												<th>운영자</th>
												<th>강사</th>
												<th>학생</th>
		                            		</tr>
	                            		</thead>
	                            		<tbody>
	                            			<tr>
	                            				<td>
	                            					<div id="managerConnect"></div>
	                            				</td>
	                            				<td>
	                            					<div id="teacherConnect"></div>
	                            				</td>
	                            				<td>
	                            					<div id="studentConnect"></div>
	                            				</td>
	                            			</tr>
	                            		</tbody>
	                            	</table>
	                            </div>
                            </div>
                        </div>
                    </div>
        		</div>
        		<div class="row">
                    <div class="col-lg-7 col-md-7">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <h4 class="card-title">진행중인 강의</h4>
                                <table id="lectureTable" class="table table" style="margin-top: 20px; text-align: center;">
                                	<thead>
                                		<tr>
                                			<th>강의명</th>
                                			<th>강의시간</th>
                                			<th>정원</th>
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
		$(document).ready(function(){
			// 현재 방문자 수를 출력
		    $.ajax({
				url:'${path}/teacher/getConnectList',
				type:'GET',
				success:function(data){
					for(var i=0; i<data.connectList.length; i++){
						if(data.connectList[i].managerName != null){
							var managerBody = '<div style="margin-top:7px">';					
							managerBody += data.connectList[i].managerName;
							managerBody += '</td></tr>';
							managerBody += '</div>';

							$('#managerConnect').append(managerBody);
						}
						if(data.connectList[i].studentName != null){
							var studentBody = '<div style="margin-top:7px">';				
							studentBody += data.connectList[i].studentName;						
							studentBody += '</div>';

							$('#studentConnect').append(studentBody);
						}
						if(data.connectList[i].teacherName != null){
							var teacherBody = '<div style="margin-top:7px">';					
							teacherBody += data.connectList[i].teacherName;						
							teacherBody += '</div>';

							$('#teacherConnect').append(teacherBody);
						}
					}
				}
			});

		    $.ajax({
				url:'${path}/teacher/getLecture/<%=session.getAttribute("teacherId")%>',
				type:'GET',
				success:function(data){
					$.each(data, function(index, lecture){				
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td>' + lecture.lectureName + '</td>';
						strBody += '<td>' + lecture.lectureStartdate + '~' + lecture.lectureEnddate +'</td>';
						strBody += '<td>' + lecture.lectureTotal + '</td>';
						strBody += '</tr>';
						strBody += '</tbody>';

						$('#lectureTable').append(strBody);
					})
				}
			});
		})
    </script>
</body>

</html>