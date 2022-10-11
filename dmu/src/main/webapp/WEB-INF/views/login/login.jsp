<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel = "stylesheet" href = "http://localhost:9000/dmu/resources/css/login.css">
<link rel = "stylesheet" href = "http://localhost:9000/dmu/resources/css/main_css.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/login.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function(){

		/* let height = $(document).height();
		$(".footer").css("top", height - 370); */
		
		/********* popup setup *********/
		function popup_login(guideLine) {
			$(".background_join").addClass("show_join");
			$(".window_join").addClass("show_join");
			$("#popup_joinGuide").html(guideLine);
			$("#popup_joinGuide").css({"line-height" : "1.5rem"});
			$("#popup_joinOk").click(function() {
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
			});
		}
		
		let login_result = "${ login_result }";
		if(login_result == "fail"){
			popup_login("아이디&nbsp;&nbsp;또는&nbsp;&nbsp;비밀번호가&nbsp;&nbsp;잘못&nbsp;&nbsp;입력되었습니다."
					+	"<br>아이디와&nbsp;&nbsp;비밀번호를&nbsp;&nbsp;정확히&nbsp;&nbsp;입력해&nbsp;&nbsp;주세요.");
		}else if(login_result == "accept"){
			popup_login("승인 대기 중인 계정입니다.");
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
				<h2>로그인</h2>			
			</div>
			<form name = "loginForm" action = "login_check.do" method = "post">
				<ul class = "loginList">
					<li>
						<div id = "idInput">
							<input type = "text" name = "mid" id = "login_id" placeholder = "아이디를 입력해 주세요." 
							maxlength = "20" autocomplete = "off" value = "${ cookie.rememberId.value }">								
						</div>
					</li>
					<li>
						<div id = "passInput">
							<input type = "password" name = "pass" id = "login_pass" placeholder = "비밀번호를 입력해 주세요." maxlength = "14">
						</div>
					</li>
					<li>
						<div id = "idSetup">
							<div>
								<input type = "checkbox" id = "id_save" name = "rememberId" ${ empty cookie.rememberId.value ? "" : "checked" }>
								<label for = "id_save">아이디 저장</label>
							</div>
							<div>
								<a href = "login_idfind.do">아이디 찾기</a>
								<a href = "login_idfind.do?show=pass">비밀번호 찾기</a>
							</div>
						</div>
					</li>
					<li>
						<div id = "loginBtn">
							<button type = "button" id = "loginOk">로그인</button>				
						</div>
						<div id = "joinBtn">
							<a href = "http://localhost:9000/dmu/join_status.do"><button type = "button">회원이&nbsp;아니신가요?&nbsp;가입하기</button></a>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style = "margin-bottom: -5px;"></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
				<p id = "popup_joinGuide"></p>
				<button type = "button" id = "popup_joinOk">확인</button>
			</div>
		</div>
	</div>
</body>
</html>