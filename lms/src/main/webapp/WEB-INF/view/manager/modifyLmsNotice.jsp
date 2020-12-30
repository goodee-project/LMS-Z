<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="UTF-8">
<title>modifyLmsNotice</title>
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
</head>
<body>
	<h1>공지 수정</h1>
	<form method="post" action="${path}/manager/modifyLmsNotice/${currentPage}">
		<table border=1>
			<tr>
				<th>NO</th>
				<td>
					<input type="text" name="lmsNoticeNo" value="${lmsNotice.lmsNoticeNo }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>게시일</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeCreatedate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeUpdatedate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" value="${lmsNotice.lmsNoticeWriter }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="lmsNoticeTitle" id="lmsNoticeTitle" value="${lmsNotice.lmsNoticeTitle }" style="width:560px">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" name="lmsNoticeContent" id="lmsNoticeContent" style="resize:none;overflow:visible;" cols="50">${lmsNotice.lmsNoticeContent }</textarea>
				</td>
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
				elPlaceHolder : 'lmsNoticeContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#updateBtn').click(function(){
				//네이버 에디터 적용한 input value를 갖고 오기 위해
				oEditors.getById["lmsNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#lmsNoticeTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#lmsNoticeContent').val() == '<p>&nbsp;</p>' ||$('#lmsNoticeContent').val() == ''){
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