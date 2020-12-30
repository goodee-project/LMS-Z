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
	<h1>학생 가입수/탈퇴수</h1>
	<div id="chartTable">
		<span> 연도를 입력하세요 : </span>
		<input type="text" id="year">
		<button id="studentInOutCountByYearClick" type="button">Chart보기</button>
	</div>
	<br>
	<div>
		<span id="studentInOutCountByYear"></span>
	</div>
	<div id="chartContainer">
		<canvas id="studentInOutCountByYearChart"></canvas>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
$('#studentInOutCountByYearClick').click(function(){
	$('#studentInOutCountByYearChart').remove();
	$("#chartContainer").append('<canvas id="studentInOutCountByYearChart"></canvas>');
	$.ajax({
		url:'${path }/chart/studentInOutCount/'+$('#year').val(),
		type:'get',
		success:function(data){
			let ctx = document.getElementById('studentInOutCountByYearChart').getContext('2d');
			let chart = new Chart(ctx,{
				type:'line',
				data:{
					labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
					datasets:[{
						label:data[0].account_state,
						backgroundColor:[
							'rgba(255, 99, 132, 0.2)'],
			            borderColor:[
				            'rgba(255, 99, 132, 0.2)'],    
			                data:[data[0].january,data[0].february,data[0].march,data[0].april,data[0].may,data[0].june,data[0].july,data[0].august,data[0].september,data[0].october,data[0].november,data[0].december],
			                file:false,
						},{
						label:data[1].account_state,
						backgroundColor:[
							'rgba(54, 162, 235, 0.2)'],
			            borderColor:[
			                'rgba(54, 162, 235, 0.2)'],    
			                data:[data[1].january,data[1].february,data[1].march,data[1].april,data[1].may,data[1].june,data[1].july,data[1].august,data[1].september,data[1].october,data[1].november,data[1].december],
						}]
					},
					options:{}
				});
			}
	});
	$('#studentInOutCountByYear').html('studentInOutCountByYear');
	$.ajax({
		
		url:'${path }/chart/studentInOutCount/'+$('#year').val(),
		type:'get',
		dataType: 'json',
		success:function(data){
			console.log(data);
			let html=`
				<table id="chartTable">
					<thead>
						<tr>
							<th>계정상태</th>
							<th>january</th>
							<th>february</th>
							<th>march</th>
							<th>april</th>
							<th>may</th>
							<th>june</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].account_state}</td>
							<td>\${data[0].january}</td>
							<td>\${data[0].february}</td>
							<td>\${data[0].march}</td>
							<td>\${data[0].april}</td>
							<td>\${data[0].may}</td>
							<td>\${data[0].june}</td>
						</tr>
						<tr>
							<td>\${data[1].account_state}</td>
							<td>\${data[1].january}</td>
							<td>\${data[1].february}</td>
							<td>\${data[1].march}</td>
							<td>\${data[1].april}</td>
							<td>\${data[1].may}</td>
							<td>\${data[1].june}</td>
						</tr>
					</tbody>
				</table>
				<table id="chartTable">
					<thead>
						<tr>
							<th>계정상태</th>
							<th>july</th>
							<th>august</th>
							<th>september</th>
							<th>october</th>
							<th>november</th>
							<th>december</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].account_state}</td>
							<td>\${data[0].july}</td>
							<td>\${data[0].august}</td>
							<td>\${data[0].september}</td>
							<td>\${data[0].october}</td>
							<td>\${data[0].november}</td>
							<td>\${data[0].december}</td>
						</tr>
						<tr>
							<td>\${data[1].account_state}</td>
							<td>\${data[1].july}</td>
							<td>\${data[1].august}</td>
							<td>\${data[1].september}</td>
							<td>\${data[1].october}</td>
							<td>\${data[1].november}</td>
							<td>\${data[1].december}</td>
						</tr>
					</tbody>
				</table>
				`;
			$('#studentInOutCountByYear').html(html);
			}
	});
});
</script>
</html>