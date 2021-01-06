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
    <title>insertLecture</title>
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
        
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">강좌 추가</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">강좌 등록</h4>
	                            <div>
	                            	<form method="post" action="${path }/manager/insertAction">
		                            	<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
		                            		<tr hidden="hidden">
												<td><input type="text" name="accountId" id="accountId"></td>
											<tr>
												<th style="width:15%;">subject_name</th>
												<td>
													<select class="form-control" style="width:100%;" name="subjectNo">
														<c:forEach var="s" items="${subjectList }">
															<option value="${s.subjectNo }">${s.subjectName }</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<!--
												<td>account_id/Name</td>
												<td>
													<select name="accountId">
														<c:forEach var="t" items="${teacherList }">
															<option value="${t.teacherId }">${t.teacherId}/${t.teacherName }</option>
														</c:forEach>
													</select>
												<!-- 	
													원래 등록 할때 이름 아이디 db에 들어가야함
													등록 눌렀을때 매칭할 때 운영자가 이 아이디를 쓰고잇는 강사이름 모름
													이름만 선택하고 insert할 때 id도 같이 입력햇음 좋겠다 -> 입력에 아이디 표시는 제거할 수 있잖아 
												
											<tr>
											
												<td>Name</td>
												<td>
													<select name="teacherName">
														<c:forEach var="t" items="${teacherList }">
															<option value="${t.teacherName }">${t.teacherName }</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											 -->
											 <tr>
												<th>Name</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="teacherName" id="teacherNameSelect" readonly>
													<button class="btn btn-outline-secondary" style="border-radius: 4px;" type="button" id="searchBtn">강사 검색</button>
												</td>
											</tr>
											<tr>
												<th>lecture_name</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="lectureName">
												</td>
											</tr>
											<tr>
												<th>total_date</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="lectureTotal">
												</td>
											</tr>
											<tr>
												<th>textbook</th>
												<td>
													<select class="form-control" style="width:100%;" name="textbookIsbn">
														<c:forEach var="t" items="${textbookList }">
															<option value="${t.textbookIsbn}">${t.textbookTitle }</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>syllabus</th>
												<td>
													<select class="form-control" style="width:100%;" name="syllabusNo">
														<c:forEach var="s" items="${syllabusList }">
															<option value="${s.syllabusNo }">${s.syllabusContent }</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>classroom</th>
												<td>
													<select class="form-control" style="width:100%;" name="classroomNo">
														<c:forEach var="c" items="${classroomList }">
															<option value="${c.classroomNo }">${c.classroomNumber }</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>start_date</th>
												<td>
													<input class="form-control" style="width:100%;" type="date" name="lectureStartdate">
												</td>
											</tr>
											<tr>
												<th>end_date</th>
												<td>
													<input class="form-control" style="width:100%;" type="date" name="lectureEnddate">
												</td>
											</tr>
										</table>
										<a  class="btn btn-outline-secondary" style="border-radius: 4px;" href="${path }/manager/lectureList/1">돌아가기</a>
										<button  class="btn btn-success" style="border-radius: 4px; float:right;" id="btn" type="submit">등록</button>
									</form>
									<form>
										<div id="teacherList" hidden="hidden">
											<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
												<thead>
												<tr>
													<th></th>
													<th>이름</th>
													<th>이메일</th>
													<th>성별</th>
													<th>설명</th>
													<th></th>
												</tr>
												</thead>
												<tbody class="tableBody">
													<c:forEach var="t" items="${teacherList }" varStatus="status">
														<tr>
															<td></td>
															<td id="name${status.index }">${t.teacherName}</td>
															<td id="email${status.index }">${t.teacherEmail}</td>
															<td id="gender${status.index }">${t.teacherGender}</td>
															<td id="birth${status.index }">${t.teacherBirth}</td>
															<td>
																<button class="btn btn-outline-secondary" style="border-radius: 4px;" type="button" id="${status.index }" value="">선택</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			$("#searchBtn").click(function(){
				$("#teacherList").removeAttr("hidden");
			})
			$('.tableBody button').each(function(index,item){
					//해당 선생님 정보를 선택했을 때
					$('#'+index).click(function(){
						console.log($('#name'+index).text());
						// 해당 선생님 이름 기입
						$('#teacherNameSelect').attr("value",$('#name'+index).text());
						// 해당 선생님 아이디 가져오기
						$.ajax({
							//restController
							url:'${path}/manager/searchTeacherId',
							type:'post',
							data:{
								teacherName:$('#name'+index).text(),
								teacherEmail:$('#email'+index).text(),
								teacherGender:$('#gender'+index).text(),
								teacherBirth:$('#birth'+index).text()
								},
							success:function(data){
								console.log(data);
								$('#accountId').attr("value",data);
								}
							})
						})
				})
				
		})
		
	</script>
</body>
</html>