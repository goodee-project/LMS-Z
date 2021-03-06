<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위의 사이트 아이콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/assets/images/favicon.png">
    <title>lms</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>
<body>
	<div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>


	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
		<jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
		        
		<jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
		<div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">메세지</h3>
                    </div>
                </div>
            </div>
            <!-- 내용 -->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-lg-8 col-md-12">
            			<div class="card" id="card-style">
            				<div class="card-body">
            					<h4 class="card-title">학생목록</h4>
					            <div>
					            	 <span style="color:black; font-size:x-large;">${studentName }&nbsp;학생</span>
					            </div>
					            <div id="msgListDiv" style="width:90%">
					            	
					            </div>
					            <div>
					                <div>
								         <div>
								              <textarea class="form-control" style="resize:none" cols="80" rows="6" id="toStudentMsgContent"
								              name="msgContent" class="font-weight-medium text-dark px-4 py-4"></textarea>
								         </div>
								    </div>
								    <br>
								    <div>
								    	 <a class="btn btn-outline-secondary" style="border-radius:4px;" href="${path}/teacher/studentList/${teacherId}/${lectureNo}" type="button">뒤로가기</a>
								         <button class="btn btn-outline-success" style="border-radius: 4px;float:right; margin-left:8px;" type="button" id="teacherMsgBtn">입력</button>
								    </div>
					            </div>
					    	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					            
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
  	  	let timerId=null;
  		let html;
  	
		//데이터 입력
  		$('#teacherMsgBtn').click(function(){
					// 메세지를 입력하지 않았을 때는 아무 작동 하지 않도록 함
					if($('#toStudentMsgContent').val() != ""){
						$.ajax({
							url:'${path}/teacher/toStudentMsg',
							type:'post',
							data:{
								fromId:"${teacherId}",
								toId:"${student_Id}",
								fromName:"${teacherName}",
								msgContent:$('#toStudentMsgContent').val()
								},
							success:function(data){
								//console.log(data);
								//입력하면 내용 제거
								document.getElementById("toStudentMsgContent").value='';
							}
						})
					}
				})
				timerId=setInterval(msgList,3000);//3초
			})
			
  	  	
  	  	//리스트 출력
  	  	function msgList(){
  		// 학생의 메세지를 읽음
  		$.ajax({
			url:'${path}/teacher/teacherReadMsg',
			type:'post',
			data:{
				toId:"${teacherId}",
				fromId:"${student_Id}"
				},
			success:function(data){
				console.log(data);
				}
		})
		$.ajax({
			url:"${path}/teacher/msgList",
			type:"get",
			data:{
				studentId:"${student_Id}",
				teacherId:"${teacherId}"
				},
			success:function(data){
				$('#msgListDiv').empty();
				data.forEach(function(msgList,index){
						//console.log(msgList.msgContent);
						//console.log(msgList.isConfirm);
						
						//보낸 사람이 학생일 경우
						if(msgList.fromId != "${teacherId}"){
							//읽지 않았다면 1을 출력
							if(msgList.isConfirm == false){
							html = `
								 <div class="font-14 font-weight-medium px-2 py-2">
								<textarea style="resize:none;overflow:visible;" id="\${index}" readonly="readonly" cols="50"
                                name="" class="font-weight-medium text-dark px-4 py-4 align-right">\${msgList.msgContent}</textarea>
                                \${msgList.msgSendDatetime}<span style="color:yellow">1&emsp;</span>
								</div>
								`
								$('#msgListDiv').append(html);
								if(index==data.length-1){
									$("#"+index).focus();
								}
							//읽었다면 1 제거
							}else if(msgList.isConfirm == true){
								html = `
									 <div class="font-14 font-weight-medium px-2 py-2">
									<textarea style="resize:none;overflow:visible;" id=\${index} readonly="readonly" cols="50"
                                    name="" class="font-weight-medium text-dark px-4 py-4 align-right">\${msgList.msgContent}</textarea>
                                    \${msgList.msgSendDatetime}
									</div>
									`
								$('#msgListDiv').append(html);
								if(index==data.length-1){
									$("#"+index).focus();
								}
							}
						//보낸 사람이 강사인 경우
						}else if(msgList.fromId == "${teacherId}"){
							//읽지 않았을 경우 1표시
							if(msgList.isConfirm == false){
								html = `
									<div class="font-14 font-weight-medium px-2 py-2 float-right">
									<span style="color:yellow">1&emsp;</span>\${msgList.msgSendDatetime}
									 <textarea style="resize:none;overflow:visible;" id=\${index} readonly="readonly" cols="50"
                                    name="" class="font-weight-medium text-dark px-4 py-4 align-right">\${msgList.msgContent}</textarea>
                                    </div>
									`
								$('#msgListDiv').append(html);
								if(index==data.length-1){
									$("#"+index).focus();
								}
								//읽었을 경우 1제거
							}else if(msgList.isConfirm == true){
								html = `
									<div class="font-14 font-weight-medium px-2 py-2 float-right">
									\${msgList.msgSendDatetime}
									 <textarea style="resize:none;overflow:visible;" id=\${index} readonly="readonly" cols="50"
                                    name="" class="font-weight-medium text-dark px-4 py-4 align-right">\${msgList.msgContent}</textarea>
                                    </div>
									`
								$('#msgListDiv').append(html);
								//마지막 챗팅으로 포커스
								if(index==data.length-1){
									$("#"+index).focus();
								}
							}
						}
					})
					/*
					setInterval 건 초 안에 입력란에 채팅을 쳐야한다
					-> 3초라면 3초동안 쓰다가 한번 갱신되어 입력란 포커스가 풀린다
					**해결방안**
				*/		
					document.getElementById("toStudentMsgContent").focus();
				}
			})
  	  	}
  	  	
	</script>
</body>
</html>