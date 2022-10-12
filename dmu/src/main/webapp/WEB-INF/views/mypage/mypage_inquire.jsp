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
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/jquery-ui.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function(){
		$(".review_write_btn").click(function(){
			$("body").css("overflow", "hidden");
			$(".popup_inquire_write").scrollTop(0);
			$(".inquire_category").val("default");
			$(".inquire_type").val("default");
			$("div.write_inquire_form input").val("");
			$("div.write_inquire_form textarea").val("");
			$(".background_inquire").addClass("show");
			$(".window_inquire").addClass("show");
			$(".inquire_close").click(function(){
				$("body").css("overflow", "auto");
				$(".background_inquire").removeClass("show");
				$(".window_inquire").removeClass("show");
			});
		});
		
		//문의 내역 상세 보기
		$("div.inquire_title .detail").click(function(){
			$("body").css("overflow", "hidden");
			$(".popup_inquire_detail_form").scrollTop(0);
			$(".background_inquire_detail").addClass("show");
			$(".window_inquire_detail").addClass("show");
			$(".inquire_detail_close").click(function(){
				$("body").css("overflow", "auto");
				$(".background_inquire_detail").removeClass("show");
				$(".window_inquire_detail").removeClass("show");
			});
		});
		//<button type = "button" class = "review_ok
		
		//팝업창 사이즈
		/* 문의사항 글쓰기 팝업창 */
		let height_wirte = $(".popup_inquire").height() - $(".popup_inquire_title").outerHeight() - $(".inquire_button_list").outerHeight();
		$(".popup_inquire_write").css("height", height_wirte);
		
		/* 문의사항 글보기 팝업창 */
		let height_content = $(".popup_inquire_detail").height() - $(".popup_inquire_detail_title").outerHeight() - $(".inquire_detail_button_list").outerHeight();
		$(".popup_inquire_detail_form").css("height", height_content);
	});
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
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
												<strong><a class="" href="mypage_inquire.do" style = "color : black;">나의 문의</a></strong>
											</li>
										</ul>
									</div>
								</li>
								<li class="on">
									<a class="menu-title">MY INFO</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="mypage_member_check.do">개인정보 변경/탈퇴</a>
											</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</aside>

				<style>
					div.inquire-title {
						display : flex;
						justify-content : space-between;
						align-items : center;
						border-bottom: 2px solid black;
						margin : 4px 0;
						padding : 0 0 8px 0;
					}
				</style>
				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title title-page inquire-title">
						<h2>나의 문의</h2>
						<div class = "inquire_wirte">
							<button type = "button" class = "review_write_btn">
								<div>+</div>
								<span class = "comment">문의작성</span>
							</button>
						</div>
					</div>
					
					<style>
						div.inquire_content {
						    margin: 20px 0;
						    border-bottom: 1px solid black;
						    /* border-top: 1px dashed #adadad; */
						}
						div.inquire_title,
						div.inquire_content_list {
							display : flex;
							justify-content : space-between;
							align-items : center;
						}
						
						div.inquire_title {
							padding: 10px 0;
						    font-size: 17px;
						    color: #323232;
					        position: relative;
						}
						div.inquire_title::after {
							content : "";
							width : 100%;
							height : 1px;
							background: #dbdbdb;
						    display: block;
						    position: absolute;
						    bottom: 0px;
						}
						div.inquire_title a.detail {
							color : black;
							text-decoration : none;
							display: flex;
    						align-items: center;
						}
						div.inquire_title a.detail::after {
							content: ">";
						    display: flex;
						    width: 20px;
						    height: 20px;
						    font-size: 14px;
						    margin-left: 2px;
						    text-align: center;
						    justify-content: center;
						    align-items: center;
						}
						
						div.inquire_content_list {
							position : relative;
							padding : 40px 0;
							letter-spacing : -0.03rem;
						}
						div.inquire_content_list h2{
							margin : 15px 0;
						}
						div.inquire_content_list_information span.first {
							color: #9f9d9d;
						}
						div.inquire_content_list_information span.second {
							color: black;
							margin-left : 5px;
						}
						div.inquire_content_list_information span.category::after {
							content : "|";
							font-size : 13px;
							margin : 0 10px;
						}
						div.inquire_content_list_answer {
							width: 170px;
						    height: 100%;
						    clip-path: polygon(25% 0%, 100% 0%, 100% 100%, 0% 100%);
						    background-color: black;
						    color: white;
						    text-align: center;
						    font-size: 20px;
						    position: absolute;
						    top: 0;
						    right: 0;
						    display: flex;
						    justify-content: center;
						    align-items: center;
						    padding-left: 20px;
						    box-sizing: border-box;
						}
					</style>
					<div class="contents">
						<div style = "width: 1076px; box-sizing: border-box;">
							<div class = "inquire">
								<div class = "inquire_content">
									<div class = "inquire_title">
										<div>
											<span><strong>문의 등록일</strong><span style = "margin-left : 10px;">2022.09.27</span></span>
										</div>
										<a href = "#" class = "detail">상세보기</a>
									</div>
									<div class = "inquire_content_list">
										<div class = "inquire_content_list_information">
											<span class = "category first">미술관<span class = "second">디뮤지엄</span></span>
											<span class = "first">문의유형<span class = "second"> 전시회/관람</span></span>
											<h2>디뮤지엄의 정확한 위치가 어디인지 알려주실 수 있으신가요?</h2>
										</div>
										<div class = "inquire_content_list_answer">
											<span>답변<br>완료</span>
										</div>
									</div>
								</div>
								<div class = "inquire_content">
									<div class = "inquire_title">
										<div>
											<span><strong>문의 등록일</strong><span style = "margin-left : 10px;">2022.09.27</span></span>
										</div>
										<a href = "#" class = "detail">상세보기</a>
									</div>
									<div class = "inquire_content_list">
										<div class = "inquire_content_list_information">
											<span class = "category first">미술관<span class = "second">디뮤지엄</span></span>
											<span class = "first">문의유형<span class = "second"> 전시회/관람</span></span>
											<h2>디뮤지엄의 정확한 위치가 어디인지 알려주실 수 있으신가요?</h2>
										</div>
										<div class = "inquire_content_list_answer" style = "background:#9b9b9b;">
											<span>답변<br>대기</span>
										</div>
									</div>
								</div>
							</div>
							<div class="no-result_purchase">
								<div class="no-result">
									<p>문의 하신 내역이 없습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

	<style>
		div.background_inquire {
			position : fixed;
			top : 0;
			left : 0;
			background : rgba(0, 0, 0, 0.7);
			width : 100%;
			height : 100vh;
			opacity : 0;
			z-index : -1;
		}
		div.window_inquire {
			position : relative;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
		}
		div.popup_inquire {
			position : absolute;
			top : 50%;
			left : 50%;
			width : 500px;
			height : 70vh;
			background-color : white;
			overflow : hidden;
			transform : translate(-50%, -30%);
			z-index : -1;
		}
		div.background_inquire.show {
			opacity : 1;
			z-index : 10;
			transition : all 0.3s;
		}
		div.background_inquire.show div.popup_inquire {
			transform : translate(-50%, -50%);
			z-index : 10;
			transition : all 0.3s;
		}
		
		div.popup_inquire_title {
		    padding: 10px 16px;
		    background: black;
		    color: white;
		    font-size: 17px;
	        letter-spacing: -0.08rem;
		}
		div.popup_inquire_write {
			position: absolute;
		    width: 100%;
		    overflow: auto;
		}
		div.popup_inquire_write_form {
			overflow : auto;
		    padding: 26px;
		    box-sizing : border-box;
		    /*height : 53vh;*/
		}
		div.popup_inquire_write_form p.title_comment {
			display : flex;
			align-items : center;
			font-size : 20px;
			font-weight : 700;
		    letter-spacing : -0.08rem;
		    margin-bottom: 10px;
		}
		div.popup_inquire_write_form p.title_comment::before {
			content : "";
			width : 20px;
			height : 20px;
			display : inline-block;
			margin-right : 10px;
			background-image : url("http://localhost:9000/dmu/resources/images/review.svg");
			background-repeat : no-repeat;
			background-size : contain;
			background-position-x : 50%;
			background-position-y : 50%;
		}
		div.popup_inquire_write_form p.comment {
		    font-weight : 300;
		    margin-bottom: 15px;
		    font-size : 14px;
		    letter-spacing : -0.08rem;
		}
		div.popup_inquire_write_form p.comment::before {
		    content: "*";
		    color: red;
		    margin-right: 7px;
		}
		
		div.popup_inquire_write_form div.write_form {
		    display: flex;
    		flex-direction: column;
		}
		div.popup_inquire_write_form div.write_form label {
			color: #7e7e7e;
		    letter-spacing: -0.05rem;
		    font-weight: 500;
		    font-size: 15px;
		    margin: 7px 0;
		}
		div.popup_inquire_write_form div.write_form label::after {
		    content: "*";
		    color: red;
		    font-size: 14px;
		    vertical-align: 3px;
		    margin-left: 3px;
		}
		div.popup_inquire_write_form div.write_form select {
			border: 0.5px solid #bdbdbd;
		    padding: 16px;
		    font-size: 15px;
		    letter-spacing: -0.05rem;
	        margin-bottom: 10px;
		}
		div.popup_inquire_write_form div.write_inquire_form ul {
		    list-style:none;
		    margin-top: 20px;
		}
		div.popup_inquire_write_form div.write_inquire_form ul li {
		    display: flex;
		    flex-direction: column;
		}
		div.popup_inquire_write_form div.write_inquire_form input {
		    font-size: 15px;
		    padding: 16px;
		    border: 0.5px solid #bdbdbd;
		    margin-bottom: 10px;
		    letter-spacing: -0.08rem;
		}
		div.popup_inquire_write_form div.write_inquire_form textarea {
		    height: 300px;
		    resize: none;
		    border: 0.5px solid #bdbdbd;
		    padding: 16px;
		}
		
		div.popup_inquire div.inquire_button_list {
			height: 55px;
		    box-shadow: -1px 7px 30px rgb(0 0 0 / 30%);
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    position: absolute;
		    bottom : 0;
		    width : 100%;
		}
		div.popup_inquire div.inquire_button_list button {
			width: 120px;
	    	margin: 5px;
	    	height : 80%;
		}
		div.popup_inquire div.inquire_button_list button.inquire_close {
			background : white;
			border : 0.5px solid black;
			cursor : pointer;
		}
		div.popup_inquire div.inquire_button_list button.inquire_ok {
			background : black;
			border : 0.5px solid black;
			color : white;
			cursor : pointer;
		}
		div.popup_inquire div.inquire_button_list button.inquire_close:hover {
			background : black;
			color : white;
		}
		div.popup_inquire div.inquire_button_list button.inquire_ok:hover {
			background : white;
			color : black;
		}
	</style>
	<div class = "background_inquire">
		<div class = "window_inquire">
			<div class = "popup_inquire">
				<div class = "popup_inquire_title">
					<p id = "popup_inquire">문의하기</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div class = "popup_inquire_write">
					<div class = "popup_inquire_write_form">
						<form name = "inquireWriteForm" action = "#" method = "post">
							<p class = "title_comment">문의하기</p>
							<p class = "comment">표시는 필수 입력 항목입니다.</p>
							<div class = "write_form">
								<label>미술관</label>
								<select name ="" class = "inquire_category">
									<option value = "default">미술관을 선택해주세요.</option>
									<option value = "디뮤지엄">디뮤지엄</option>
									<option value = "대림미술관">대림미술관</option>
									<option value = "구슬모아당구장">구슬모아당구장</option>
									<option value = "뮤지엄샵">"뮤지엄샵"</option>
								</select>
								<label>문의 유형</label>
								<select name ="" class = "inquire_type">
									<option value = "default">문의 유형을 선택해주세요.</option>
									<option value = "회원가입 · 정보변경">회원가입 · 정보변경</option>
									<option value = "전시">전시</option>
									<option value = "교육 · 문화 프로그램">교육 · 문화 프로그램</option>
									<option value = "이벤트 프로그램">이벤트 프로그램</option>
									<option value = "뮤지엄샵">"뮤지엄샵"</option>
									<option value = "사전답사 · 방문">사전답사 · 방문</option>
									<option value = "기타">기타</option>
								</select>
								<div class = "write_inquire_form">
									<ul>
										<li>
											<label>제목</label>
											<input type = "text" name = ""
												placeholder = "제목은 50글자 내로 입력해주세요.">
										</li>
										<li>
											<label>내용</label>
											<textarea placeholder="문의 내용을 입력해주세요"></textarea>
										</li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class = "inquire_button_list">
					<button type = "button" class = "inquire_close">취소</button>
					<button type = "button" class = "inquire_ok">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<style>
		div.background_inquire_detail {
			position : fixed;
			top : 0;
			left : 0;
			background : rgba(0, 0, 0, 0.7);
			width : 100%;
			height : 100vh;
			opacity : 0;
			z-index : -1;
		}
		div.window_inquire_detail {
			position : relative;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
		}
		div.popup_inquire_detail {
			position : absolute;
			top : 50%;
			left : 50%;
			transform : translate(-50%, -30%);
			width : 500px;
			height : 70vh;
			background : white;
			overflow : hidden;
			z-index : -1;
		}
		div.background_inquire_detail.show{
			opacity : 1;
			z-index : 10;
			transition : all 0.3s;
		}
		div.background_inquire_detail.show div.popup_inquire_detail {
			transform : translate(-50%, -50%);
			z-index : 10;
			transition : all 0.3s;
		}
		
		div.popup_inquire_detail_title {
		    padding: 10px 16px;
		    background: black;
		    color: white;
		    font-size: 17px;
		}
		div.popup_inquire_detail_form {
			overflow : auto;
		    padding: 26px;
		    /* height : 52.5vh; */
		    box-sizing : border-box;
		}
		div.popup_inquire_detail_content > p:first-child {
			display : flex;
			align-items : center;
			font-size : 20px;
			font-weight : 700;
		    margin-bottom: 25px;
		}
		div.popup_inquire_detail_content > p:first-child::before {
			content : "";
			width : 20px;
			height : 20px;
			display : inline-block;
		    background-image: url(http://localhost:9000/dmu/resources/images/review.svg);
		    background-repeat: no-repeat;
		    background-size: contain;
		    margin-right : 5px;
		}
		div.popup_inquire_detail_content div.category_list {
			margin : 10px 0;
		}
		div.popup_inquire_detail_content span.first {
			color: #9f9d9d;
		}
		div.popup_inquire_detail_content span.category::after {
			content : "|";
			font-size : 14px;
			margin : 0 10px;
		}
		div.popup_inquire_detail_content span.second {
			color: black;
			margin-left : 15px;
		}
		div.popup_inquire_detail_content div.inquire_write_date {
			margin : 10px 0;
			color : #9f9d9d;
		}
		
		div.popup_inquire_detail_content div.inquire_write_content p {
			font-size: 20px;
		    margin: 20px 0;
		    font-weight: 700;
		}
		div.popup_inquire_detail_content div.inquire_write_content div {
			border: 0.5px solid #dbdbdb;
    		padding: 15px;
		}
		
		div.inquire_detail_button_list {
			width : 100%;
			height : 60px;
			display : flex;
			justify-content : center;    
			box-shadow: 0px -10px 14px rgb(0 0 0 / 10%);
			position : absolute;
			bottom : 0;
		}
		div.inquire_detail_button_list button.inquire_detail_close {
		    border: 0.5px solid black;
		    background: black;
		    color : white;
		    font-size: 15px;
			width: 120px;
	    	margin: 5px;
		    letter-spacing: -0.08rem;
		    cursor : pointer;
		}
		div.inquire_detail_button_list button.inquire_detail_close:hover {
		    background: white;
		    color : black;
		}
	</style>
	<!-- 문의 상세 내역 보기 -->
	<div class = "background_inquire_detail">
		<div class = "window_inquire_detail">
			<div class = "popup_inquire_detail">
				<div class = "popup_inquire_detail_title">
					<p id = "popup_inquire_detail">문의 상세 보기</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div class = "popup_inquire_detail_form">
					<div class = "popup_inquire_detail_content">
						<p>문의 내역</p>
						<div class = "category_list">
							<span class = "category first">미술관<span class = "second">디뮤지엄</span></span>
							<span class = "first">문의유형<span class = "second"> 전시회/관람</span></span>
						</div>
						<div class = "inquire_write_date">
							<p>등록일자<span style = "color : black; margin-left : 10px;">2022.09.27</span></p>
						</div>
						<div class = "inquire_write_content">
							<p>디뮤지엄의 정확한 위치가 어디인지 알려주실 수 있으신가요?</p>
							<div>
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
								디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.디뮤지엄의 정확한 위치를 알고 싶습니다.
							</div>
						</div>
					</div>
				</div>
				<div class = "inquire_detail_button_list">
					<button type = "button" class = "inquire_detail_close">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>