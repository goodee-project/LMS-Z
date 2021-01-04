<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addSyllabus</title>
</head>
<body>
	<h1>강의계획서 추가</h1>
	<form id="syllabusForm" method="post" action="${path}/teacher/addSyllabus">
		<table>
			<tr>
				<td>강의계획</td>
				<td><textarea rows="5" cols="50" id="syllabuesContent" name="syllabusContent"></textarea></td>
			</tr>
			<tr>
				<td>강사 사인</td>
				<td>
					<canvas id="myCanvas" style="background-color: aliceblue" width="800" height="300"></canvas>
					<input type="hidden" id="syllabusTeachersign" name="syllabusTeachersign" value="">
				</td>
			</tr>
		</table>
		<div>
			<button type="button" id="resetBtn">다시쓰기</button>
			<button type="button" onclick="resultBtn();">확인</button>	
		</div>
	</form>
</body>
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
		$('#resetBtn').click(function(){
			canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
		});	

		// oneclick 형태로 확인을 누르고 조건이 만족할 경우 그려진 사인과 content가 submit
		function resultBtn(){
			if(isCanvasBlank(canvas) == true){
				alert('강사 사인을 입력해주세요.');
			} else if($('#syllabuesContent').val().length < 1){
				alert('강의 계획을 입력해주세요.');
			} else{
				$('#syllabusTeachersign').val(canvas.toDataURL());
				$('#syllabusForm').submit();
			}
		}

		// 캔버스가 비었는지를 초반 DataURL가 비교
		function isCanvasBlank(canvas) {
		       var blank = document.createElement('canvas');
		       blank.width = canvas.width;
		       blank.height = canvas.height;

		       return canvas.toDataURL() == blank.toDataURL();
		}
	
		var canvas, context;
		canvas = document.getElementById("myCanvas");
		context = canvas.getContext("2d");
		 
		context.lineWidth = 2; // 선 굵기를 2로 설정
		context.strokeStyle = "blue";
		 
		// 마우스 리스너 등록. e는 MouseEvent 객체
		canvas.addEventListener("mousemove", function (e) { move(e) }, false);
		canvas.addEventListener("mousedown", function (e) { down(e) }, false);
		canvas.addEventListener("mouseup", function (e) { up(e) }, false);
		canvas.addEventListener("mouseout", function (e) { out(e) }, false);
		 
		// 드래깅동안, 처음 마우스가 눌러진 좌표
		var startX=0, startY=0;
		var drawing=false;
		function draw(curX, curY) {
		    context.beginPath();
		    context.moveTo(startX, startY);
		    context.lineTo(curX, curY);
		    context.stroke();
		}
		function down(e) {
		    startX = e.offsetX; startY = e.offsetY;
		    drawing = true;
		}
		function up(e) { drawing = false; }
		function move(e) {
			// 마우스가 눌러지지 않았으면 리턴
		    if(!drawing) return; 
		    var curX = e.offsetX, curY = e.offsetY;
		    draw(curX, curY);
		    startX = curX; startY = curY;
		}
		function out(e) { drawing = false; }
	</script>
</html>