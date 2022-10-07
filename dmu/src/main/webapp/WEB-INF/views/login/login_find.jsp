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
/**************** login_find.do *************************/
	div.joinContainer div.container h3 {
		font-weight: 400;
	    font-size: 30px !important;
	    text-align: center;
	    margin-bottom: 10px;
	    letter-spacing: -0.08rem;
	}
	div.commentary p.login_ment {
		border-top: 2px solid black;
	    width: 800px;
	    font-size: 30px;
	    font-weight: 400;
	    padding: 50px 0;
	    background: #f5f5f5;
	    letter-spacing: -0.08rem;
	}
	div.container p.imformation_join {
		font-size: 30px;
	    text-align: left;
	}
	div.commentary p.idfind_check_comment {
	    padding: 50px 30px;
	    background: #f5f5f5;
	    border-top: 2px solid black;
	    font-size: 25px;
	}
</style>
<style>
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>

	<main class = "join" style = "height : 500px;">
		<div class = "section">
			<c:choose>
			<c:when test="${ result == 1 }">
			<div class = "joinContainer" style="width : 500px;">
			</c:when>
			<c:otherwise>
			<div class = "joinContainer" style="width : 700px;">
			</c:otherwise>
			</c:choose>
				<div class = "content">
					<div class = "container">
					<c:choose>
						<c:when test="${ result == 1 }">
							<img src = "http://localhost:9000/dmu/resources/images/join_ok.png" style="width:120px;">
							<h3 style = "font-size: 40px !important; line-height: 60px !important;">비밀번호 변경이<br>완료되었습니다.</h3>
						</c:when>
						<c:otherwise>
							<p class="imformation_join">가입한 정보</p>
						</c:otherwise>
					</c:choose>
					</div>
					<div class = "commentary" style="line-height: 25px;">
					<c:choose>
						<c:when test="${ result == 1 }">
							<p>비밀번호는 최소 3개월 이내<br>추가적으로 변경해주시는 것이 좋습니다.</p>
						</c:when>
						<c:otherwise>
							<p class="idfind_check_comment">${ find_information }님의 아이디는 <strong style = "color:black;">${ find_result }</strong> 입니다.</p>
							<p style="text-align: left;"><a href="login_idfind.do?show=pass"  class = "pass_check" 
							style = "text-decoration:underline;">비밀번호</a>가 기억나지 않으시나요?</p>
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
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>