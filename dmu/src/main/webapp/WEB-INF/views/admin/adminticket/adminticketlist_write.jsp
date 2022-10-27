<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<title>ADMIN | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<!-- <meta name="twitter:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg">
    <meta property="og:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg"> -->
<link rel="icon" href="/favicon.ico">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/ticketwrite.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function() {
		$(".ticket_dcode").click(function() {
			var dcode = $(this).attr("id");
			$(".ticket_dcode").removeClass("on");
			$("#ticketwrite_exhibition").removeClass("on");
			$("#ticketwrite_learn").removeClass("on");
			$("#ticketwrite_event").removeClass("on");
			$(this).addClass("on");
			if (dcode == "exhibition") {
				$("#ticketwrite_exhibition").addClass("on");
				$(".dcode123").val("exhibition");
			}
			if (dcode == "learn") {
				$("#ticketwrite_learn").addClass("on");
				$(".dcode123").val("learn");
			}
			if (dcode == "event") {
				$("#ticketwrite_event").addClass("on");
				$(".dcode123").val("event");
			}
		});
		
		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
	});
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<div data-v-ec5a0c2c="" class="root-container">
		<div data-v-ec5a0c2c="" class="content-wrapper">
			<div data-v-ec5a0c2c="" class="body-wrapper">
				<div data-v-25f87e60="" data-v-ec5a0c2c="">
					<div data-v-25f87e60="" class="sub-contents-area">

						<style>
							div.step-process-area {
								margin : 56px 0 40px 0;
							}
							div.step-process-area ul[data-v-6d324aa0]{
								display: flex;
							    justify-content: center;
							    align-items: center;
							}
							div.step-process-area ul[data-v-6d324aa0] li{
							    width: 25.5rem;
							    height: 52px;
							    display: flex;
							    justify-content: center;
							    align-items: center;
							    font-weight: 500;
							    font-size: 0.9375rem;
							    line-height: 1.2;
							}
							div.step-process-area ul[data-v-6d324aa0] li:nth-child(2) {
							    border-color: #111;
							    border-right: 1px solid #fff;
							    color: #fff;
							    background: #111;
							    width: 29.125rem;
							}
							div.step-process-area ul[data-v-6d324aa0] li{
							    border-color: #111;
							    color: #fff;
							    background: #111;
							}
							div.step-process-area ul li[data-v-6d324aa0]:first-child {
							    border-color: #111;
							    border-right: 1px solid #fff;
							    color: #fff;
							    background: #111;
							}
						</style>
						<div data-v-6d324aa0="" data-v-7b1f57c8=""
							class="step-process-area">
							<ul data-v-6d324aa0="">
								<li data-v-6d324aa0="" class="on"><span data-v-6d324aa0=""
									class="no">01</span><span data-v-6d324aa0="" class="txt"> 
										&nbsp;ticket</span></li>
								<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
									class="no">02</span><span data-v-6d324aa0="" class="txt"> 
										&nbsp;ticket content</span></li>
								<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
									class="no">03</span><span data-v-6d324aa0="" class="txt"> 
										&nbsp;수정/삭제</span></li>
							</ul>
						</div>
						<!---------------------------------------------->
						<!--------------- Content ----------------------->
						<!---------------------------------------------->
						<div data-v-7b1f57c8="" class="snb-area">
							<ul data-v-7b1f57c8="" class="snb">
								<li data-v-7b1f57c8="" class="ticket_dcode on" id="exhibition">
									<a data-v-7b1f57c8="">EXHIBITION </a>
								</li>

								<li data-v-7b1f57c8="" class="ticket_dcode" id="learn"><a
									data-v-7b1f57c8="">LEARN </a></li>
								<li data-v-7b1f57c8="" class="ticket_dcode" id="event"><a
									data-v-7b1f57c8="">EVENT </a></li>

							</ul>
						</div>
						<!---------------------------------------------->
						<!--------------- exhibition ----------------------->
						<!---------------------------------------------->
						<form name="exhibitionlistform"
							action="adminticketlist_write_check.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="dcode" class="dcode123" value="">
							<input type="hidden" name="dpersonnel" id="dpersonnel" value="0">
							<input type="hidden" name="dtarget" id="dtarget" value="0">
							<input type="hidden" name="dnum" id="dnum" value="0">
							<input type="hidden" name="dtitle2" id="dtitle2" value="0">
							<div data-v-8ed31374="" class="ticketwrite_exhibition on"
								id="ticketwrite_exhibition">
								<div class="content">
									<div data-v-25f87e60="" class="container write">
										<div data-v-8ed31374="" data-v-25f87e60=""
											class="reservation-area">
											<div data-v-8ed31374="" class="left">
												<ul>
													<li><label style="margin-right: 20px;">파일첨부</label> <input
														type="file" name="file1" id="file_list"></li>
												</ul>
											</div>



												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">제목</h2>
													<input type="text" name="dtitle" id="dtitle">
												</div>

												<div dtata-v-8ed31374="" class="info-ticket">
												<ul class="ticketwriteul" data-v-8ed31374="">

													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">장소</strong> <select data-v-8ed31374=""
														name="dplace" id="dplace">
															<option value="default">선택하세요</option>
															<option value="디뮤지엄">디뮤지엄</option>
															<option value="대림미술관">대림미술관</option>
															<option value="구슬모아당구장">구슬모아당구장</option>
													</select></li>
													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">회차</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dentertime"
															id="dentertime"></span></li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">전시기간</strong> <span
														data-v-8ed31374="" class="text"><input type="date"
															name="dstart" id="dstart"> ~ <input type="date"
															name="dend" id="dend"></span></li>


													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">이용요금</strong>
														<span data-v-8ed31374=""
														class="text">
															<input type="number" name="dprice" id="dprice"
																maxlength="10" oninput="maxLengthCheck(this)"
																onkeydown="javascript: return event.keyCode == 69 ? false : true">
														</span></li>
												</ul>
												</div>
												<div data-v-8ed31374="" class="organ-ticket">
													<strong data-v-8ed31374="" class="title" id="info">운영 시간</strong>
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<textarea name="dtime" id="dtime"></textarea>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>
												<strong data-v-8ed31374="" class="title" id="info">이용 정보</strong>
												<div data-v-8ed31374="" class="organ-ticket">
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<textarea name="dinformation"></textarea>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>

												<div data-v-8ed31374="" class="use-info-ticket">
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<button data-v-26e42198="" name="btn25"
															id="btn_exhibition_Write" type="button"
															class="secondary small">작성완료</button>
														<a href="adminexhibition_list.do"><button
																data-v-26e42198="" type="button" class="secondary small">리스트</button></a>
													</div>
												</div>


										</div>
										<!---->
									</div>
								</div>
							</div>
						</form>

						<!---------------------------------------------->
						<!--------------- learn ----------------------->
						<!---------------------------------------------->
						<form name="learnlistform" action="adminticketlist_write_check.do"
							method="post" enctype="multipart/form-data">
							<div data-v-8ed31374="" class="ticketwrite_learn" id="ticketwrite_learn">
							<input type="hidden" name="dcode" class="dcode123" value="">
								<div class="content">
									<div data-v-25f87e60="" class="container write">
										<div data-v-8ed31374="" data-v-25f87e60=""
											class="reservation-area">
											<div data-v-8ed31374="" class="left">
												<ul>
													<li id="fileinput"><label style="margin-right: 20px;">파일첨부</label> <input
														type="file" name="file1" id="file_list1"></li>
												</ul>
											</div>

											<div data-v-8ed31374="" class="img-ticket write">


												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">제목</h2>
													<input type="text" name="dtitle" id="dtitle1">
												</div>
												
												<div dtata-v-8ed31374="" class="info-ticket">
												<ul class="ticketwriteul" data-v-8ed31374="">

													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">부제목</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dtitle2"
															id="dtitle21" maxlength="100"></span></li>
													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">장소</strong> <select data-v-8ed31374=""
														name="dplace" id="dplace1">
															<option value="default">선택하세요</option>
															<option value="디뮤지엄">디뮤지엄</option>
															<option value="대림미술관">대림미술관</option>
															<option value="구슬모아당구장">구슬모아당구장</option>
													</select></li>
													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">수업시간</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dentertime"
															id="dentertime1"></span></li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">교육진행</strong> <span
														data-v-8ed31374="" class="text"><input type="date"
															name="dstart" id="dstart1"> ~ <input type="date"
															name="dend" id="dend1"></span></li>


													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">이용요금</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dprice"
															id="dprice1" maxlength="10" oninput="maxLengthCheck(this)"
															onkeydown="javascript: return event.keyCode == 69 ? false : true"></span></li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">정원 수</strong> <span
														data-v-8ed31374="" class="text"><input
															type="text" name="dpersonnel" id="dpersonnel1" value=""
															maxlength="10" oninput="maxLengthCheck(this)"
															onkeydown="javascript: return event.keyCode == 69 ? false : true"></span>
													</li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">대상</strong> <select
														data-v-8ed31374="" name="dtarget" id="dtarget1">
															<option value="default">선택하세요</option>
															<option value="유아">유아</option>
															<option value="어린이">어린이</option>
															<option value="청소년">청소년</option>
															<option value="대학생">대학생</option>
															<option value="성인">성인</option>
															<option value="교사">교사</option>
															<option value="전시해설">전시해설</option>
													</select></li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title must-do">교육횟수</strong> <span
														data-v-8ed31374="" class="text"><input
															type="text" name="dnum" id="dnum1" maxlength="1" oninput="maxLengthCheck(this)"
															onkeydown="javascript: return event.keyCode == 69 ? false : true"></span>
													</li>
												</ul>
												</div>
												<div data-v-8ed31374="" class="organ-ticket">
													<strong data-v-8ed31374="" class="title" id="info">교육시간</strong>
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<textarea name="dtime" id="dtime"></textarea>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>
												<strong data-v-8ed31374="" class="title" id="info">이용
													정보</strong>
												<div data-v-8ed31374="" class="organ-ticket">
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<textarea name="dinformation" id="dinformation1"></textarea>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>

												<div data-v-8ed31374="" class="use-info-ticket">
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<button data-v-26e42198="" name="btn25"
															id="btn_exhibition_Write1" type="button"
															class="secondary small">작성완료</button>
														<a href="adminexhibition_list.do"><button
																data-v-26e42198="" type="button" class="secondary small">리스트</button></a>
													</div>
												</div>
											</div>


										</div>
										<!---->
									</div>
								</div>
							</div>
						</form>
						<!---------------------------------------------->
						<!--------------- event ----------------------->
						<!---------------------------------------------->

						<form name="eventlistform" action="adminticketlist_write_check.do"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="dcode" class="dcode123" value="">
							<input type="hidden" name="dpersonnel" id="dpersonnel2" value="0">
							<input type="hidden" name="dnum" id="dnum2" value="0">
							<input type="hidden" name="dtime" id="dtime2" value="0">
							<div data-v-8ed31374="" class="ticketwrite_event" id="ticketwrite_event">
								<div class="content">
									<div data-v-25f87e60="" class="container write">
										<div data-v-8ed31374="" data-v-25f87e60=""
											class="reservation-area">
											<div data-v-8ed31374="" class="left">
												<ul>
													<li><label style="margin-right: 20px;">파일첨부</label> <input
														type="file" name="file1" id="file_list2"></li>
												</ul>
											</div>

											<div data-v-8ed31374="" class="img-ticket write">


												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">제목</h2>
													<input type="text" name="dtitle" id="dtitle2">
												</div>
												<div dtata-v-8ed31374="" class="info-ticket">
												<ul class="ticketwriteul" data-v-8ed31374="">


													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">부제목</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dtitle2"
															id="dtitle22" maxlength="100"></span></li>
													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">장소</strong> <select data-v-8ed31374=""
														name="dplace" id="dplace2">
															<option value="default">선택하세요</option>
															<option value="디뮤지엄">디뮤지엄</option>
															<option value="대림미술관">대림미술관</option>
															<option value="구슬모아당구장">구슬모아당구장</option>
													</select></li>
													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">회차</strong> <span data-v-8ed31374=""
														class="text"><input type="text" name="dentertime"
															id="dentertime2"></span></li>

													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">진행 기간</strong> <span
														data-v-8ed31374="" class="text"><input type="date"
															name="dstart" id="dstart2"> ~ <input type="date"
															name="dend" id="dend2"></span></li>


													<li data-v-8ed31374=""><strong data-v-8ed31374=""
														class="title">참가</strong> <span data-v-8ed31374=""
														class="text"><input type="number" name="dprice"
															id="dprice2"maxlength="10" oninput="maxLengthCheck(this)"
															onkeydown="javascript: return event.keyCode == 69 ? false : true"></span></li>


													<li data-v-8ed31374="" class=""><strong
														data-v-8ed31374="" class="title">대상</strong> <select
														data-v-8ed31374="" name="dtarget" id="dtarget2">
															<option value="default">선택하세요</option>
															<option value="전체연령 관람가능">전체연령 관람가능</option>
															<option value="15세이상 관람 가능">15세이상 관람 가능</option>
															<option value="19세이상 관람 가능">19세이상 관람 가능</option>
													</select></li>
												</ul>
												</div>
												<strong data-v-8ed31374="" class="title" id="info" style ="
													    padding-top: 30px;display:block;">이용
													정보</strong>
												<div data-v-8ed31374="" class="organ-ticket">
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<textarea name="dinformation" id="dinformation2"></textarea>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>

												<div data-v-8ed31374="" class="use-info-ticket">
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<button data-v-26e42198="" name="btn25"
															id="btn_exhibition_Write2" type="button"
															class="secondary small">작성완료</button>
														<a href="adminexhibition_list.do"><button
																data-v-26e42198="" type="button" class="secondary small">리스트</button></a>
													</div>
												</div>
											</div>


										</div>
									</div>
								</div>
							</div>
						</form>

						<!---->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer Include -->
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>
<div class = "background_exhibition ">
		<div class = "window_exhibition ">
			<div class = "popup_exhibition">
				<p id = "popup_title">gdgd</p>
				<div class="popup_button">
					<button type = "button" id = "popup_close" style = "cursor:pointer;">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>