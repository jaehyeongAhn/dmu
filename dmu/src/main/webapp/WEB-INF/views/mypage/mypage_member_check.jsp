<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<!-- 이미지 경로 수정하기 -->
<script>
	$(document).ready(function(){
	});
</script>
<style>
	
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 class = "header"></iframe>
	<!-- 사이드 메뉴 -->
	<div class = "main">
		<div class = "section">
			<div class = "container">
				<aside class="mypage">
					<div class="mypage-list">
						<a href="mypage_main.do" class="mypage-main">
							<strong class="menu-title">MY PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on">
									<a class="menu-title">MY TICKETS</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="mypage_ticket.do">티켓예매 목록</a>
											</li>
											<li class="">
												<a class="" href="mypage_review.do">나의 리뷰</a>
											</li>
										</ul>
									</div>
								</li>
								<li class="on">
									<a class="menu-title">MY INFO</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<strong><a class="" href="mypage_member_check.do" style = "color : black;">개인정보 변경/탈퇴</a></strong>
											</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</aside>

				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title">
						<h2>개인정보 변경/탈퇴</h2>
					</div>
					<div class="myinfo_check">
						<div class="myinfo-box">
							<p class="myinfo_check_comment">회원님의 개인정보를 소중하게
								보호하려고 노력하고 있습니다. 비밀번호 확인 후 개인정보를 제공합니다.</p>
							<div class="check_normal_area">
								<h4>비밀번호</h4>
								<div class="field-area password">
									<div class="pass_check_area">
										<input autocomplete="new-password" placeholder="비밀번호를 입력해 주세요."
											maxlength="14" type="password" class=""> 
										<a class=""></a>
										<!---->
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bottom one">
							<div class="btn-bottom-area">
								<button type="button" class="member_check">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="500px" scrolling="no" frameborder=0 class = "footer" ></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
				<p id = "popup_joinGuide"></p>
				<div class = "popup_button">
					<button type = "button" id = "popup_joinNo">취소</button>
					<button type = "button" id = "popup_joinOk">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>