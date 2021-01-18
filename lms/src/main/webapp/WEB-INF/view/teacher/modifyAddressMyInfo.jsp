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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                    <div class="col-md-6 col-lg-3">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">내 정보 관리</h4>
                                </div>
                                <div class="pl-1 mb-1">
									<jsp:include page="/WEB-INF/view/teacher/inc/myInfoMenu.jsp" flush="false"></jsp:include>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card" id="cardStyle">
                            <div class="card-body text-muted font-12">
                                <h4 class="card-title">주소변경</h4>
                                <div class="mb-3"></div>
                            	<form id="modifyAddressForm" method="post" action="${path}/teacher/modifyAddressMyInfo">
	                                <table id="myInfoTable2" class="table table">
										<tr>
											<th class=" font-14 font-weight-medium text-dark">현재 주소</th>
											<td class=" font-14 font-weight-medium text-dark">
												${teacher.teacherAddressMain}&nbsp;${teacher.teacherAddressSub}
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 주소</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="hidden" name="teacherId" value="${teacherId}">
												<input type="text" placeholder="도로명을 입력해 주세요" class="form-control-plaintext form-control bg-light" id="teacherAddressMain" name="teacherAddressMain">
												<div id="addDiv" style="width:100%; height:200px; overflow:auto">
													<table id="addressTable"></table>
												</div>
												<div id="btnStyle">
													<button class="btn btn-outline-secondary text-dark" id="btnAddressMainSearch" type="button">찾기</button>
													<button class="btn btn-outline-secondary text-dark" id="btnAddressMainReset" type="button" disabled="disabled" style="margin-right: -12px;">초기화</button>
												</div>
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 주소 상세정보</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="text" class="form-control-plaintext form-control bg-light" id="teacherAddressSub" name="teacherAddressSub">
											</td>
										</tr>
	                            	</table>
	                            	<div id="btnStyle">
		                            	<button type="button" class="btn btn-outline-secondary text-dark" id="btnResult">주소변경</button>
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
    	// 찾기 버튼을 눌렀을 경우 해당 도로길이 들어간 테이블 생성
		$('#btnAddressMainSearch').click(function(){
			$('#addressTable').empty();
			$.ajax({
				url:'${path}/teacherAddressSearch',
				type:'GET',
				data:{doro: $('#teacherAddressMain').val()},
				success:function(data){
					var strHead = '<thead>';
					strHead += '</tr><td>';
					strHead += '주소';			
					strHead += '<td></tr>';
					strHead += '</thead>';
	
					$('#addressTable').append(strHead);

					
					$.each(data.addressList, function(index, address){
						var dataSet = address.sido + ' ' + address.sigungu + ' ' + address.doro + ' ' + address.buildno1 + '-' + address.buildno2;
						
						var strBody = '<tbody>';
						strBody += '<tr><td>';
						strBody += '<a href="javascript:click()" onclick="addressClick(\'' + dataSet + '\')">';						
						strBody += dataSet;						
						strBody += '</a>';
						strBody += '</td></tr>';
						strBody += '</tbody>';

						$('#addressTable').append(strBody);
					})
				}
			});	
		});

		// 주소 검색 테이블에서 해당 버튼을 눌렀을 경우 teacherAddressMain이 채워진다.
		function addressClick(dataSet){
			$('#teacherAddressMain').val(dataSet)
									.prop('readonly', true);
			$('#addressTable').empty();
			$('#btnAddressMainSearch').prop('disabled', true);
			$('#btnAddressMainReset').prop('disabled', false);
		}

		// 초기화 버튼을 눌렀을 경우 찾기 버튼 활성화 및 초기화 버튼 비활성화
		$('#btnAddressMainReset').click(function(){
			$('#teacherAddressMain').val('')
									.prop('readonly', false);
			$('#btnAddressMainSearch').prop('disabled', false);
			$('#btnAddressMainReset').prop('disabled', true);
		})
		
		$('#btnResult').click(function(){
			if($('#teacherAddressMain').val() == ''){
				alert('도로명을 새 주소에 입력하고 찾기를 해주세요.');
			} else{
				if(confirm('선택하신 주소로 변경합니다.')){
					$('#modifyAddressForm').submit();
				}
			}
		});
    </script>
</body>
</html>










