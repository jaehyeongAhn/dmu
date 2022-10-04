<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 태그 추가  -->

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<!-- <meta name="twitter:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg">
    <meta property="og:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg"> -->
<link rel="icon" href="/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/ticket.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/comment.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<%--  jQuery UI CSS파일  --%>
<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> --%>
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/jquery-ui.css">

<%-- jQuery 기본 js파일 --%>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>

<%-- jQuery UI 라이브러리 js파일 --%>
<%-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> --%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
	function onlyNumber() {
		var str = 0;
		var Mynum = document.getElementById("inptext").value;
		Mynum = Mynum.replace(/[^0-9]/g, '');
		document.getElementById("inptext").value = Mynum;
		var plus = document.getElementById("inptext").value = Mynum;
		if (plus < str) {
			document.getElementById("inptext").value = 0;
		} else if (plus > 4) {
			document.getElementById("inptext").value = 4;
		}
	}
	$(document).ready(function() {
		var inp = $("#inptext").val();
		$(".btn-plus").on("click", function() {
			setTimeout(function() {
				if (inp == 4) {
					inp;
				} else {
					inp++;
				}
				$("#inptext").val(inp);
				$("#rtotal").val(inp);
			}, 500);
		});
		$(".btn-minus").on("click", function() {
			setTimeout(function() {
				if (inp == 0) {
					inp;
				} else if (inp <= 4) {
					inp--;
				}
				$("#inptext").val(inp);
				$("#rtotal").val(inp);
			}, 4);
		});
	});
</script>

  

<script src="http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>

<script>
	$(document).ready(
			function() {
				let enddate = "${vo.enddate}";
				// Getter
				var dayNamesShort = $("#calendar").datepicker("option",
						"dayNamesShort");

				$("#calendar").datepicker(
						{
							//datepicker 초기 설정
							dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu",
									"Fri", "Sat" ],
							dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu",
									"Fri", "Sat" ],
							monthNames : [ "01", "02", "03", "04", "05", "06",
									"07", "08", "09", "10", "11", "12" ],
							minDate : 0,
							maxDate : parseInt(enddate),
							showMonthAfterYear : true,
							//datepicker의 DOM이 업데이트 될 때 호출 (오늘 날짜 자동으로 받아 저장)
							onUpdateDatepicker : function() {
								var date = $.datepicker.formatDate("yy-mm-dd",
										$("#calendar").datepicker("getDate"));
								$("#date").val(date);
							},
							//datepicker의 날짜가 변경될 때마다 이벤트 발생 (선택 날짜 받아 저장)
							onSelect : function() {
								var date = $.datepicker.formatDate("yy-mm-dd",
										$("#calendar").datepicker("getDate"));
								$("#date").val(date);
								$("#rdate").val(date);
								$(".round-selection").attr("disabled", false)

								//alert(date);
							}
						});

				// Setter
				$("#calendar").datepicker("option", "dayNamesShort",
						[ "Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam" ]);

			});
</script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>


