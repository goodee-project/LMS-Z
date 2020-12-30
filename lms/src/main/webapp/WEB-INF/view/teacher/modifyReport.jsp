<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyReport</title>
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
</head>
<body>
	<h1>과제수정</h1>
		<form method="post" action="${path}/teacher/modifyReport/${reportOne.reportNo}">
			<table>
				<tr>
					<th>report_no</th>
					<td><input type="text" name="reportNo" value="${reportOne.reportNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>lecture_no</th>
					<td><input type="text" name="lectureNo" value="${reportOne.lectureNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>report_title</th>
					<td><input type="text" name="reportTitle" id="reportTitle" value="${reportOne.reportTitle}" style="width:560px"></td>
				</tr>
				<tr>
					<th>report_content</th>
					<td><textarea class="form-control" rows="3" cols="50" name="reportContent" id="reportContent">${reportOne.reportContent}</textarea></td>
				</tr>
				<tr>
					<th>report_startdate</th>
					<td><input type="datetime-local" name="reportStartdate" value="${reportOne.reportStartdate}"></td>
				</tr>
				<tr>
					<th>report_enddate</th>
					<td><input type="datetime-local" name="reportEnddate" value="${reportOne.reportEnddate}"></td>
				</tr>
			</table>
			<button type="button" id="updateBtn">수정하기</button>
		</form>
		<a href="${path}/teacher/reportOne/${reportOne.reportNo}">뒤로가기</a>
		
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
		$(document).ready(function() {
			// SmartEditor2 스크립트 추가
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : 'reportContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#updateBtn').click(function(){
				oEditors.getById["reportContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#reportTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#reportContent').val() == '<p>&nbsp;</p>' ||$('#reportContent').val() == ''){
					alert('내용을 입력해주세요.');
					}
				else{
					$('#updateBtn').removeAttr("type");
					$('#updateBtn').attr("type","submit");
					}
				});
			
		})
	</script>
</body>
</html>