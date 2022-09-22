<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/login.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/join.js"></script>
<style>
</style>
<script>
	$(document).ready(function(){
		let show = "${ show }";
		if(show == "pass"){
			//기존 show class 삭제
			$(".pass_tab div").removeClass("show");
			$(".id_tab div").removeClass("show");
			$(".idfind form.id_find").removeClass("show");
			
			$(".pass_tab div").addClass("show");
			$(".idfind form.pass_find").addClass("show");
		}
		
		$(".footer").css({"position" : "relative", "top" :"100px"});
	});
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 class = "header"></iframe>
	<main class = "login_id">
		<div class = "section">
			<div class = "container">
				<h2>계정 찾기</h2>			
			</div>
			<div class = "tab_menu">
				<div class = "id_tab">
					<div class = "show">
						<p>아이디 찾기</p>					
					</div>
				</div>
				<div class = "pass_tab">
					<div>
						<p>비밀번호 찾기</p>					
					</div>
				</div>
			</div>
			<div class = "idfind">			
				<form name = "loginIdFindForm" action = "login_findOk.do" method = "post" class = "id_find show">
					<div class = "message">
						<p>아이디를 잊으셨나요?</p>
						<p>회원정보에 등록된 연락처로 본인 확인을 진행하여 아이디를 찾아보세요.</p>
					</div>
					<ul class = "idfindList">
						<li>
							<label class = "idFindLabel">이름</label>
							<div id="idInput">
								<input type="text" name="mname" id="name_check"
									placeholder="이름을 입력해 주세요." maxlength="20">
							</div>
						</li>
						<li>
							<label class="checkpoint idFindLabel">이메일</label>
							<div class="emailTable">
								<input type="text" name="email1" id="email1" placeholder="이메일"><span>@</span>
								<input type="text" name="email2" id="email2"> <select
									name="email3" id="email3">
									<option value="default">직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
								</select>
								<button type = "button" id = "accredit_send" disabled>인증전송</button>	
							</div>
						</li>
						<li>
							<div id = "codeSet">
								<div>
									<input type = "text" id = "id_accredit" placeholder = "인증번호를 입력해 주세요.">
								</div>
								<div>
									<button type = "button" id = "accredit_check" disabled>인증확인</button>	
								</div>
							</div>
						</li>
						<li>
							<div id = "myidBtn">
								<button type = "button" id = "find_myid" disabled>아이디 찾기</button>
							</div>
						</li>
					</ul>
				</form>

				<form name = "loginPassFindForm" action = "pass_findOk.do" method = "post" class = "pass_find">
					<div class = "message">
						<p>비밀번호가 기억나지 않나요?</p>
						<p>회원정보에 등록된 이름, 아이디, 연락처를 입력하여<br></p>
						<p>본인 확인을 해 주시면 비밀번호를 재 설정할 수 있어요.</p>
					</div>
					<ul class = "passfindList">
						<li>
							<label class = "idFindLabel">이름</label>
							<div id="passInput">
								<input type="text" name="mname" id="name_check_pass"
									placeholder="이름을 입력해 주세요." maxlength="20">
							</div>
						</li>
						<li>
							<label class = "idFindLabel">아이디</label>
							<div id="passID">
								<input type="text" name="mid" id="name_check" class = "idCheckPass"
									placeholder="아이디를 입력해 주세요." maxlength="20">
							</div>
						</li>
						<li>
							<label class="checkpoint idFindLabel">이메일</label>
							<div class="emailPass">
								<input type="text" name="email1" id="pass_email1" placeholder="이메일"><span>@</span>
								<input type="text" name="email2" id="pass_email2"> <select
									name="email3" id="pass_email3">
									<option value="default">직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
								</select>
								<button type = "button" id = "accredit_send_pass" disabled>인증전송</button>	
							</div>
						</li>
						<li>
							<div id = "pass_codeSet">
								<div>
									<input type = "text" id = "pass_accredit" placeholder = "인증번호를 입력해 주세요.">
								</div>
								<div>
									<button type = "button" id = "pass_accredit_check" disabled>인증확인</button>	
								</div>
							</div>
						</li>
						<li>
							<div id = "myPassBtn">
								<button type = "button" id = "find_mypass" disabled>비밀번호 재설정</button>
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</main>
	

	<iframe src="footer.do" width="100%" height="510px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>