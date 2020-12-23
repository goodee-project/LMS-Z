<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>faqOne</title>
</head>
<body>
	<h1>* ${faqOne.faqTitle }</h1>
	<div>
		<div>
			작성자 : ${faqOne.faqWriter } [${faqOne.accountId }]
		</div>
		<div>게시일 : ${faqOne.faqCreatedate}&nbsp;</div>
		<div>갱신일 : ${faqOne.faqUpdatedate}&nbsp;</div>
		<div>조회수 : ${faqOne.faqCount }</div>
	</div>
	<br>
	<div>
		<textarea style="resize:none;overflow:visible;" readonly="readonly" 
				cols="50" rows="10">${faqOne.faqContent}</textarea>
	</div>
	<div>
		<a href="${path }/manager/faqList/${faqOne.faqCategory }/${currentPage}">뒤로</a>&emsp;
		<a href="${path }/manager/modifyFaq/${faqOne.faqNo}/${currentPage}">수정</a>&emsp;
		<a href="${path }/manager/removeFaq/${faqOne.faqCategory}/${faqOne.faqNo}/${currentPage}">삭제</a>&emsp;
	</div>
</body>
</html>