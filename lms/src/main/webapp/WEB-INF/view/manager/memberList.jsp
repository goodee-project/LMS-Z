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
	<h1>memberList</h1>
	<form method="post" action="${path }/manager/searchMemberList">
		<div> 직책 :
			<select name="searchLevel">
				<c:if test="${searchLevel == '선택안함' }">
				<option value="선택안함" selected="selected">선택안함</option>
				</c:if>
				<c:if test="${searchLevel != '선택안함' }">
				<option value="선택안함">선택안함</option>
				</c:if>
				<c:if test="${searchLevel == '강사' }">
				<option value="강사" selected="selected">강사</option>
				</c:if>
				<c:if test="${searchLevel != '강사' }">
				<option value="강사">강사</option>
				</c:if>
				<c:if test="${searchLevel == '학생' }">
				<option value="학생" selected="selected">학생</option>
				</c:if>
				<c:if test="${searchLevel != '학생' }">
				<option value="학생">학생</option>
				</c:if>
			</select>
			<!--  미구현
			이름 :
			<c:if test="${searchName =='noSearch' }">
			<input type="text" name="searchName">
			</c:if>
			<c:if test="${searchName !='noSearch' }">
			<input type="text" name="searchName" value="${searchName }">
			</c:if>
			
			-->
			<button type="submit">검색</button>
		</div>
	</form>
	<table border="1">
		<thead>
			<tr>	
				<th>아이디</th>
				<th>이름</th>
				<th>직책</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${memberList }">
				<tr>
					<td>${m.accountId }</td>
					<c:if test="${m.student.studentName !=null }">
					<td>${m.student.studentName }</td>
					</c:if>
					<c:if test="${m.teacher.teacherName !=null }">
					<td>${m.teacher.teacherName }</td>
					</c:if>
					<td>${m.accountLevel }</td>
					<td>${m.accountState }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
   	<div>
   		<!-- 첫페이지이고 전체 페이지가 '1'이 아닌 경우 이전버튼 표시 -->
   		<c:if test="${startPage!=1 && lastPage!=1}">
    		<span>
    			<a href="${path}/manager/memberList/${startPage-10}/${searchLevel}/${searchName }">이전&nbsp;&nbsp;</a>
    		</span>
   		</c:if>
   		<!-- lastPage가 10개를 채울수 없을 때 -->
   		<c:if test="${startPage+9 > lastPage }">
     	<c:forEach var="i" begin="${startPage }" end="${lastPage}">
     		<!-- 현재 페이지일 경우 -->
     		<c:if test="${currentPage == i }">
	      		<span>
	      			<a>${i}&nbsp;&nbsp;</a>
	      		</span>
     		</c:if>
     		<!-- 현재 페이지가 아닐 경우 -->
     		<c:if test="${currentPage != i }">
	      		<span>
	      			<a href="${path}/manager/memberList/${i}/${searchLevel}/${searchName }">${i}&nbsp;&nbsp;</a>
	      		</span>
     		</c:if>
     	</c:forEach>
    	</c:if>
    	<c:if test="${startPage+9<lastPage }">
    		<c:forEach var="i" begin="${startPage }" end="${startPage+9}">
	     		<!-- 현재 페이지일 경우 -->
	     		<c:if test="${currentPage == i }">
		      		<span>
		      			<a>${i}&nbsp;&nbsp;</a>
		      		</span>
	     		</c:if>
	     		<!-- 현재 페이지가 아닐 경우 -->
	     		<c:if test="${currentPage != i }">
		      		<span>
		      			<a href="${path}/manager/memberList/${i}/${searchLevel}/${searchName }">${i}&nbsp;&nbsp;</a>
		      		</span>
	     		</c:if>
     		</c:forEach>
    	</c:if>
    	<!-- 한페이지에서 보여지는 10개의 페이지보다 마지막 페이지가 크고 / 마지막페이지가 시작페이지와 같이 않다면-->
    	<c:if test="${startPage+9<lastPage && lastPage != startPage}">
	     	<span>
	     		<a href="${path}/manager/memberList/${startPage+10}/${searchLevel}/${searchName }">다음&nbsp;&nbsp;</a>
	     	</span>
    	</c:if>
   	</div>
</body>
</html>