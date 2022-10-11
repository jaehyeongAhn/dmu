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
<!-- 이미지 경로 수정하기 -->

</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>
	<!-- 사이드 메뉴 -->
	<div class = "main">
		<div class = "section">
			<div class = "container">
				<aside class="mypage">
					<div class="mypage-list">
						<a href="#" class="mypage-main">
							<strong class="menu-title">MY PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on">
									<a class="menu-title" href="mypage_main.do">MY TICKETS</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="mypage_ticket.do">티켓예매 목록</a>
											</li>
											<li class="">
												<a class="" href="mypage_review.do">나의 문의</a>
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
					<div class="gray-box">
						<div class = "greeting-area">
							<p><strong>${ sessionScope.member.mname }</strong>님 안녕하세요.</p>						
						</div>
					</div>
					<div class="records-group">
						<div class="purchase-list">
							<div class="purchase-title">
								<div>
									<a href="mypage_ticket.do" class=""><strong style = "font-size : 20px;">최근 예매 내역</strong></a>
									<p>회원님께서 최근 전시 또는 프로그램 티켓을 예매하신 내역입니다.</p>
								</div>
							</div>
							<div class="purchase-result">
								<div class = "purchase-result-box">
									<div class="no-result_purchase">
										<div class="no-result">
											<p>예매 내역이 없습니다.</p>
										</div>
									</div>
									<%-- <p>최근 예매 내역이 없습니다.<br>빠른 시일 내에 다시 만나요.</p> --%>	
									<!-- <div class = "purchase-result-title">
										<p><span>예매번호 :</span> 220828007829</p>
										<strong>예매완료</strong>
									</div>			
									<div class = "purchase-result-content">
										<a href = "#"><img src = "http://localhost:9000/dmu/resources/images/ticket.svg"></a>
										<div class = "purchase-result-content-text">
											<a href = "#"><strong>어쨌든, 사랑</strong></a>
											<div>
												<span class = "date">2022.08.28 12:47</span>
												<span>1매</span>
											</div>
										</div>
									</div>	 -->		
								</div>
							</div>
							
							<div class="purchase-result">
								<div class = "purchase-result-box">
									<%-- <p>최근 예매 내역이 없습니다.<br>빠른 시일 내에 다시 만나요.</p> --%>	
									<div class = "purchase-result-title">
										<p><span>예매번호 :</span> 220828007829</p>
										<strong>예매완료</strong>
									</div>			
									<div class = "purchase-result-content">
										<a href = "#"><img src = "http://localhost:9000/dmu/resources/images/ticket.svg"></a>
										<div class = "purchase-result-content-text">
											<a href = "#"><strong>어쨌든, 사랑</strong></a>
											<div>
												<span class = "date">2022.08.28 12:47</span>
												<span>1매</span>
											</div>
										</div>
									</div>			
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="500px" scrolling="no" frameborder=0 class = "footer" ></iframe>
</body>
</html>