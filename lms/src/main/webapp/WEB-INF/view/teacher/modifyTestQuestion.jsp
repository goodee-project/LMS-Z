<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTestQuestion</title>
</head>
<body>
	<h1>시험문제 수정</h1>
	<form id="test" method="post" action="${path}/teacher/modifyTestQuestion/${multiplechoiceNo}">
		<table>
			<tr>
				<td>문제 번호</td>
				<td>
					<input type="text" id="multiplechoiceId" name="multiplechoiceId" value="${testOne.multiplechoiceId}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>문제 내용</td>
				<td>
					<textarea rows="5" cols="50" id="multiplechoiceQuestion" name="multiplechoiceQuestion">${testOne.multiplechoiceQuestion}</textarea>
					<div id="choiceQuestion"></div>
				</td>
			</tr>
			<tr>
				<td>정답</td>
				<td>
					<input type="text" id="multiplechoiceAnswer" name="multiplechoiceAnswer" value="${testOne.multiplechoiceAnswer}">
					<div id="choiceAnswer"></div>
				</td>
			</tr>
		</table>
		<c:forEach var="i" items="${testOne.multiplechoiceExampleList}" varStatus="status">
			<div>보기 번호 : <input type="text" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleId" value="${i.multiplechoiceExampleId}" readonly="readonly"></div>
			<div>보기 문항 : <input type="text" id="multiplechoiceExampleContent${status.count}" name="multiplechoiceExampleList[${status.count-1}].multiplechoiceExampleContent" value="${i.multiplechoiceExampleContent}"></div>
			<div id="exampleContent${status.count}"></div>
			&nbsp;
		</c:forEach>
		<button id="btn" type="button">수정</button>
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
		var question = 'success';
		var answer = 'success';
		var content1 = 'success';
		var content2 = 'success';
		var content3 = 'success';
		var content4 = 'success';
		var content5 = 'success';

		$('#btn').click(function(){
			if(question == 'success' && answer == 'success' && content1 == 'success' && content2 == 'success'
				&& content3 == 'success' && content4 == 'success' && content5 == 'success'){
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