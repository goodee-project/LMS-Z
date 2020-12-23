<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>
	<h1>FAQ</h1>
	<div>
		<!-- 카테로리 선택 -->
		<c:forEach var="c" items="${categoryList }">
			<!-- 현재 카테고리 페이지이면 a링크 삭제 -->
			<c:if test="${c.faqCategory == currentFaqCategory }">
				<span>${c.faqCategory }</span>
				&emsp;
			</c:if>
			<c:if test="${c.faqCategory != currentFaqCategory }">
				<span><a href="${path }/manager/faqList/${c.faqCategory}/1">${c.faqCategory }</a></span>
				&emsp;
			</c:if>
		</c:forEach>
	</div>

	<br>

	<div>
		<table border="1">
			<thead>
				<tr>
					<th>NO</th>
					<th>작성자</th>
					<th>제목</th>
					<th>게시일</th>
					<th>수정일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="f" items="${faqList }" varStatus="status">
					<tr>
						<td>
							<!-- 
								첫페이지 6,5,4,3,2에서 다음페이지 1이 나와야하지만 넘어가면 6 출력
								*해결 방법 
							-->
							<span>${(totalRow-(5*(currentPage-1)))-(status.index)}</span>
							<span hidden="hidden">${f.faqNo}</span>
						</td>
						<td>${f.faqWriter }</td>
						<td>
							<a href="${path }/manager/faqCountUp/${f.faqNo }/${currentPage}">${f.faqTitle}</a>
						</td>
						<td>${f.faqCreatedate}</td>
						<td>${f.faqUpdatedate}</td>
						<td>${f.faqCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 페이징 처리 -->
	<div>
		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
		<c:if test="${startPage!=1 && lastPage!=1}">
			<span> <a
				href="${path}/manager/faqList/${currentFaqCategory }/${startPage-10}">이전&nbsp;&nbsp;</a>
			</span>
		</c:if>
		<!-- lastPage가 10개를 채울수 없을 때 -->
		<c:if test="${startPage+9 > lastPage }">
			<c:forEach var="i" begin="${startPage }" end="${lastPage}">
				<!-- 현재 페이지일 경우 -->
				<c:if test="${currentPage == i }">
					<span> <a>${i}&nbsp;&nbsp;</a>
					</span>
				</c:if>
				<!-- 현재 페이지가 아닐 경우 -->
				<c:if test="${currentPage != i }">
					<span> <a
						href="${path}/manager/faqList/${currentFaqCategory }/${i}">${i}&nbsp;&nbsp;</a>
					</span>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${startPage+9<lastPage }">
			<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
				<!-- 현재 페이지일 경우 -->
				<c:if test="${currentPage == i }">
					<span> <a>${i}&nbsp;&nbsp;</a>
					</span>
				</c:if>
				<!-- 현재 페이지가 아닐 경우 -->
				<c:if test="${currentPage != i }">
					<span> <a
						href="${path}/manager/faqList/${currentFaqCategory }/${i}">${i}&nbsp;&nbsp;</a>
					</span>
				</c:if>
			</c:forEach>
		</c:if>
		<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
		<c:if test="${startPage+9<lastPage && lastPage != startPage}">
			<span> <a
				href="${path}/manager/faqList/${currentFaqCategory }/${startPage+10}">다음&nbsp;&nbsp;</a>
			</span>
		</c:if>
	</div>

	<span><a href="${path }/manager/index">메인으로</a></span>&emsp;
	<span><a href="${path }/manager/addFaqList/${managerId }/${currentPage}">FAQ 작성</a></span>
</body>
</html>