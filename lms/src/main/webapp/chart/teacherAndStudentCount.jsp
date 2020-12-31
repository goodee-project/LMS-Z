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
	<h1>lms이용자</h1>
	<div id="chartTable"></div>
	<br>
	<div>
		<span id="teacherAndStudentTotal"></span>
	</div>
	<div id="chartContainer">
		<canvas id="teacherAndStudentCountChart"></canvas>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$.ajax({
		url:'${path }/chart/teacherAndStudentCount',
		type:'get',
		success:function(data){
			let ctx = $('#teacherAndStudentCountChart');
			let chart = new Chart(ctx,{
				type:'doughnut',
				data:{
					labels:['teacher','student'],
					datasets:[{
						backgroundColor:[
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)'],
			            borderColor:[
				            'rgba(255, 99, 132, 0.2)',
			            	'rgba(54, 162, 235, 0.2)'],    
			                data:[data.teacher,data.student],
						}]
					},
					options:{}
				});
			}
	});
	$('#teacherAndStudentTotal').html('teacherAndStudentTotal');
	$.ajax({
		url:'${path }/chart/teacherAndStudentCount',
		type:'get',
		success:function(data){
			let html=`
				<table id="chartTable">
					<tr>
						<th>teacher</th>
						<th>student</th>
					</tr>
					<tr>
						<td>\${data.teacher}</td>
						<td>\${data.student}</td>
					</tr>
				</table>
				`;
			$('#teacherAndStudentTotal').html(html);
			}
	});
</script>
</html>