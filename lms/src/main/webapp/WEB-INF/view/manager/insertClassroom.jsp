<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의실 추가</h1>
	<form method="post" action="${path }/manager/insertClassroomAction">
		<input type="hidden" name="classroomState" value="빈강의실">
		<table border="1">
			<tr>
				<td>강의실 번호</td>
				<td><input type="text" name="classroomNumber" ></td>
			</tr>
			<tr>
				<td>강의실 크기</td>
				<td><input type="text" name="classroomSize"></td>
			</tr>
			<tr>
				<td>강의실 인원</td>
				<td><input type="text" name="classroomTotal"></td>
			</tr>
		</table>
	</form>
</body>
</html>