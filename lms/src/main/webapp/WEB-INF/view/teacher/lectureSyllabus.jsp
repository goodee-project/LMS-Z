<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lecturePlan</title>
</head>
<body>
	<h1>강의계획서</h1>
	<fieldset>
		<legend>${plan.lectureName}</legend>
		<div>
			강의명 : ${plan.lectureName}(정원 : ${plan.lectureTotal})
		</div>
		<div>
			담당강사 : ${plan.teacherName}
		</div>
		<div>
			연락처 : ${plan.teacher.teacherEmail} / ${plan.teacher.teacherPhone}
		</div>
		<div>
			강의실 : ${plan.classroom.classroomNumber}호
		</div>
		<div>
			과목 : ${plan.subject.subjectName}
		</div>
		<div>
			강의기간 : ${plan.lectureStartdate} ~ ${plan.lectureEnddate}(교육이수 필수 이수시간 : ${plan.subject.subjectTotalday})
		</div>
		<div>
			교재 : ${plan.textbook.textbookTitle}(${plan.textbook.textbookPublishdate})
		</div>
		<div>
			저자 : ${plan.textbook.textbookWriter}
		</div>
		<div>
			출판사 : ${plan.textbook.textbookPublisher}
		</div>
		<div>
			내용 : ${plan.syllabus.syllabusContent}
		</div>
		<div>
			사인 : <img src="${plan.syllabus.syllabusTeachersign}" width="100" height="50">
		</div>
	</fieldset>
	<a href="${path}/teacher/lectureOne/${lectureNo}">목록</a>
</body>
</html>