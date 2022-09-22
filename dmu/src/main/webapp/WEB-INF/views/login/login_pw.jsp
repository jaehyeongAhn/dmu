<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/login.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/join.js"></script>
<script>
	$(document).ready(function(){
		$(".footer").css({"position" : "relative", "top" :"200px"});
	}); 
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 class = "header"></iframe>
	<main class = "id_pw_alter">
		<div class = "section">
			<div class = "container">
				<h2>비밀번호 변경</h2>			
			</div>
			<form name = "passwordAlterForm" action = "password_alter.do" method = "post">
				<input type = "hidden" name = "mid" value = "${ vo.mid }">
				<ul class = "loginList">
					<li>
						<div id = "idInput" class = "alterPassCheck">
							<input type = "password" name = "pass"  id = "alterPass1" placeholder = "비밀번호를 입력해 주세요." maxlength = "14">								
						</div>
					</li>
					<li>
						<div id = "passInput" class = "alterPassInput">
							<input type = "password" name = "pass1" id = "alterPass2" placeholder = "비밀번호를 다시 입력해주세요" maxlength = "14">
						</div>
					</li>
					<li>
						<div id = "loginBtn">
							<button type = "button" id = "password_alterBtn">비밀번호 변경</button>				
						</div>
					</li>
				</ul>
			</form>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="510px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>