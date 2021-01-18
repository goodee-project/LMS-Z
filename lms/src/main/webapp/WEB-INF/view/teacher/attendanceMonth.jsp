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
	
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		        
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>

        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 id="smallTitle" class="page-title text-truncate text-dark font-weight-medium mb-1">소제목</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a>출석부</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-5 col-md-5 text-center">
            			<h3 style="margin-top: 10px; margin-bottom: 10px;">${currentYear}년 ${currentMonth}월</h3>
						<table id="calendarTable">
							<thead>
								<tr>
									<th class="text-danger font-weight-bold">일</th>
									<th class="font-weight-bold">월</th>
									<th class="font-weight-bold">화</th>
									<th class="font-weight-bold">수</th>
									<th class="font-weight-bold">목</th>
									<th class="font-weight-bold">금</th>
									<th class="text-info font-weight-bold">토</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="i" begin="1" end="${lastDay + (firstDay - 1)}" step="1">
										<c:if test="${i - (firstDay - 1) < 1}">
											<td>&nbsp;</td>
										</c:if>
								
										<c:if test="${i - (firstDay - 1) > 0}">
											<td>
												<c:if test="${i % 7 == 1}">
													<div>
														<a class="btn btn-link btn-block text-danger calenderStyle" style="border-radius: 4px; padding:10px;" href="javascript:click()" onclick="attendanceClick('${i - (firstDay - 1)}')">${i - (firstDay - 1)}</a>
													</div>
												</c:if>
		                                
												<c:if test="${i % 7 == 0}">
													<div>
														<a class="btn btn-link btn-block text-info calenderStyle" style="border-radius: 4px; padding:10px;" href="javascript:click()" onclick="attendanceClick('${i - (firstDay - 1)}')">${i - (firstDay - 1)}</a>
													</div>
												</c:if>
				                                
												<c:if test="${i % 7 != 1 && i % 7 != 0}">
													<div>
														<a class="btn btn-link btn-block text-dark calenderStyle" style="border-radius: 4px; padding:10px;" href="javascript:click()" onclick="attendanceClick('${i - (firstDay - 1)}')">${i - (firstDay - 1)}</a>
													</div>
												</c:if>
											</td>
										</c:if>
										<c:if test="${i != (lastDay + (firstDay - 1))}">
											<c:if test="${i % 7 == 0}">
												</tr><tr>
											</c:if>
										</c:if>
								</c:forEach>
		                       
		                        <c:if test="${(lastDay + (firstDay - 1)) % 7 != 0}">   
								 	<c:forEach begin="1" end="${7 - ((lastDay + (firstDay - 1)) % 7)}" step="1">   
										<td>&nbsp;</td>   
									</c:forEach>   
								</c:if>
		
							</tbody>
						</table>
						
						<a class="font-weight-bold" style="color: #747474; margin-right: 7px" href="${path}/teacher/attendanceMonth/${lectureNo}/${currentYear}/${currentMonth - 1}">이전</a>
						<a class="font-weight-bold" style="color: #747474" href="${path}/teacher/attendanceMonth/${lectureNo}/${currentYear}/${currentMonth + 1}">다음</a>
					</div>
					<div class="col-lg-1 col-md-1"></div>
					<div class="col-lg-6 col-md-6">
						<div class="row">
							<div class="col-lg-12 col-md-12 text-right" id="attendanceCount" style="margin-bottom: 7px"></div>
						</div>
						<div class="card" id="cardStyle">
                            <div class="card-body">
                                <h4 class="card-title" id="attendanceTitle"></h4>
                                <div id="attendanceSmallTitle" class="mb-3">
	                            	변경사항을 체크 후 업데이트를 해주세요.
                            	</div>
                            	<div class="row">
                            		<div id="attendanceCategory" class="col-lg-6 col-md-6" style="margin-bottom: 5px">
                            			<a class="bg-secondary font-17 btnStyle2" id="btnAll" href="javascript:click()" onclick="attendanceAllClick();">전체</a>
                            			<a id="btnYes" href="javascript:click()" onclick="attendanceYesClick();">출석</a>
                            			<a id="btnEtc" href="javascript:click()" onclick="attendanceEtcClick();">기타</a>
                            		</div>
                            	</div>
                            	<form id="attendanceForm" method="post" action="${path}/teacher/modifyAttendanceOneState">
                            		<div id="tableHeight" style="overflow:auto; height: 500px">
		                                <table id="attendanceTable" class="table table">
		                                </table>
	                                </div>
		                            <div style="float:left">
		                                <a id="btnHome" href="${path}/teacher/lectureOne/${lectureNo}" class="btn btn-outline-secondary" style="border-radius: 4px;">돌아가기</a>
		                            </div>
		                            <div style="float:left">
		                                <button id="btnBack" class="btn btn-outline-secondary" style="border-radius: 4px;">뒤로</button>
		                            </div>
		                            <div class="text-right">
		                                <button class="btn btn-success" style="border-radius: 4px;" id="btnUpdate" type="button">업데이트</button>
		                            </div>
		                            <div class="text-right">
		                                <button id="btnModify" class="btn btn-info" style="border-radius: 4px;" type="button">수정</button>
		                            </div>
	                           </form>
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
    var attendanceList = new Array();
    var updateAttendanceDay = '';
    var updateCurrentDay = '';
    var attendanceListLength = 0;
    var lectureName = '';

    function attendanceAllClick(){
    	$('#attendanceTable').empty();
    	$.ajax({
			url:'${path}/teacher/attendanceListByDay',
			type:'GET',
			data:{lectureNo: '${lectureNo}', currentYear: '${currentYear}', currentMonth: '${currentMonth}', currentDay: updateCurrentDay},
			success:function(data){
				var strHead = '<thead>';
				strHead += '</tr>';
				strHead += '<td class="font-weight-bold">사진</td>';			
				strHead += '<td class="font-weight-bold">이름</td>';			
				strHead += '<td class="font-weight-bold">상태</td>';			
				strHead += '</tr>';
				strHead += '</thead>';
	
				$('#attendanceTable').append(strHead);
	
				$.each(data.attendanceList, function(index, attendance){
					$.each(attendance.studentList, function(index, student){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td><a href="javascript:click()" onclick="attendanceOne(\'' + student.studentId + '\')"><img width="100px" height="115px" src="${path}/images/';						
						strBody += student.studentImage;
						strBody += '"></a></td>';
						strBody += '<td>' + student.studentName + '</td>';	
						if(attendance.attendanceState == '출석'){
							strBody += '<td><button class="btn btn-info" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else if(attendance.attendanceState == '미출석'){
							strBody += '<td><button class="btn btn-danger" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else{
							strBody += '<td><button class="btn btn-secondary" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						}				
						strBody += '</tr>';
						strBody += '</tbody>';
		
						$('#attendanceTable').append(strBody);
					})
				})
				if(data.attendanceList.length == 0){
					$('#attendanceTable').empty();
					var strBody = '<tr>';
					strBody += '<td colspan="3">수강 날짜가 아닙니다.</td>';						
					strBody += '</tr>';

					$('#attendanceTable').append(strBody);
				}
			}
		});	
    	$('#btnAll').prop('class', 'bg-secondary font-17 btnStyle2');
    	$('#btnYes').removeClass('bg-secondary font-17 btnStyle2');
    	$('#btnEtc').removeClass('bg-secondary font-17 btnStyle2');
    }

    function attendanceYesClick(){
    	$('#attendanceTable').empty();
    	$.ajax({
			url:'${path}/teacher/attendanceListByDay',
			type:'GET',
			data:{lectureNo: '${lectureNo}', currentYear: '${currentYear}', currentMonth: '${currentMonth}', currentDay: updateCurrentDay},
			success:function(data){
				var strHead = '<thead>';
				strHead += '</tr>';
				strHead += '<td class="font-weight-bold">사진</td>';			
				strHead += '<td class="font-weight-bold">이름</td>';			
				strHead += '<td class="font-weight-bold">상태</td>';			
				strHead += '</tr>';
				strHead += '</thead>';
	
				$('#attendanceTable').append(strHead);
	
				$.each(data.attendanceYesList, function(index, attendance){
					$.each(attendance.studentList, function(index, student){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td><a href="javascript:click()" onclick="attendanceOne(\'' + student.studentId + '\')"><img width="100px" height="115px" src="${path}/images/';						
						strBody += student.studentImage;
						strBody += '"></a></td>';
						strBody += '<td>' + student.studentName + '</td>';	
						if(attendance.attendanceState == '출석'){
							strBody += '<td><button class="btn btn-info" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else if(attendance.attendanceState == '미출석'){
							strBody += '<td><button class="btn btn-danger" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else{
							strBody += '<td><button class="btn btn-secondary" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						}				
						strBody += '</tr>';
						strBody += '</tbody>';
		
						$('#attendanceTable').append(strBody);
					})
				})
				if(data.attendanceYesList.length == 0){
					$('#attendanceTable').empty();
					var strBody = '<tr>';
					strBody += '<td colspan="3">출석한 학생의 정보가 없습니다.</td>';						
					strBody += '</tr>';

					$('#attendanceTable').append(strBody);
				}
			}
		});	
    	$('#btnYes').prop('class', 'bg-secondary font-17 btnStyle2');
    	$('#btnAll').removeClass('bg-secondary font-17 btnStyle2');
    	$('#btnEtc').removeClass('bg-secondary font-17 btnStyle2');
    }

    function attendanceEtcClick(){
    	$('#attendanceTable').empty();
    	$.ajax({
			url:'${path}/teacher/attendanceListByDay',
			type:'GET',
			data:{lectureNo: '${lectureNo}', currentYear: '${currentYear}', currentMonth: '${currentMonth}', currentDay: updateCurrentDay},
			success:function(data){
				var strHead = '<thead>';
				strHead += '</tr>';
				strHead += '<td class="font-weight-bold">사진</td>';			
				strHead += '<td class="font-weight-bold">이름</td>';			
				strHead += '<td class="font-weight-bold">상태</td>';			
				strHead += '</tr>';
				strHead += '</thead>';
	
				$('#attendanceTable').append(strHead);
	
				$.each(data.attendanceEtcList, function(index, attendance){
					$.each(attendance.studentList, function(index, student){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td><a href="javascript:click()" onclick="attendanceOne(\'' + student.studentId + '\')"><img width="100px" height="115px" src="${path}/images/';						
						strBody += student.studentImage;
						strBody += '"></a></td>';
						strBody += '<td>' + student.studentName + '</td>';	
						if(attendance.attendanceState == '출석'){
							strBody += '<td><button class="btn btn-info" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else if(attendance.attendanceState == '미출석'){
							strBody += '<td><button class="btn btn-danger" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else{
							strBody += '<td><button class="btn btn-secondary" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						}				
						strBody += '</tr>';
						strBody += '</tbody>';
		
						$('#attendanceTable').append(strBody);
					})
				})
				if(data.attendanceEtcList.length == 0){
					$('#attendanceTable').empty();
					var strBody = '<tr>';
					strBody += '<td colspan="3">해당하는 학생의 정보가 없습니다.</td>';						
					strBody += '</tr>';

					$('#attendanceTable').append(strBody);
				}
			}
		});	
    	$('#btnEtc').prop('class', 'bg-secondary font-17 btnStyle2');
    	$('#btnAll').removeClass('bg-secondary font-17 btnStyle2');
    	$('#btnYes').removeClass('bg-secondary font-17 btnStyle2');
    }

    $('#btnUpdate').click(function(){
		if(attendanceList.length == 0){
			alert('변동 사항이 없습니다.');
		} else{
			alert(attendanceList.length + '명의 학생을 업데이트 합니다.');
			location.href = '${path}/teacher/modifyAttendance/${lectureNo}/'+updateAttendanceDay + '/' + attendanceList;
		}
    });
    
    $(document).ready(function(){
        if('${currentDay}' == 0){
	       	$('#attendanceTable').empty();
	       	$('#btnModify').hide();
	       	$('#btnUpdate').show();
	       	$('#btnBack').hide();
	       	$('#btnHome').show();
			$.ajax({
				url:'${path}/teacher/attendanceListByNow',
				type:'GET',
				data:{lectureNo: '${lectureNo}'},
				success:function(data){
					var strHead = '<thead>';
					strHead += '</tr>';
					strHead += '<td class="font-weight-bold">사진</td>';			
					strHead += '<td class="font-weight-bold">이름</td>';			
					strHead += '<td class="font-weight-bold">상태</td>';			
					strHead += '</tr>';
					strHead += '</thead>';
			
					$('#attendanceTable').append(strHead);
			
					$.each(data.attendanceList, function(index, attendance){
						$.each(attendance.studentList, function(index, student){
							var strBody = '<tbody>';
							strBody += '<tr>';
							strBody += '<td><a href="javascript:click()" onclick="attendanceOne(\'' + student.studentId + '\')"><img width="100px" height="115px" src="${path}/images/';						
							strBody += student.studentImage;
							strBody += '"></a></td>';
							strBody += '<td>' + student.studentName + '</td>';						
							if(attendance.attendanceState == '출석'){
								strBody += '<td><button class="btn btn-info" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
							} else if(attendance.attendanceState == '미출석'){
								strBody += '<td><button class="btn btn-danger" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
							} else{
								strBody += '<td><button class="btn btn-secondary" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
							}						
							strBody += '</tr>';
							strBody += '</tbody>';
				
							$('#attendanceTable').append(strBody);
						})
					})
						
					if(data.attendanceList.length == 0){
						$('#attendanceTable').empty();
						var strBody = '<tr>';
						strBody += '<td colspan="3">수강 날짜가 아닙니다.</td>';						
						strBody += '</tr>';
		
						$('#attendanceTable').append(strBody);
					} 
					
					$('#attendanceTitle').text(data.attendanceDay);
					updateAttendanceDay = data.attendanceDay;
					updateCurrentDay = data.currentDay;
					attendanceListLength = 0;
					for(var i=0; i<data.attendanceList.length; i++){
						attendanceListLength += data.attendanceList[i].studentList.length;
					}
					$('#attendanceCount').text('총' + (attendanceListLength) + '명' + ' - ' + '출석' + (data.attendanceYesList.length) + '명');
					$('#smallTitle').text(data.lectureName);
				}
			});	
    	} else{
    		attendanceClick('${currentDay}');
        }
    });

    function attendanceClick(currentDay){
    	$('#attendanceTable').empty();
       	$('#btnModify').hide();
       	$('#btnUpdate').show();
       	$('#btnBack').hide();
       	$('#btnHome').show();
       	$('#attendanceCategory').show();
       	$('#attendanceSmallTitle').text('변경사항을 체크 후 업데이트를 해주세요.');
    	$.ajax({
			url:'${path}/teacher/attendanceListByDay',
			type:'GET',
			data:{lectureNo: '${lectureNo}', currentYear: '${currentYear}', currentMonth: '${currentMonth}', currentDay: currentDay},
			success:function(data){
				var strHead = '<thead>';
				strHead += '</tr>';
				strHead += '<td class="font-weight-bold">사진</td>';			
				strHead += '<td class="font-weight-bold">이름</td>';			
				strHead += '<td class="font-weight-bold">상태</td>';			
				strHead += '</tr>';
				strHead += '</thead>';
	
				$('#attendanceTable').append(strHead);
	
				$.each(data.attendanceList, function(index, attendance){
					$.each(attendance.studentList, function(index, student){
						var strBody = '<tbody>';
						strBody += '<tr>';
						strBody += '<td><a href="javascript:click()" onclick="attendanceOne(\'' + student.studentId + '\')"><img width="100px" height="115px" src="${path}/images/';						
						strBody += student.studentImage;
						strBody += '"></a></td>';
						strBody += '<td>' + student.studentName + '</td>';
						if(attendance.attendanceState == '출석'){
							strBody += '<td><button class="btn btn-info" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else if(attendance.attendanceState == '미출석'){
							strBody += '<td><button class="btn btn-danger" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						} else{
							strBody += '<td><button class="btn btn-secondary" style="border-radius: 4px;" id="'+ student.studentId +'" type="button" onclick="stateClick(\'' + student.studentId + '\', \'' + attendance.attendanceState + '\')">' + attendance.attendanceState + '</button></td>';
						}				
						strBody += '</tr>';
						strBody += '</tbody>';
		
						$('#attendanceTable').append(strBody);
					})
				})
				if(data.attendanceList.length == 0){
					$('#attendanceTable').empty();
					var strBody = '<tr>';
					strBody += '<td colspan="3">수강 날짜가 아닙니다.</td>';						
					strBody += '</tr>';
					
					$('#attendanceCount').text('총 0명' + ' - ' + '출석 0명');
					$('#attendanceTable').append(strBody);
				}

				$('#attendanceTitle').text(data.attendanceDay);
				updateAttendanceDay = data.attendanceDay;
				updateCurrentDay = currentDay;
				attendanceListLength = 0;
				for(var i=0; i<data.attendanceList.length; i++){
					attendanceListLength += data.attendanceList[i].studentList.length;
				}
				$('#attendanceCount').text('총' + (attendanceListLength) + '명' + ' - ' + '출석' + (data.attendanceYesList[0].studentList.length) + '명');
				$('#smallTitle').text(data.lectureName);
			}
		});	
    }

    function stateClick(studentId, attendanceState){
		if($('#' + studentId).html() == '미출석'){
			$('#' + studentId).html('출석');
			$('#' + studentId).prop('class', 'btn btn-info')
							  .css('border-radius', '4px');
		} else if($('#' + studentId).html() == '출석'){
			$('#' + studentId).html('미출석');
			$('#' + studentId).prop('class', 'btn btn-danger')
			  				  .css('border-radius', '4px');
		} else{
			alert('상세보기 페이지에서 변경이 가능합니다. (사진 클릭)')
		}

		if(attendanceState != $('#' + studentId).html()){
			attendanceList.push(studentId);
		} else{		
				attendanceList = jQuery.grep(attendanceList, function(value) {
				return value != studentId;
			});
		}
    }

    $('#btnModify').click(function(){
		alert('변경하신 출결 상태로 수정하였습니다.');
		$('#attendanceForm').submit();
    });

    $('#btnBack').click(function(){
    	location.href = '${path}/teacher/modifyAttendanceOneBack/${lectureNo}'+ updateAttendanceDay;
    });

    function attendanceOne(studentId){
    	$('#attendanceTable').empty();
    	$('#btnUpdate').hide();
    	$('#btnModify').show();
       	$('#btnBack').show();
       	$('#btnHome').hide();
       	$('#attendanceCategory').hide();
       	$('#attendanceSmallTitle').text('변경 후 수정을 눌러주세요.');
    	$.ajax({
			url:'${path}/teacher/attendanceOne',
			type:'GET',
			data:{studentId: studentId, lectureNo: '${lectureNo}', attendanceDay: updateAttendanceDay},
			success:function(data){
				
				var strbody = '<tr>';
				strbody += '<th>사진</th>';
				strbody += '<td><img width="100px" height="115px" src="${path}/images/' + data.studentList[0].studentImage + '"></a></td>';
				strbody += '</tr>';
				strbody += '<tr>';
				strbody += '<th>이름</th>';
				strbody += '<td>'+ data.studentList[0].studentName +'</td>';
				strbody += '</tr>';
				strbody += '<th>전화번호</th>';
				strbody += '<td>'+ data.studentList[0].studentPhone +'</td>';
				strbody += '</tr>';
				strbody += '<th>출결 상태</th>';
				strbody += '<td><select class="form-control-plaintext form-control bg-light" name="attendanceState">';				
				if(data.attendanceState == '미출석'){
					strbody += '<option value="출석">미출석</option>'
					strbody += '<option value="출석">출석</option>'
					strbody += '<option value="결석">결석</option>'
					strbody += '<option value="조퇴">조퇴</option>'
					strbody += '<option value="지각">지각</option>'
				} else if(data.attendanceState == '출석'){
					strbody += '<option value="출석">출석</option>'
					strbody += '<option value="미출석">미출석</option>'
					strbody += '<option value="결석">결석</option>'
					strbody += '<option value="조퇴">조퇴</option>'
					strbody += '<option value="지각">지각</option>'
				} else if(data.attendanceState == '결석'){
					strbody += '<option value="결석">결석</option>'
					strbody += '<option value="출석">출석</option>'
					strbody += '<option value="미출석">미출석</option>'
					strbody += '<option value="조퇴">조퇴</option>'
					strbody += '<option value="지각">지각</option>'
				} else if(data.attendanceState == '조퇴'){
					strbody += '<option value="조퇴">조퇴</option>'
					strbody += '<option value="출석">출석</option>'
					strbody += '<option value="미출석">미출석</option>'
					strbody += '<option value="결석">결석</option>'
					strbody += '<option value="지각">지각</option>'
				} else{
					strbody += '<option value="지각">지각</option>'
					strbody += '<option value="출석">출석</option>'
					strbody += '<option value="미출석">미출석</option>'
					strbody += '<option value="결석">결석</option>'
					strbody += '<option value="조퇴">조퇴</option>'
				}
				strbody += '</select></td>';
				strbody += '</tr>';
				strbody += '</tr>';
				strbody += '<th>추가사항</th>';
				if(data.attendanceRemark == null){
					strbody += '<td><input class="form-control-plaintext form-control bg-light" type="text" name="attendanceRemark"></td>';
				} else{
					strbody += '<td><input class="form-control-plaintext form-control bg-light" type="text" name="attendanceRemark" value="'+ data.attendanceRemark +'"></td>';
				}
				strbody += '</tr>';
				strbody += '</tr>';
				strbody += '<th>마지막 업데이트</th>';
				strbody += '<td><input type="hidden" name="accountId" value="'+ studentId +'">';
				strbody += '<input type="hidden" name="attendanceDay" value="'+ updateAttendanceDay +'">';
				strbody += '<input type="hidden" name="lectureNo" value="${lectureNo}">'+ data.attendanceUpdatedate +'</td>';
				strbody += '</tr>';
	
				$('#attendanceTable').append(strbody);
			}
		});	
    }
    </script>
</body>
</html>








