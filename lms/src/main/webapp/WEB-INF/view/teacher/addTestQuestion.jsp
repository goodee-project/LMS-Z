<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTestQuestion</title>
</head>
<body>
	<h1>새 문제 등록</h1>
	
	<form id="test" method="post" action="${path}/teacher/addTestQuestion/${lectureNo}">
		<input type="hidden" id="lectureNo" name="lectureNo" value="${lectureNo}">
		<table>
			<tr>
				<td>문제 번호</td>
				<td>
					<input type="text" id="multiplechoiceId" name="multiplechoiceId">
					<div id="choiceId"></div>
				</td>
			</tr>
			<tr>
				<td>문제 내용</td>
				<td>
					<textarea rows="5" cols="50" id="multiplechoiceQuestion" name="multiplechoiceQuestion"></textarea>
					<div id="choiceQuestion"></div>
				</td>
			</tr>
			<tr>
				<td>정답</td>
				<td>
					<input type="text" id="multiplechoiceAnswer" name="multiplechoiceAnswer">
					<div id="choiceAnswer"></div>
				</td>
			</tr>
			<tr>
				<td>점수</td>
				<td>
					<input type="text" id="multiplechoiceScore" name="multiplechoiceScore">
					<div id="choiceScore"></div>
				</td>
			</tr>
		</table>
		<c:forEach var="i" begin="1" end="5">
			<div>보기 번호 : <input type="text" id="multiplechoiceExampleId" name="multiplechoiceExampleList[${i-1}].multiplechoiceExampleId" value="${i}" readonly="readonly"></div>
			<div>보기 문항 : <input type="text" id="multiplechoiceExampleContent${i}" name="multiplechoiceExampleList[${i-1}].multiplechoiceExampleContent"></div>
			<div id="exampleContent${i}"></div>
			&nbsp;
		</c:forEach>
		<button id="btn" type="button">등록</button>
	</form>
	
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