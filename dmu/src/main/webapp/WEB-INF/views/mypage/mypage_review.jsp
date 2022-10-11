<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
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
			$(".background").addClass("show");
			$(".window").addClass("show");
			$(".popup_close").click(function(){
				$(".background").removeClass("show");
				$(".window").removeClass("show");
			});
		});
		//<button type = "button" class = "review_ok
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
												<strong><a class="" href="mypage_review.do" style = "color : black;">나의 리뷰</a></strong>
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

				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title title-page review-title" style = "margin : 8px 0;">
						<h2>나의 리뷰</h2>
					</div>
					<div class="contents">
						<div style = "width: 1076px; box-sizing: border-box;">
							<div class="snb-area" style = "margin-bottom: 20px;">
								<ul class="snb">
									<li class="ticket_tab show_ticket">
										<a role="button" style="cursor: pointer;" href = "#">작성 가능한 리뷰</a>
									</li>
									<li class="ticket_tab">
										<a role="button" style="cursor: pointer;" href = "#">작성한 리뷰</a>
									</li>
								</ul>
							</div>

							<div class = "review">
								<div class = "review_content">
									<div class = "review_title">
										<div>
											<span>예매일시<span style = "margin-left:10px;">2022.08.31</span></span>
											<span>예매번호<strong style = "margin-left:10px;"> 220828007838</strong></span>
										</div>
										<a href = "#" class = "detail">상세보기</a>
									</div>
									<div class = "review_content_list">
										<div class = "review_content_list_img">
											<img src = "http://localhost:9000/dmu/resources/images/ticket.svg" 
												style="background:gray;height:170px;">
										</div>
										<div class = "review_content_list_information">
											<h2>어쨌든, 사랑</h2>
											<div class = "review_content_list_comment">
												<span>관람일</span><span>2022.09.31</span>
												<span>매수</span><span>1매</span>
											</div>
										</div>
										<div class = "review_write">
											<button type = "button" class = "review_write_btn">
												<div>+</div>
												<span class = "comment">리뷰작성</span>
											</button>
										</div>
									</div>
								</div>
								<div class = "review_content">
									<div class = "review_title">
										<div>
											<span>예매일시<span style = "margin-left:10px;">2022.08.31</span></span>
											<span>예매번호<strong style = "margin-left:10px;"> 220828007838</strong></span>
										</div>
										<a href = "#" class = "detail">상세보기</a>
									</div>
									<div class = "review_content_list">
										<div class = "review_content_list_img">
											<img src = "http://localhost:9000/dmu/resources/images/ticket.svg" 
												style="background:gray;height:170px;">
										</div>
										<div class = "review_content_list_information">
											<h2>어쨌든, 사랑</h2>
											<div class = "review_content_list_comment">
												<span>관람일</span><span>2022.09.31</span>
												<span>매수</span><span>1매</span>
											</div>
										</div>
										<div class = "review_write">
											<button type = "button" class = "review_write_btn">
												<div>+</div>
												<span class = "comment">리뷰작성</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="no-result_purchase">
								<div class="no-result">
									<p>예매 내역이 없습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

	<div class = "background">
		<div class = "window">
			<div class = "popup">
				<div class = "popup_title">
					<p id = "popup">리뷰작성</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div class = "popup_write">
					<div class = "popup_write_form">
						<p>상품명</p>
						<div class = "write_ticket_information">
							<img src = "http://localhost:9000/dmu/resources/images/ticket.svg" style = "background:gray;">
							<div>
								<h2>어쨌든, 사랑</h2>
								<div>
									<div class = "review_content_list_comment">
										<span>관람일</span><span>2022.09.31</span>
									</div>
								</div>
							</div>
						</div>
						<div class = "write_reivew_form">
							<p>리뷰작성</p>
							<form name = "reviewWriteForm" action = "#" method = "post">
								<ul style = "list-style:none;">
									<li>
										<label>리뷰내용</label>
										<textarea placeholder="리뷰 내용을 입력해주세요"></textarea>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
				<div class = "popup_button_list">
					<button type = "button" class = "popup_close">취소</button>
					<button type = "button" class = "review_ok">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>