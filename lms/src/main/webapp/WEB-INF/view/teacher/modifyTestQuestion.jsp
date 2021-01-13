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
    <title>modifyTestQuestion</title>
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
            			<div class="card" id="cardStyle">
            				<div class="card-body">
            					<h4 class="card-title">시험문제 수정</h4>
            					
            					<form id="test" method="post" action="${path}/teacher/modifyTestQuestion/${multiplechoiceNo}">
            						<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
	            						<tr>
											<td style="width:10%;">문제 번호</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceId" name="multiplechoiceId" value="${testOne.multiplechoiceId}" readonly="readonly">
											</td>
										</tr>
										<tr>
											<td>문제 내용</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceQuestion" name="multiplechoiceQuestion" value="${testOne.multiplechoiceQuestion}">
												<div id="choiceQuestion"></div>
											</td>
										</tr>
										<tr>
											<td>정답</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceAnswer" name="multiplechoiceAnswer" value="${testOne.multiplechoiceAnswer}">
												<div id="choiceAnswer"></div>
											</td>
										</tr>
										<tr>
											<td>점수</td>
											<td>
												<input class="form-control" type="text" id="multiplechoiceScore" name="multiplechoiceScore" value="${testOne.multiplechoiceScore}">
												<div id="choiceScore"></div>
											</td>
										</tr>
            						</table>
            						<table id="lmsTable" class="table" style="margin-top:20px; text-align:center;">
            							<thead>
            								<tr>
            									<th style="width:20%;">보기 번호</th>
            									<th>보기 문항</th>
            								</tr>
            							</thead>
            							<tbody>
            								<c:forEach var="i" items="${testOne.multiplechoiceExampleList}" varStatus="status">
            									<tr>
            										<td><input class="form-control text-center" type="text" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleId" value="${i.multiplechoiceExampleId}" readonly="readonly"></td>
            										<td><input class="form-control" type="text" id="multiplechoiceExampleContent${status.count}" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleContent" value="${i.multiplechoiceExampleContent}"></td>
            									</tr>
            								</c:forEach>
            							</tbody>
            						</table>
            						<button class="btn btn-info" style="border-radius:4px; float:right;" id="btn" type="button">수정</button>
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
		var question = 'success';
		var answer = 'success';
		var score = 'success';
		var content1 = 'success';
		var content2 = 'success';
		var content3 = 'success';
		var content4 = 'success';
		var content5 = 'success';

		$('#btn').click(function(){
			if(question == 'success' && answer == 'success' && score == 'success' && content1 == 'success' 
				&& content2 == 'success' && content3 == 'success' && content4 == 'success' && content5 == 'success'){
				$('#test').submit();
			}else{
				alert('빈칸을 입력해주세요.');
			}
		});
		var checkIdByAnswer = /^[1-5]{1}$/;
		// 시험문제 공백 검사
		$('#multiplechoiceQuestion').on('propertychange change keyup paste input', function(){
			if($('#multiplechoiceQuestion').val() == ""){				
				$('#choiceQuestion').text('문제를 입력해주세요');
				question = '';	
			}else{
				$('#choiceQuestion').text('');
				question = 'success';
				console.log('question성공');
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
				console.log('answer성공');
			}
		});
		var checkIdByScore = /^[0-9]{1,2}$/;
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
				console.log('content1성공');
			}
		});
		$('#multiplechoiceExampleContent2').on('propertychange change keyup paste input', function(){
			if($('#multiplechoiceExampleContent2').val() == ""){				
				$('#exampleContent2').text('문항을 입력해주세요');
				content2 = '';
			}else{
				$('#exampleContent2').text('');
				content2 = 'success';
				console.log('content2성공');
			}
		});
		$('#multiplechoiceExampleContent3').on('propertychange change keyup paste input', function(){
			if($('#multiplechoiceExampleContent3').val() == ""){				
				$('#exampleContent3').text('문항을 입력해주세요');
				content3 = '';
			}else{
				$('#exampleContent3').text('');
				content3 = 'success';
				console.log('content3성공');
			}
		});
		$('#multiplechoiceExampleContent4').on('propertychange change keyup paste input', function(){
			if($('#multiplechoiceExampleContent4').val() == ""){				
				$('#exampleContent4').text('문항을 입력해주세요');
				content4 = '';
			}else{
				$('#exampleContent4').text('');
				content4 = 'success';
				console.log('content4성공');
			}
		});
		$('#multiplechoiceExampleContent5').on('propertychange change keyup paste input', function(){
			if($('#multiplechoiceExampleContent5').val() == ""){				
				$('#exampleContent5').text('문항을 입력해주세요');
				content5 = '';
			}else{
				$('#exampleContent5').text('');
				content5 = 'success';
				console.log('content5성공');
			}
		});
    </script>
</body>
</html>