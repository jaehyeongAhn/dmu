<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<!-- 이미지 경로 수정하기 -->
<script>
	$(document).ready(function(){
	});
</script>
<style>
	
</style>
</head>
<body>
	<iframe src="header.do" width="100%" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
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
												<a class="" href="mypage_inquiry.do">나의 문의</a>
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
					<form name = "updateMemberForm" action = "update_info.do" method = "post" class = "mypage_member_form">
						<input type = "hidden" name = "mid" value = "${ vo.mid }">
						<input type = "hidden" name = "type" class = "type_check">
						<div class="myinfo">
							<div class="myinfo-box">
								<div class="top-title">
									<strong>기본 회원 정보</strong>
								</div>
									<div class="info-list">
										<ul>
											<li>
												<div class="info-list-title">아이디</div>
												<div class="info">${ vo.mid_security }</div>
											</li>
											<li>
												<div class="info-list-title">비밀번호</div>
												<div class="info">${ vo.pass }</div>
											</li>
											<li>
												<div class="info form">
													<strong class="new-password"> 새 비밀번호 </strong>
													<div>
														<div class="password-area new-pass">
															<input placeholder="새 비밀번호를 입력해 주세요." maxlength="14" 
																type="password" name = "pass" class="pass">
														</div>
													</div>
													<strong class="new-password check-pass"> 새 비밀번호 확인 </strong>
													<div>
														<div class="password-area new-pass-check">
															<input placeholder="새 비밀번호를 재입력해 주세요." maxlength="14" 
																type="password" name = "passCheck" class="passCheck">
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="info-list-title">내/외국인</div>
												<div class="info">${ vo.nationality }</div>
											</li>
											
											<li>
												<div class="info-list-title">성별</div>
												<div class="info info-gender">
													${ vo.gender }
													<!-- <div class="radio-area">
														<input id="m" type="radio" name="gender" value="m">
														<label for="m"><span class="check"></span> 남자 </label>
													</div>
													<div class="radio-area">
														<input id="f" type="radio" name="gender" value="f">
														<label for="f"><span class="check"></span> 여자 </label>
													</div> -->
												</div>
											</li>
											<li>
												<div class="info-list-title">이름</div>
												<div class="info">${ vo.mname }</div>
											</li>
											<li>
												<div class="info-list-title">생년월일</div>
												<div class="info">${ vo.birth }</div>
											</li>
											<li>
												<div class="info-list-title">휴대폰 번호</div>
												<div class="info">${ vo.pnumber }</div>
											</li>
											<li>
												<div class="info-list-title">이메일</div>
												<div class="info">${ vo.email }</div>
											</li>
											<li>
												<div class="info-list-title">주소</div>
												<div class="info">
													<p style = "margin-top : 0; margin-bottom: 15px;">${ vo.address }</p>
													<div class = "addrSimple">
														<input type = "text" name = "zonecode" id = "zonecode" placeholder = "새 우편번호">
														<input type = "text" name = "addr1" id = "addr1">
														<button type = "button" id = "addressCheck">주소 찾기</button>
													</div>
													<input type = "text" name = "addr2" id = "addr2" placeholder = "새로운 상세 주소 입력">
												</div>
											</li>
										</ul>
									</div>
							</div>
							<div class="withdrawal-agree">
								<div class="status">
									<a href = "#" class = "status_none"> 회원탈퇴 </a>
								</div>
							</div>
							<div class="btn-group">
								<div class="btn-area">
									<button type="button" class="secondary">취소</button>
								</div>
								<div class="btn-area">
									<button type="button" class="primary">저장</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
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