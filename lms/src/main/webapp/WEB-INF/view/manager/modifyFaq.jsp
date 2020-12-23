<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>FaqModify</title>
</head>
<body>
	<h1>FAQ 수정</h1>
	<form method="post" action="${path}/manager/modifyFaq/${currentPage}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="faqNo" value="${faqOne.faqNo }" hidden="hidden">
					<input type="text" name="faqTitle" value="${faqOne.faqTitle }" style="width:350px">
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
					<textarea style="resize:none;overflow:visible;" name="faqContent" 
						cols="50" rows="10">${faqOne.faqContent}</textarea>
				</td>
			</tr>
		</table>
		<a href="${path }/manager/faqOne/${faqOne.faqNo}/${currentPage}">뒤로</a>&emsp;
		<button type="submit">수정</button>
	</form>
</body>
</html>