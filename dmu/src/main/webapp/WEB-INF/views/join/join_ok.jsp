<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM</title>
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
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 class = "header"></iframe>

	<main class = "join">
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
						<button type = "button" id = "loginGo">로그인</button>
					</div>
				</div>
				
			</div>
		</div>
		<%-- <div class = "background_terms">
			<div class = "window_terms">
				<div class = "popup_terms">
					
				</div>
			</div>
		</div> --%>
	</main>
	
	<iframe src="footer.do" width="100%" height="500px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>