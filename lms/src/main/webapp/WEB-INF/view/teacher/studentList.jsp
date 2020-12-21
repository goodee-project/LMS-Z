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
	<c:forEach var="s" items="${studentList}" varStatus="status">
		<div>
			<input type="text" id="studentId${status.index }" value="${s.studentId }">
			<input type="text" id="studentName${status.index }" value="${s.studentName }">
			<a href="${path}/teacher/msgToFrom/${s.studentId}/${s.studentName}/${teacherId}/${lectureNo}">메세지 보기</a>
			<c:if test="${s.msg.isConfirm == false }">
				<span id="${status.index }">■</span>
			</c:if>
		</div>
	</c:forEach>
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
    $(document).ready(function(){
    	function msgList(){
			let timerId=null;
			let a=0;
			let alarm;
			for(var i=0;i<${studentList.size()-1};i++){
				$.ajax({
					url:"${path}/teacher/msgList",
					type:"get",
					data:{
						studentId:"${studentId}",
						teacherId:"${myLectureListOne.lecture.accountId}"
						},
					success:function(data){
						
					}
				})
	    	}
        })
	</script>
</body>
</html>