</head>
<body>
	 <iframe src="http://localhost:9000/dmu/header.do" width="100%"
		height="160px" scrolling="no" frameborder=0></iframe>
	 
 
		<div id="contents">
			 
			<main>
				<div data-v-ec5a0c2c="" class="root-container">
					<div data-v-ec5a0c2c="" class="content-wrapper">
						<div data-v-ec5a0c2c="" class="body-wrapper">
							<div data-v-25f87e60="" data-v-ec5a0c2c="">
								<div data-v-25f87e60="" class="sub-contents-area">
									<div data-v-6d324aa0="" data-v-25f87e60=""
										class="step-process-area">
										<ul data-v-6d324aa0="">
											<li data-v-6d324aa0="" class="complete"><span
												data-v-6d324aa0="" class="no">01</span><span
												data-v-6d324aa0="" class="txt">. 티켓 선택</span></li>
											<li data-v-6d324aa0="" class="on"><span
												data-v-6d324aa0="" class="no">02</span><span
												data-v-6d324aa0="" class="txt">. 관람일/인원 선택</span></li>
											<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
												class="no">03</span><span data-v-6d324aa0="" class="txt">.
													결제</span></li>
										</ul>
									</div>
									<div data-v-25f87e60="" class="container">
										<!---->
										<div data-v-b10d847a="" data-v-25f87e60=""
											class="reservation-area">
											<!---->
											<div data-v-b10d847a="" class="left">
												<div data-v-b10d847a="" class="img-ticket">
													<img data-v-2fed1a9a="" data-v-b10d847a=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/E/202205/20220510114246801001.jpg"
														alt="Culture English Club" style="">
												</div>
												<ul data-v-b10d847a="" class="flag-list">
													<li data-v-b10d847a="">1회성 교육</li>
													<li data-v-b10d847a="">디뮤지엄</li>
													<!---->
													<!---->
												</ul>
												<div data-v-b10d847a="" class="title-ticket">
													<h2 data-v-b10d847a="" class="title">Culture English
														Club</h2>
													<span data-v-b10d847a="" class="explan"> Culture
														Lover들의 문화·예술로 익히는 영어습관 </span>
												</div>
												<div data-v-b10d847a="" class="info-ticket">
													<ul data-v-b10d847a="">
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">교육진행</strong><span data-v-b10d847a="" class="text">2022.06.08 ~ 2022.09.14 19:00 ~ 19:50</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">장소</strong><span data-v-b10d847a="" class="text">디뮤지엄 교육센터 3교육실</span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">대상</strong><span data-v-b10d847a="" class="text">문화예술, 언어공부에 관심있는 성인</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">교육시간</strong><span data-v-b10d847a="" class="text">50분</span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">교육횟수</strong><span data-v-b10d847a="" class="text">총 1차시 교육진행</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">정원 수</strong><span data-v-b10d847a="" class="text">20 명</span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">참가비</strong><span data-v-b10d847a="" class="text">15,000 원</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">문의</strong><span data-v-b10d847a="" class="text">교육팀 (02-6233-7219)</span></li>
													</ul>
												</div>
												<div data-v-b10d847a="" class="use-info-ticket">
													<strong data-v-b10d847a="" class="title">이용 정보</strong>
													<div data-v-b10d847a="" class="contents">
														<div class="editor-contents-area">
															<div class="exhibition-html">
																<!----- 티켓 상세 정보 ----->
																<div style="margin: 2rem 0 4rem 0">
																	<ul style="font-size: 15px">
																		<li class="txt" style="text-indent: -0.6rem; padding: 0.25rem 0 0.25rem 1.2rem; line-height: 1.5"> · &lt;Culture English Club&gt;는 성인을 대상으로 진행되며 개인 참여 프로그램입니다.</li>
																		<li class="txt" style="text-indent: -0.6rem; padding: 0.25rem 0 0.25rem 1.2rem; line-height: 1.5"> · 티켓 구매와 변경, 취소 및 환불은 신청 하신 교육 당일 전 날 17시까지 가능하며, 그 이후에는 변경, 취소, 환불은 불가 합니다.</li>
																		<li class="txt" style="text-indent: -0.6rem; padding: 0.25rem 0 0.25rem 1.2rem; line-height: 1.5"> · 본 티켓은 전시가 포함되어 있지 않으며, 예매하신 프로그램 날짜와 시간에만 참여 가능합니다. </li>
																		<li class="txt" style="text-indent: -0.6rem; padding: 0.25rem 0 0.25rem 1.2rem; line-height: 1.5"> · 담당 에듀케이터가 수업을 진행 하고 있을 경우 통화가 어려울 수 있습니다. 이 때, '문의하기'에 질문을 남겨 주시면 최대한 빨리 답변 드리겠습니다.</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div data-v-b10d847a="" class="right">
												<ul data-v-b10d847a="" class="ticketing-list-area">
													<li data-v-b10d847a="" class="item-ticketing"><div
															data-v-b10d847a="" class="title-area btn-toggle on">
															날짜</div>
														<div data-v-b10d847a="" class="field-area">
															<div data-v-b10d847a="" class="datepicker_wrap">
																<div class="vdp-datepicker small"
																	allowed-to-show-view="function() {}">
																	<div class="">
																		<!---->
																		<input type="hidden" readonly="readonly"
																			autocomplete="off" value="07 09 2022">
																		<!---->
																	</div>
																	<div class="dcalender vdp-datepicker__calendar"
																		style="position: static;">
																		<header>
																			<span class="prev disabled">&lt;</span> <span
																				class="day__month_btn">2022 . 09</span> <span
																				class="next disabled">&gt;</span>
																		</header>
																		<div class="">
																			<span class="cell day-header">Sun</span><span
																				class="cell day-header">Mon</span><span
																				class="cell day-header">Tue</span><span
																				class="cell day-header">Wed</span><span
																				class="cell day-header">Thu</span><span
																				class="cell day-header">Fri</span><span
																				class="cell day-header">Sat</span> <span
																				class="cell day blank"></span><span
																				class="cell day blank"></span><span
																				class="cell day blank"></span><span
																				class="cell day blank"></span><span
																				class="cell day disabled today"><div
																					class="cell_wrap">
																					<div>
																						<p>1</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>2</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>3</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
																					class="cell_wrap">
																					<div>
																						<p>4</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>5</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>6</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day selected"><div
																					class="cell_wrap">
																					<div>
																						<p>7</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>8</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>9</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>10</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
																					class="cell_wrap">
																					<div>
																						<p>11</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>12</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>13</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day"><div class="cell_wrap">
																					<div>
																						<p>14</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>15</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>16</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>17</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
																					class="cell_wrap">
																					<div>
																						<p>18</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>19</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>20</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>21</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>22</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>23</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>24</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
																					class="cell_wrap">
																					<div>
																						<p>25</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>26</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>27</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>28</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>29</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>30</p>
																						<div class="mark"></div>
																					</div>
																				</div></span>
																		</div>
																	</div>
																	<!---->
																	<!---->
																</div>
															</div>
														</div>
														<div data-v-b10d847a="" class="decision-area">
															2022.09.07</div></li>
													<li data-v-b10d847a="" class="item-ticketing"><div
															data-v-b10d847a="" class="title-area btn-toggle on">
															수업시간</div>
														<div data-v-b10d847a="" class="field-area">
															<ul data-v-b10d847a="" class="round-list">
																<li data-v-b10d847a="" class="on"><button
																		data-v-b10d847a="" type="button"
																		class="round-selection">
																		<span data-v-b10d847a="">Eng. Club 19:00</span>
																		<!---->
																	</button></li>
															</ul>
														</div>
														<div data-v-b10d847a="" class="decision-area">Eng.
															Club 19:00</div></li>
													<li data-v-b10d847a="" class="item-ticketing"><div
															data-v-b10d847a="" class="title-area btn-toggle on">
															인원</div>
														<div data-v-b10d847a="" class="field-area">
															<p data-v-b10d847a="" class="error-msg">한 개의 ID로 회당
																최대 4매까지 예매 가능합니다.</p>
															<ul data-v-b10d847a="" class="personnel-list">
																<li data-v-b10d847a=""><div data-v-b10d847a=""
																		class="personal-control">
																		<span data-v-b10d847a="" class="person"> 인원</span>
																		<div data-v-1dc6379c="" data-v-b10d847a=""
																			class="control count-control">
																			<button data-v-1dc6379c="" type="button"
																				disabled="disabled" class="btn-minus"></button>
																			<div data-v-67ca82d2="" data-v-1dc6379c=""
																				class="input-area">
																				<input data-v-67ca82d2="" id="field138"
																					autocomplete="on" placeholder=""
																					readonly="readonly" maxlength="-1" type="text"
																					class="">
																				<!---->
																				<!---->
																				<!---->
																				<!---->
																				<!---->
																				<a data-v-67ca82d2="" href="javascript:void(0);"
																					class=""></a>
																				<!---->
																			</div>
																			<button data-v-1dc6379c="" type="button"
																				class="btn-plus"></button>
																		</div>
																	</div></li>
															</ul>
															<!---->
															<div data-v-b10d847a="" class="btn-bottom-area">
																<ul data-v-b10d847a="" class="agreement-list">
																	<li data-v-b10d847a=""><div data-v-34230fe0=""
																			data-v-b10d847a="" class="check-area reservation">
																			<input data-v-34230fe0="" id="check139"
																				type="checkbox" class=""><label
																				data-v-34230fe0="" for="check139"><span
																				data-v-34230fe0="" class="check"></span>프로그램 참여시
																				유의사항 동의</label>
																		</div>
																		<div data-v-26e42198="" data-v-b10d847a=""
																			class="btn-area link">
																			<a data-v-26e42198="" href="javascript:void(0);"
																				class="icon go-page"> 전문보기 </a>
																		</div></li>
																	<!---->
																</ul>
																<div data-v-26e42198="" data-v-b10d847a=""
																	class="btn-area btn-reservation">
																	<button data-v-26e42198="" id="btn141" type="button"
																		disabled="disabled" class="primary">예매하기</button>
																</div>
															</div>
														</div></li>
												</ul>
											</div>
											<!---->
										</div>
										<!---->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			
			<button class="goto-top">상단으로 이동</button>
		</div>
	</div>
	<!-- built files will be auto injected -->
	<footer>
		<!-- 0510 네이버 공통 js 추가 -->
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	</footer>

	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script>
	<iframe src="footer.do" width="100%" height="550px" scrolling="no" frameborder=0></iframe>

</body>
</html>