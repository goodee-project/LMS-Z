<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의실 추가</h1>
	<form id="classroom" method="post" action="${path }/manager/insertClassroomAction">
		<input type="hidden" name="classroomState" value="빈강의실">
		<table border="1">
			<tr>
				<th>강의실 번호</th>
				<td>
					<input type="text" id="classroomNumber" name="classroomNumber" >
					<div id="number"></div>
				</td>
				<td><button id="btnNumber" type="button" disabled="disabled">중복검사</button></td>
			</tr>
			<tr>
				<td>강의실 크기</td>
				<td>
					<input type="text" id="classroomSize" name="classroomSize">
					<div id="size"></div>
				</td>
			</tr>
			<tr>
				<td>강의실 인원</td>
				<td>
					<input type="text" id="classroomTotal" name="classroomTotal">
					<div id="total"></div>
				</td>
			</tr>
		</table>
	 	<a href="${path }/manager/classroomList/1">돌아가기</a>
		<button id="btn" type="button">강의실 추가</button>
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
		var num = '';
		var size= '';
		var total = '';
		$('#btn').click(function(){
			if(num== 'success' && size== 'success' && total== 'success'){
				$('#classroom').submit();
				} else{
					alert('형식을 확인하세요');
				}
		})
		var checkId = /^[0-9]{1,3}$/;
		$('#classroomNumber').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#classroomNumber').val())){				
				$('#number').text('중복 검사를 해주세요');
				$('#btnNumber').prop('disabled', false);				
			}else{
				$('#number').text('1~3자리 숫자를 입력해주세요');
				$('#btnNumber').prop('disabled', true);
				num = '';	
			}
		});
		$('#btnNumber').click(function(){
			$.ajax({
				url:'${path}/manager/classroomCk',
				type:'GET',
				data:{classroomNumber: $('#classroomNumber').val()},
				success:function(data){
					if(data.classroomNum == 0){
						if(confirm('추가 가능한 강의실입니다.')){
							$('#classroomNumber').prop('readonly', true);
							$('#btnNumber').prop("disabled", true);
							$('#number').text('');
							num = 'success';
						}
					} else{
						alert('이미 강의실이 등록되어 있습니다.');
						num = '';
					}
				}
			});	
		});
		$('#classroomSize').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#classroomSize').val())){				
				$('#size').text('');
				size='success';		
			}else{
				$('#size').text('1~3자리 숫자를 입력해주세요');
				size = '';	
			}
		});
		$('#classroomTotal').on('propertychange change keyup paste input', function(){
			if(checkId.test($('#classroomTotal').val())){				
				$('#total').text('');
				total='success';			
			}else{
				$('#total').text('1~3자리 숫자를 입력해주세요');
				total = '';	
			}
		});
	</script>
</body>
</html>