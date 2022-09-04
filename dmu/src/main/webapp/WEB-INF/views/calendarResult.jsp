<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>선택한 날짜 : ${ cdate.get(0) }</p>
	<p>접속 IP : ${ cdate.get(1) }</p>
	<a href = "http://localhost:9000/dmu/calendar.do"><button type = "button">다시 선택하기</button></a>
</body>
</html>