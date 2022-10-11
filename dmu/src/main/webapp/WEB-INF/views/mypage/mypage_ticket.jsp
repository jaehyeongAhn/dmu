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
<!-- 이미지 경로 수정하기 -->
<script>
	$(document).ready(function(){
		// Getter
		let weekend = $("#datepicker1").datepicker('setDate', '-7D');
		let today = $("#datepicker2").datepicker('setDate', 'today');
		
		 $( "#datepicker1" ).datepicker({
			//datepicker 초기 설정
			dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
			dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
			monthNames : [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			showMonthAfterYear : true,
		    showOn: "button",
		    buttonImage: "http://localhost:9000/dmu/resources/images/calendar.svg",
		    buttonImageOnly: true,
		    buttonText: "Select date",
			maxDate : 0,
			dateFormat : "yy-mm-dd"
		 });
		 $( "#datepicker2" ).datepicker({
			//datepicker 초기 설정
			dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
			dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
			monthNames : [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			showMonthAfterYear : true,
		    showOn: "button",
		    buttonImage: "http://localhost:9000/dmu/resources/images/calendar.svg",
		    buttonImageOnly: true,
		    buttonText: "Select date",
			minDate : 0,
			dateFormat : "yy-mm-dd"
		 });
		 $("#datepicker1").change(function(){
			if($("#datepicker1").val() != today){
				$("ul.d_day li").removeClass("show");
			}
		 });

		 $("#datepicker2").change(function(){
			if($("#datepicker1").val() != weekend){
				$("ul.d_day li").removeClass("show");
			}
		 });
		 
		// Setter
		$("#datepicker1").datepicker('setDate', "-1w");
		$("#datepicker2").datepicker('setDate', 'today');
		//$( "#calendar" ).datepicker( "option", "dayNamesShort", [ "Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam" ] );
		
		// 버튼 클릭 시 날짜 변경 함수
		function date_setup(month){
			$("#datepicker1").datepicker('setDate', month);
			$("#datepicker2").datepicker('setDate', 'today');
		}
		
		// 버튼 클릭 시 show 이벤트
		function show_setup(obj){
			$("ul.d_day li").removeClass("show");
			$(obj).parent("li").addClass("show");
		}
		
		$(".show .btn_date_week").click(function(){
			date_setup("-2w");
			show_setup(this);
		});
		$(".btn_date_one").click(function(){
			date_setup("-1m");
			show_setup(this);
		});
		$(".btn_date_three").click(function(){
			date_setup("-3m");
			show_setup(this);
		});
		$(".btn_date_six").click(function(){
			date_setup("-6m");
			show_setup(this);
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
					<div class="page-title title-page" style = "margin : 10px 0;">
						<h2>티켓예매 목록</h2>
					</div>
					<div class="contents">
						<div style = "width: 1076px; box-sizing: border-box;">
							<div class="snb-area">
								<ul class="snb">
									<li class="ticket_tab show_ticket">
										<a role="button" style="cursor: pointer;" href = "#">전체</a>
									</li>
									<li class="ticket_tab">
										<a role="button" style="cursor: pointer;" href = "#">EXHIBITION</a>
									</li>
									<li class="ticket_tab">
										<a role="button" style="cursor: pointer;" href = "#">LEARN</a>
									</li>
									<li class="ticket_tab">
										<a role="button" style="cursor: pointer;" href = "#">EVENT</a>
									</li>
								</ul>
							</div>
							<div class="sub-contents-area">
								<div class="container">
									<div class="notice-area">
										<div class="search-area">
											<div class="period" style="width: 100%;">
												<ul class = "d_day">
													<li class="show">
														<button type="button" class = "btn_date_week">1주일</button>
													</li>
													<li class="">
														<button type="button" class = "btn_date_one">1개월</button>
													</li>
													<li class="">
														<button type="button" class = "btn_date_three">3개월</button>
													</li>
													<li class="">
														<button type="button" class = "btn_date_six">6개월</button>
													</li>
												</ul>
												<!---->
												<div class="date-group">
													<div class="input-area date-area">
														<input type="text" id="datepicker1" readonly>
														<a class=""></a>
														<!---->
													</div>
													<span> ~ </span>
													<div class="input-area date-area">
														<input type="text" id="datepicker2"readonly>
														<a class=""></a>
														<!---->
													</div>
												</div>
												<div class="search-date">
													<button id="search_date" type="button" class="search_date">검색</button>
												</div>
											</div>
										</div>
										<div class="no-result_purchase" style="margin: 0 15px 0 0;">
											<div class="no-result">
												<p>예매 내역이 없습니다.</p>
											</div>
										</div>
										<div class="result_purchase">
											<div class="purchase_result_list">
												<div class="purchase-result-list-title">
													<p>예매일시 <strong> 2022.08.28 22:50</strong></p>
													<p>예매번호 220828007838</p>
												</div>
												<div class="purchase-result-list-content">
													<div>
														<div class="purchase-result-content-title">
															<a href="mypage_ticket_content.do">
																<img src="http://localhost:9000/dmu2/resources/images/ticket.svg">
															</a>
															<div class="purchase-result-list-content-text">
																<a href="#"><strong style = "font-weight : 800;">어쨌든, 사랑</strong></a>
																<div>
																	<span class="date">Exhibition</span> <span>1매</span>
																</div>
															</div>
														</div>
														<div class="purchase-result-list-content-status">
															<strong>예매완료</strong>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="result_purchase">
											<div class="purchase_result_list">
												<div class="purchase-result-list-title">
													<p>예매일시 <strong> 2022.08.28 22:50</strong></p>
													<p>예매번호 220828007838</p>
												</div>
												<div class="purchase-result-list-content">
													<div>
														<div class="purchase-result-content-title">
															<a href="mypage_ticket_content.do">
																<img src="http://localhost:9000/dmu2/resources/images/ticket.svg">
															</a>
															<div class="purchase-result-list-content-text">
																<a href="#"><strong style = "font-weight : 800;">어쨌든, 사랑</strong></a>
																<div>
																	<span class="date">Exhibition</span> <span>1매</span>
																</div>
															</div>
														</div>
														<div class="purchase-result-list-content-status">
															<strong>예매완료</strong>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="sub-contents-area"><!---->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height=490px" scrolling="no" frameborder=0 class = "footer" ></iframe>
	
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