<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/join.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
	<main class = "join_ok">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "content">
					<div class = "container">
						<img src = "http://localhost:9000/dmu/resources/images/join_ok.png">
						<h3>탈퇴가 완료되었습니다.</h3>
					</div>
					<div class = "commentary">
						<p>그동안 서비스를 이용해주셔서 감사합니다.</p>
					</div>
					<div>
						<a href = "index.do"><button type = "button" id = "loginGo">메인 화면으로 돌아가기</button></a>
					</div>
				</div>
				
			</div>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
</body>
</html>