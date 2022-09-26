<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$(".footer").css({"position" : "relative", "top" :"100px"});
	}); 
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>

	<main class = "join_ok">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "content">
					<div class = "container">
						<img src = "http://localhost:9000/dmu/resources/images/join_ok.png">
						<h3>회원 가입이 완료되었습니다.</h3>
					</div>
					<div class = "commentary">
						<p>가입을 축하드립니다.</p>
						<p>로그인 후 회원에게만 제공되는 다양한 혜택을 만나 보세요.</p>
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