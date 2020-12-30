<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>FaqModify</title>
<!-- SmartEditor 텍스트편집기 -->
<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
</head>
<body>
	<h1>FAQ 수정</h1>
	<form method="post" action="${path}/manager/modifyFaq/${currentPage}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="faqNo" value="${faqOne.faqNo }" hidden="hidden">
					<input type="text" name="faqTitle" id="faqTitle" value="${faqOne.faqTitle }" style="width:560px">
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="faqCategory">
						<c:forEach var="c" items="${categoryList }">
							<c:if test="${category == c.faqCategory }">
								<option value="${c.faqCategory }" selected>${c.faqCategory }</option>
							</c:if>
							<c:if test="${category != c.faqCategory }">
								<option value="${c.faqCategory }">${c.faqCategory }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control"style="resize:none;overflow:visible;" 
					name="faqContent" id="faqContent" cols="50" rows="10">${faqOne.faqContent}</textarea>
				</td>
			</tr>
		</table>
		<a href="${path }/manager/faqOne/${faqOne.faqNo}/${currentPage}">뒤로</a>&emsp;
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
				elPlaceHolder : 'faqContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#updateBtn').click(function(){
				oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#faqTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#faqContent').val() == '<p>&nbsp;</p>'||$('#faqContent').val() == ''){
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