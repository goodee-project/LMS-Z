<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="UTF-8">
<title>lmsNoticeOne</title>
</head>
<body>
	<h1>공지 상세보기</h1>
	<table border=1>
		<tr>
			<th>NO</th>
			<td>
				<input type="text" value="${lmsNotice.lmsNoticeNo }" readonly="readonly">
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
				<input type="text" value="${lmsNotice.lmsNoticeTitle }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea style="resize:none;overflow:visible;" cols="50" readonly="readonly">${lmsNotice.lmsNoticeContent }</textarea>
			</td>
		</tr>
	</table>
	<a href="${path }/manager/lmsNoticeList/${currentPage}">뒤로</a>&emsp;
	<a href="${path }/manager/modifyLmsNotice/${lmsNotice.lmsNoticeNo}/${currentPage}">수정</a>&emsp;
	<a href="${path }/manager/removeLmsNotice/${lmsNotice.lmsNoticeNo}/${currentPage}">삭제</a>
	
	
	
	
	
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
    </script>
</body>
</html>