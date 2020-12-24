<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<a href="${path}/student/questionAdd">질문 등록하기</a>
	<table border="1">
		<thead>
			<tr>
				<th>질문 번호</th>
			 	<th>강의 번호</th>
			 	<th>작성자</th>
			 	<th>제목</th>
			 	<th>조회수</th>
			 	<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="q" items="${questionList}">
				<tr>
					<td><a href="${path}/student/questionCountUp/${q.questionNo}">${q.questionNo}</a></td>	
					<td>${q.lectureNo}: (${q.lecture.lectureName})</td>
					<td>${q.questionWriter}</td>
					<td>${q.questionTitle}</td>
					<td>${q.questionCount}</td>
					<td>${q.questionCreatedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:forEach var="i" begin="1" end="${lastPage}">
			<span>
				<a id="page" href="${path}/student/questionList/${i}">${i}</a>
			</span>
		</c:forEach>
	</div>
	<select id="sub">
		<option value="제목">제목</option>
		<option value="작성자">작성자</option>
	</select>
	<input type="text" id="question"> <a id="btn" href="">검색</a>
</body>
<script>
	$('#btn').on('click',function(){
		if($('#sub').val()=='제목' && $('#question').val()!=''){
			$('#btn').prop('href',"${path}/student/questionTitleSearch/"+$('#question').val()+"/1");
			$('#page').empty();
			$('#page').append(htmlAdd);
		} else if($('#sub').val()=='작성자' && $('#question').val()!=''){
			$('#btn').prop('href',"${path}/student/questionWriterSearch/"+$('#question').val()+"/1");
			} 

		if($('#question').val()==''){
			$('#btn').prop('href',"${path}/student/questionList/1");
		}
	})
</script>
</html>