<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/join.js"></script>
<script>
	$(document).ready(function(){
		let header_height = $(".header").outerHeight();
		let main_height = $(".joinContainer").outerHeight(true);
		$(".footer").css("top", header_height + main_height + 200);
	}); 
</script>
<style>
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>

	<main class = "join">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "content">
					<div class = "container">
					<c:choose>
						<c:when test="${ result == 1 }">
							<h3>비밀번호 변경이 완료되었습니다.</h3>
						</c:when>
						<c:otherwise>
							<h3>계정 찾기</h3>
						</c:otherwise>
					</c:choose>
					</div>
					<div class = "commentary">
					<c:choose>
						<c:when test="${ result == 1 }">
							<p>비밀번호가 정상적으로 변경되었습니다.</p>
						</c:when>
						<c:otherwise>
							<p>회원님의 ${ find_information }는 ${ find_result } 입니다.</p>
							<p><a href="login_idfind.do?show=pass"  class = "pass_check">비밀번호가 기억나지 않으시나요?</a></p>
						</c:otherwise>
					</c:choose>
					</div>
					<div>
						<a href = "login.do"><button type = "button" id = "loginGo">로그인</button></a>
					</div>
				</div>
				
			</div>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="510px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>