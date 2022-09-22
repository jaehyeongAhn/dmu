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
		$(".ticket_cancle").click(function(){
			if($(".ticket_list:checked").length == 0){
				$(".background_join").addClass("show_join");
				$(".window_join").addClass("show_join");
				$("#popup_joinOk").click(function(){
					$(".background_join").removeClass("show_join");
					$(".window_join").removeClass("show_join");
				});
			}
		});
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
												<strong><a class="" href="mypage_ticket.do" style = "color : black;">티켓예매 목록</a></strong>
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
					div.purchase-result-list-content table {
						width: 100%;
					    text-align: left;
					    margin: 20px 0 20px 20px;
					    letter-spacing : -0.08rem;
					}
					div.purchase-result-list-content table td.content_table_title {
						font-size: 23px;
					    font-weight: 700;
					    padding-bottom: 15px;
					}
					div.purchase-result-list-content table td {
						width : 270px;
						font-weight : 500;
					}
					div.purchase-result-list-content table th {
						font-weight: 400;
    					color: #898989;
					}
					
				</style>
				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title" style = "margin: 10px 0 0 0;">
						<h2>예매 상세 내역</h2>
					</div>
					<div class = "ticket_content">
						<div class = "ticket_detail">
							<div class="result_purchase" style = "margin : 0; border-top : none;">
								<div class="purchase_result_list">
									<div class="purchase-result-list-title">
										<p>예매번호 <strong> 220828007838</strong></p>
									</div>
									<div class="purchase-result-list-content" style = "width : 100%;">
										<div style="border-bottom: 0.5px solid #ddd;">
											<div class="purchase-result-content-title" style = "width : 100%;">
												<a href="#">
													<img src="http://localhost:9000/dmu/resources/images/ticket.svg"
														style = "width : 250px;">
												</a>
												<table>
													<tr>
														<td colspan = "4" class = "content_table_title">어쨌든, 사랑</td>
													</tr>
													<tr>
														<th>예매 일시</th>
														<td>2022-02-05</td>
														<th>예약 매수</th>
														<td>1매(성인 1)</td>
													</tr>
													<tr>
														<th>장소</th>
														<td>디뮤지엄</td>
														<th>상태</th>
														<td>예매 완료</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<style>
						div.payment div.payment-result-list-title h2::after{
						    content: "";
						    width: 100%;
						    height: 1.3px;
						    background: black;
						    display: block;
						    margin-top: 8px;
						}
						div.payment-result-list-content table {
							width: 100%;
    						text-align: left;
    						border-collapse : collapse;
						}
						div.payment-result-list-content table tr:first-child {
							display: flex;
    						justify-content: space-between;
						}
						div.payment-result-list-content table tr:first-child > td {
							flex-grow : 1;
							display: flex;
						    justify-content: space-between;
						    padding: 20px;
						    align-items : center;
						}
						div.payment-result-list-content table tr:first-child > td:nth-child(2) {
						    border-right : 0.5px solid #ddd;
						    border-left : 0.5px solid #ddd;
						}
						div.payment-result-list-content table tr.card_result > td {
						    padding: 20px;
						    text-align: right;
						    border-bottom: 0.5px solid #ddd;
						    border-top: 0.5px solid #ddd;
						    line-height: 30px;
						    font-weight: 500;
						}
					</style>
					<%-- 결제 정보 --%>
					<div class = "payment" style="margin:65px 0;">
						<div class = "payment_information">
							<div class="payment_content">
								<div class="payment_result_list">
									<div class="payment-result-list-title">
										<h2>결제정보</h2>
									</div>
									<div class="payment-result-list-content">
										<div>
											<table>
												<tr>
													<td>티켓금액<strong>18,000원</strong></td>
													<td>티켓<strong>1매</strong></td>
													<td>최종 결제금액<strong style="font-size:20px;">18,000원</strong></td>
												</tr>
												<tr class="card_result">
													<td colspan = "6">카드(국민/일시불)<br>결제일:2022.09.20</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<style>
						div.ticket-result-list-title {
							display: flex;
						    justify-content: space-between;
						    align-items: center;
						}
						div.ticket-result-list-content {
							width: 100%;
						    border-top: 2px solid black;
						    margin-top: 8px;
						}
						div.ticket-result-list-content table{
						    width : 100%;
						    border-collapse: collapse;
						}
						div.ticket-result-list-content table tr {
							border-bottom: 0.5px solid #ddd;
						}
						div.ticket-result-list-content table tr > *{
						    padding: 16px;
						    text-align: center;
						    border : none;
						    color: #383333;
						}
						div.ticket-result-list-content table input#check {
							display : none;
						}
						div.ticket-result-list-content table input#check + label {
						    width : 0px;
						    display: block;
						    margin: 0;
						    padding: 0;
						    position: relative;
						    left: 50%;
						    transform: translate(-50%, 0);
						}
						div.ticket-result-list-content table input#check + label::before {
						    content: "";
						    width: 20px;
						    height: 20px;
						    display: block;
						    border: 0.5px solid #d2d2d2;
						    position : relative;
						    left: 50%;
    						transform: translate(-50%, 0);
						    cursor : pointer;
						}
						div.ticket-result-list-content table input#check:checked + label {
						    width : 0px;
						}
						div.ticket-result-list-content table input#check:checked + label::before {
						    content: "";
						    width: 20px;
						    height: 20px;
						    display: block;
						    border: 0.5px solid black;
						    background-image : url("http://localhost:9000/dmu/resources/images/check.png");
						    background-repeat : no-repeat;
						    background-size : contain;
						    cursor : pointer;
						}
						div.ticket-result-list-title button {
							width : 110px;
							height : 40px;
							border : 0.5px solid black;
							background : white;
							letter-spacing : -0.08rem;
							cursor : pointer;
						}
						div.ticket-result-list-title button:hover {
							background : black;
							color : white;
						}
					</style>
					<%-- 티켓 정보 --%>
					<div class = "ticket">
						<div class = "ticket_information">
							<div class="ticket_content">
								<div class="ticket_result_list">
									<div class="ticket-result-list-title">
										<h2>티켓목록</h2>
										<div>
											<button type = "button" class="ticket_cancle">예매취소</button>
										</div>
									</div>
									<div class="ticket-result-list-content">
										<div>
											<table>
												<tr style = "background:#efefef;">
													<th>선택</th>
													<th>티켓번호</th>
													<th>권종</th>
													<th>관람일</th>
													<th>상태</th>
												</tr>
												<tr>
													<td><input type="checkbox" id="check" class="ticket_list">
														<label for="check"></label>
													</td>
													<td>22082800783812132132</td>
													<td>성인</td>
													<td>2022.10.31</td>
													<td><strong>사용가능</strong></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					
					<style>
						div.flag_content ul {
							list-style : "-";
							list-style-position :inside;
							margin-top : 30px;
						}
						div.flag_content ul li {
							line-height: 30px;
						    color: #4c4c4c;
						    letter-spacing: -0.08rem;
						}
					</style>
					<%-- 유의 사항 --%>
					<div class = "flag" style = "margin:75px 0 20px 0;">
						<div class = "flag_content">
							<div clas = "flag_content_title">
								<h2>유의사항</h2>
							</div>
							<div>
								<ul>
									<li>예매하신 티켓의 변경, 취소, 환불은 관람 전 일 오후 5시까지만 가능합니다. 이후에는 취소와 환불이 불가하오니 유의해 주세요.</li>
									<li>전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</li>
									<li>관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리되어 취소,  환불이 불가능합니다.</li>
									<li>경로 및 장애인 우대할인 티켓을 구매하신 경우, 미술관 방문 당일 현장에서 확인 가능한 신분증 또는 증명서를 반드시 지참해 주시기 바랍니다.</li>
									<li>연령, 할인 기준에 맞지 않는 티켓을 예매하신 경우 현장에서의 차액 지불은 불가하며, 미술관 입장이 어려울 수 있습니다.</li>
									<li>예매취소 시점과 결제 시 사용하신 신용카드사의 따라 취소 방법과 환급일은 다소 차이가 있을 수 있습니다.</li>
									<li>신용카드 할부결제로 구매하신 티켓 수량의 일부를 취소하실 경우, 신용카드사의 사정에 따라 혜택(무이자 할부 등)의 적용 여부가 달라질 수 있습니다.</li>
								</ul>
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
				<p id = "popup_joinGuide">티켓을 선택해 주세요.</p>
				<div class = "popup_button">
					<button type = "button" id = "popup_joinOk">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>