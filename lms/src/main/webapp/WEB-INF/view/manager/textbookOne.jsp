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
	<h1>교재 상세보기</h1>
	<table border="1">
		<tr>
			<td>textbook_isbn :</td>
			<td><span id="textbookIsbn">${textbookOne.textbookIsbn }</span></td>
		</tr>
		<tr>
			<td>textbook_title :</td>
			<td>${textbookOne.textbookTitle }</td>
		</tr>
		<tr>
			<td>textbook_writer :</td>
			<td>${textbookOne.textbookWriter }</td>
		</tr>
		<tr>
			<td>textbook_publisher :</td>
			<td>${textbookOne.textbookPublisher }</td>
		</tr>
		<tr>
			<td>textbook_info :</td>
			<td>${textbookOne.textbookInfo }</td>
		</tr>
		<tr>
			<td>textbook_price :</td>
			<td>${textbookOne.textbookPrice }</td>
		</tr>
		<tr>
			<td>textbook_publishdate :</td>
			<td>${textbookOne.textbookPublishdate }</td>
		</tr>
	</table>
	<button type="submit"  onclick="location.href='${path}/manager/modifyTextbookOne/${textbookOne.textbookIsbn}'">수정</button>
	<button id="deleteIsbn" type="button" onclick="location.href='${path}/manager/deleteTextbookOne/${textbookOne.textbookIsbn}'">삭제</button>
	
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
		$('#deleteIsbn').click(function(){
			$.ajax({
				url:'${path}/manager/textbookCk',
				type:'GET',
				data:{textbookIsbn: $('#textbookIsbn').text()},
				success:function(data){
					if(data.textbookCount ==0){
						$('#deleteIsbn').submit();
					}else{
						alert('강좌에서 사용중인 교재입니다.');	
						}
					}
			});
		
		});
    </script>
</body>
</html>