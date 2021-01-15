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
    <title>addTestQuestion</title>
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">TestQuestion</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-12 col-md-12">
            			<div class="card" id="card-style">
            				<div class="card-body">
            					<h4 class="card-title">새 문제 등록</h4>
            					
            					<form action="${path}/teacher/addTestQuestion/${lectureNo}" method="post" id="test">
            						<input type="hidden" id="lectureNo" name="lectureNo" value="${lectureNo}">
            						<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
            							<tr>
											<td style="width:10%;">문제 번호</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceId" name="multiplechoiceId">
												<div id="choiceId"></div>
											</td>
										</tr>
										<tr>
											<td>문제 내용</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceQuestion" name="multiplechoiceQuestion">
												<div id="choiceQuestion"></div>
											</td>
										</tr>
										<tr>
											<td>정답</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceAnswer" name="multiplechoiceAnswer">
												<div id="choiceAnswer"></div>
											</td>
										</tr>
										<tr>
											<td>점수</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceScore" name="multiplechoiceScore">
												<div id="choiceScore"></div>
											</td>
										</tr>
            						</table>
            						
            						<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
            							<thead>
            								<tr>
            									<th style="width:20%;">보기번호</th>
            									<th>보기문항</th>
            								</tr>
            							</thead>
            							<tbody>
            								<c:forEach var="i" begin="1" end="5">
            									<tr>
            										<td><input class="form-control text-center" type="text" id="multiplechoiceExampleId" name="multiplechoiceExampleList[${i-1}].multiplechoiceExampleId" value="${i}" readonly="readonly"></td>
            										<td>
            											<input class="form-control" type="text" id="multiplechoiceExampleContent${i}" name="multiplechoiceExampleList[${i-1}].multiplechoiceExampleContent">
            											<div id="exampleContent${i}"></div>
            										</td>
            									</tr>
            								</c:forEach>
            							</tbody>
            						</table>
            						<a class="btn btn-outline-secondary" style="border-radius:4px;" href="${path}/teacher/testQuestionList/${lectureNo}">< 뒤로</a>
            						<div  style="float:right";>
            						<button class="btn btn-success" style="border-radius:4px;" id="btn" type="button">등록</button>
            						</div>
            					</form>
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
    
    <script>
    var id = '';
	var question = '';
	var answer = '';
	var score = '';
	var content1 = '';
	var content2 = '';
	var content3 = '';
	var content4 = '';
	var content5 = '';
	var checkId = /^[0-9]{1,2}$/;
	var checkIdByAnswer = /^[1-5]{1}$/;
	var checkIdByScore = /^[0-9]{1,2}$/;
	// 시험문제번호 공백 검사
	$('#multiplechoiceId').on('propertychange change keyup paste input', function(){
		if(!checkId.test($('#multiplechoiceId').val())){				
			$('#choiceId').text('번호를 입력해주세요');
			id = '';	
		}else{
			$('#choiceId').text('');
			id = 'success';
		}
	});
	// 시험문제 공백 검사
	$('#multiplechoiceQuestion').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceQuestion').val() == ""){				
			$('#choiceQuestion').text('문제를 입력해주세요');
			question = '';	
		}else{
			$('#choiceQuestion').text('');
			question = 'success';
		}
	});
	// 시험문제 답 공백 검사
	$('#multiplechoiceAnswer').on('propertychange change keyup paste input', function(){
		if(!checkIdByAnswer.test($('#multiplechoiceAnswer').val())){				
			$('#choiceAnswer').text('올바른 답을 입력해주세요');
			answer = '';	
		}else{
			$('#choiceAnswer').text('');
			answer = 'success';
		}
	});
	// 시험문제 점수 공백 검사
	$('#multiplechoiceScore').on('propertychange change keyup paste input', function(){
		if(!checkIdByScore.test($('#multiplechoiceScore').val())){				
			$('#choiceScore').text('점수를 입력해주세요');
			score = '';	
		}else{
			$('#choiceScore').text('');
			score = 'success';
		}
	});
	// 시험문제 보기 공백 검사(5개이기 때문에 각각 번호를 줘서 유효성 검사)
	$('#multiplechoiceExampleContent1').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceExampleContent1').val() == ""){				
			$('#exampleContent1').text('문항을 입력해주세요');
			content1 = '';
		}else{
			$('#exampleContent1').text('');
			content1 = 'success';
		}
	});
	$('#multiplechoiceExampleContent2').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceExampleContent2').val() == ""){				
			$('#exampleContent2').text('문항을 입력해주세요');
			content2 = '';
		}else{
			$('#exampleContent2').text('');
			content2 = 'success';
		}
	});
	$('#multiplechoiceExampleContent3').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceExampleContent3').val() == ""){				
			$('#exampleContent3').text('문항을 입력해주세요');
			content3 = '';
		}else{
			$('#exampleContent3').text('');
			content3 = 'success';
		}
	});
	$('#multiplechoiceExampleContent4').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceExampleContent4').val() == ""){				
			$('#exampleContent4').text('문항을 입력해주세요');
			content4 = '';
		}else{
			$('#exampleContent4').text('');
			content4 = 'success';
		}
	});
	$('#multiplechoiceExampleContent5').on('propertychange change keyup paste input', function(){
		if($('#multiplechoiceExampleContent5').val() == ""){				
			$('#exampleContent5').text('문항을 입력해주세요');
			content5 = '';
		}else{
			$('#exampleContent5').text('');
			content5 = 'success';
		}
	});
	// 시험문제번호 중복 검사
	$('#btn').click(function(){
		$.ajax({
			url:'${path}/teacher/questionIdOverlap',
			type:'GET',
			data:{multiplechoiceId:$('#multiplechoiceId').val(),
				lectureNo : $('#lectureNo').val()},
			success:function(data){
				if(data.questionId == 0){
					$('#choiceId').text('');
					if(id == 'success' && question == 'success' && answer == 'success' && score == 'success' && content1 == 'success' &&
					content2 == 'success' && content3 == 'success' && content4 == 'success' && content5 == 'success'){
						$('#test').submit();
					}
				}else{
					$('#choiceId').text('이미 등록된 번호입니다.');
				}
			}
		});
	});
    </script>
</body>
</html>