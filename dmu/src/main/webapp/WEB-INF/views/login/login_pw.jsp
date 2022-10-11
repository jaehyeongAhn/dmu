<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/login.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/join.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function(){
		let pw_result = "${pw_result}";
		if(pw_result == 1){
			$(".background_join").addClass("show_join");
			$(".window_join").addClass("show_join");
			$("#popup_joinOk").click(function(){
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
			});
		}
	});
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
	<main class = "login">

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
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
					<p id = "popup_joinGuide">직전의 비밀번호는 사용할 수 없습니다.</p>
				<div class = "popup_button">
					<button type = "button" id = "popup_joinOk">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>