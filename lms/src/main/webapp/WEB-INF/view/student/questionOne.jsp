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
	<div id="add"></div> <div id="password"></div> <div id="view"></div>
<div id="tab">	
	
	<!-- 작성자 본인일시 수정 삭제 링크 나타냄 -->
	<div id="delUp"> 
	</div>
	<h1>질문</h1>
	<table border="1">
		<tr>
			<td>questionNo</td>
			<td>${question.questionNo }</td>
		</tr>
		<tr>
			<td>lectureNo</td>
			<td>${question.lectureNo}(${question.lecture.lectureName })</td>
		</tr>
		<tr>
			<td>accountId</td>
			<td>${question.accountId} 
				<input type="hidden" id="accountId" value="${question.accountId}">
				<input type="hidden" id="studentId" value="${studentId}">
			</td>	
		</tr>
		<tr>
			<td>questionWriter</td>
			<td>${question.questionWriter }</td>
		</tr>
		<tr>
			<td>questionTitle</td>
			<td>${question.questionTitle }</td>
		</tr>
		<tr>
			<td>questionContent</td>
			<td>${question.questionContent }</td>
		</tr>
		<tr>
			<td>questionCreatedate</td>
			<td>${question.questionCreatedate }</td>
		</tr>
		<tr>
			<td>questionUdateDate</td>
			<td>${question.questionUpdatedate }</td>
		</tr>
	</table>
		
		<input type="hidden" id="questionPassword" value="${question.questionPassword}">
	
	<h1>질문 파일</h1>
	<table border="1">
		<c:forEach var="qf" items="${question.questionfile}">
			<tr>
				<td>questionfile</td>
				<td>
					<a href="${path}/student/questionFileDownload/${qf.questionFileUuid}">${qf.questionFileOriginal}</a>
				</td>
			</tr>
		</c:forEach>	
	</table>
	
	<h1>댓글</h1>
	<table border="1">
		<c:forEach var="qc" items="${question.questionCommentList}">
			<tr>
				<td>작성자</td>
				<td>${qc.questionCommentWriter}</td>
	
				<td>내용</td>
				<td>${qc.questionCommentContent}</td>
			</tr>
		</c:forEach>
	</table>
</div>	
		<a href="${path}/student/questionList/1">이전 페이지</a>
</body>
<script>

function view(str) {
	 var obj = document.getElementById(str);

	 if (obj.style.display=="")
	  obj.style.display="none";
	 else
	  obj.style.display="";
	}
	
	$('#accountId').each(function(index, item){
		let htmlDelete = '<div><a href="${path}/student/questionRemove/${question.questionNo}">질문 삭제</a></div>'
		let htmlUpdate = '<div><a href="${path}/student/questionModify/${studentId}/${question.questionNo}">질문 수정</a></div>'
		let html = '<span>게시글의 수정과 삭제는 작성자만 할 수 있습니다.</span>'
		if($(item).val()==$('#studentId').val()){
				$('#delUp').append(htmlUpdate);
				$('#delUp').append(htmlDelete);
			}
		if($(item).val()!=$('#studentId').val()){
				$('#add').append(html);
			}
	});

	$('#questionPassword').each(function(index,item){
		let htmlAdd = '<h1>이 질문은 비공개 질문입니다.</h1> <div>비밀번호를 입력해주세요</div>'
		let password = '<input type="text" class="password"> <button type="button" id="btn">입력</button>'
		if($(item).val()!='' && $('#accountId').val()!= $('#studentId').val()){
				$('#tab').wrapInner('<div id="viewcode" style="display:none;"></div>');
		
				$('#add').empty();
				$('#add').append(htmlAdd);
				$('#password').append(password);
			}
	});

$('#btn').click(function(){	
	$('.password').each(function(index,item){
		let htmlView = '<a href="javascript:view(\'viewcode\');" >내용보기</a>'
		let success = '<h3>비밀번호가 일치합니다. 아래 내용보기를 클릭하면 질문 내용이 나타납니다.</h3>'	
		if($(item).val()==$('#questionPassword').val()){
			$('#view').append(htmlView);
			$('#password').empty();
			$('#add').empty();
			$('#add').append(success);
			}else if($(item).val()!=$('#questionPassword').val()){
				alert('비밀번호가 다릅니다');	
			}
	})	
});	

</script>
</html>