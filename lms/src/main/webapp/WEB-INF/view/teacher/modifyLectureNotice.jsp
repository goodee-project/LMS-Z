<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyLectureNotice</title>
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
</head>
<body>
	<h1>강좌별 공지사항 수정</h1>
	<form method="post" action="${path}/teacher/modifyLectureNotice/${lectureNo}/${lectureNoticeNo}">
		<table>
			<tr>
				<td>공지번호</td>
				<td><input type="text" name="lectureNoticeNo" value="${lectureNoticeNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="lectureNoticeTitle" id="lectureNoticeTitle" value="${noticeOne.lectureNoticeTitle}" style="width:560px"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="3" cols="50" name="lectureNoticeContent" id="lectureNoticeContent">${noticeOne.lectureNoticeContent}</textarea></td>
			</tr>
		</table>
		<button type="button" id="updateBtn">수정</button>
	</form>
	
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
				elPlaceHolder : 'lectureNoticeContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#updateBtn').click(function(){
				oEditors.getById["lectureNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#lectureNoticeTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#lectureNoticeContent').val() == '<p>&nbsp;</p>' ||$('#lectureNoticeContent').val() == ''){
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