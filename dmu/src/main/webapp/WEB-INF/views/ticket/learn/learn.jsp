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
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/comment.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<%--  jQuery UI CSS파일  --%>
<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> --%>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/jquery-ui.css">

<%-- jQuery 기본 js파일 --%>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>

<%-- jQuery UI 라이브러리 js파일 --%>
<%-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> --%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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
				let min_start = 0;
				let enddate = "${vo.enddate}";
				let startdate = "${vo.startdate}";
				
				if(startdate < 0) {
					min_start = 0;
				}else {
					min_start = startdate;
				}
				
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
							minDate : parseInt(min_start),
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
<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
<div style="width:100%; height:17vh; color:transparent">헤더</div>


	<div class="content">

		<form name="ticket_exhibitionFrom" action="ticket_reservation.do" method="post">
		
		 <input type="hidden" name="did" value="${vo.did }"> 
		 <input type="hidden" name="dtitle" value="${vo.dtitle }"> 
		 <input type="hidden" name="rprice" id="rprice" value=${vo.dprice }> 
		 <input type="hidden" name="rdate" id="rdate" value=""> 
		 <input type="hidden" name="rtime" id="rtime" value=""> 
		 <input type="hidden" name="rtotal" id="rtotal" value="">  
		 <input type="hidden" name="dplace" id="dplace" value=${vo.dplace }> 
		 <input type="hidden" name="rallprice" id="rallprice" value=""> 
		 <input type="hidden" name="mid" id="mid" value=${ sessionScope.member.mid }> 
		 <input type="hidden" name="dsfile" id="dsfile" value=${vo.dsfile }> 
		 <input type="hidden" name="dfile" id="dfile" value=${vo.dfile }> 
		
	 
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
										<div data-v-8ed31374="" data-v-25f87e60=""
											class="reservation-area">
											<!---->
											<div data-v-8ed31374="" class="left">
												<div data-v-8ed31374="" class="img-ticket">

													<img data-v-2fed1a9a="" data-v-8ed31374=""   src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }" alt=${ vo.dtitle } style="">


												</div>
												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">${ vo.dtitle }</h2>
													<span data-v-b10d847a="" class="explan"> ${ vo.dtitle2 }  </span>
												</div>
												<div data-v-8ed31374="" class="info-ticket"> 
													<ul data-v-8ed31374="">
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">교육진행</strong><span data-v-b10d847a="" class="text">${ vo.dstart } ~ ${ vo.dend } ${ vo.dtime }</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">장소</strong><span data-v-b10d847a="" class="text">${ vo.dplace }</span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">대상</strong><span data-v-b10d847a="" class="text">${ vo.dtarget }</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">교육시간</strong><span data-v-b10d847a="" class="text">${ vo.dentertime} </span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">교육횟수</strong><span data-v-b10d847a="" class="text">${ vo.dnum } </span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">정원 수</strong><span data-v-b10d847a="" class="text">${ vo.dpersonnel }</span></li>
														<li data-v-b10d847a=""><strong data-v-b10d847a="" class="title">참가비</strong><span data-v-b10d847a="" class="text">${vo.dprice} 원</span></li>
														<li data-v-b10d847a="" class=""><strong data-v-b10d847a="" class="title">문의</strong><span data-v-b10d847a="" class="text">교육팀 (02-6233-7220)</span></li>
													</ul>
												</div>
												<div data-v-8ed31374="" class=" "></div>
												<div data-v-8ed31374="" class="use-info-ticket">
													<strong data-v-8ed31374="" class="title">이용 정보</strong>
													<div class="content"></div>
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<p>



																<br>
															</p>
															<ul style="font-size: 15px">${ vo.dinformation }
															</ul>
															<p>
																<br>
															</p>
															<p>
																<br>
															</p>
															<p>
																<br>
															</p>
														</div>
													</div>
												</div>
											</div>
											<div data-v-8ed31374="" class="right">
												<ul data-v-8ed31374="" class="ticketing-list-area">
													<li data-v-8ed31374="" class="item-ticketing">
														<div data-v-8ed31374="" name="btn_toggle"
															id="data-v-8ed31374_btn" role="button"
															class="title-area btn-toggle on">관람일</div>
														<div data-v-8ed31374="" class="field-area"></div>
														<div data-v-8ed31374="" class="datepicker_wrap"></div>
														<div class="vdp-datepicker small"
															allowed-to-show-view="function() {}"></div>
														<div class=""></div> 
														
														<!-- 달력 코딩 -->
														<div id="calendar" class="ticketing-list-area"></div>
													   
														
														
														
													<li data-v-8ed31374="" class="item-ticketing">
														<div data-v-8ed31374="" id="btn_toggle" role="button"
															class="title-area btn-toggle on">수업시간</div>
														<div data-v-8ed31374="" class="field-area">
															<ul data-v-8ed31374="" class="round-list">
																<li data-v-8ed31374="" class="">
																	<button data-v-8ed31374="" type="button"  class="round-selection" id="entertime"  onclick="myFunction()">
																		<span data-v-8ed31374="" name="rtime" id="content" class="ContentEnter" value="${vo.dentertime }"> ${vo.dentertime }</span>
																	 	
																		 
																		<!---->
																	</button>
																</li>
															</ul>
														</div>
														<div data-v-8ed31374="" class="decision-area">~</div>
													</li>
													<li data-v-8ed31374="" class="item-ticketing">
														<div data-v-8ed31374="" role="button" class="title-area btn-toggle" id="btb_toggle_hide"> 관람인원 	
														<div data-v-8ed31374="" class="tooltip-area">

																<!---->
															</div>
														</div>
														<div data-v-8ed31374="" class="field-area" style="display: none;" id="content_hide">
															<p data-v-8ed31374="" class="error-msg">한 개의 ID로 회당
																최대 4매까지 예매 가능합니다.</p>
															<ul data-v-8ed31374="" class="personnel-list">
																<li data-v-8ed31374=""><div data-v-8ed31374=""
																		class="personal-control">
																		<span data-v-8ed31374="" class="person">인원</span>
																		<div data-v-1dc6379c="" data-v-8ed31374="" class="control count-control" name="data-v-1dc6379c">

																			<button id="countpeople" name="countpeople" data-v-1dc6379c="" type="button" class="btn-minus" id="decreaseQuantity"></button>

																			<div data-v-67ca82d2="" data-v-1dc6379c="" 	class="input-area">
																			
																				<input data-v-67ca82d2="" id="inptext" name="rtotal" type="text" value="0" onfocusout="onlyNumber();" autocomplete="on" placeholder="" readonly="readonly" maxlength="-1">
																			 
																			</div>

																			<button data-v-1dc6379c="" type="button" class="btn-plus" id="increaseQuantity"></button>












																		</div>
																	</div></li>
																<li data-v-8ed31374=""><div data-v-8ed31374="" class="personal-control">

																		<div data-v-1dc6379c="" data-v-8ed31374="" class="control count-control">

																			<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
 
																				<a data-v-67ca82d2="" href="javascript:void(0);"
																					class=""></a>
																				 
																			</div>

																		</div>
																	</div></li>
																<li data-v-8ed31374=""><div data-v-8ed31374="" class="personal-control">
																		<span data-v-8ed31374="" class="person"> </span>
																		<div data-v-1dc6379c="" data-v-8ed31374="" class="control count-control">

																			<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
 
																				<a data-v-67ca82d2="" href="javascript:void(0);"
																					class=""></a>
																			 
																			</div>

																		</div>
																	</div></li>
															</ul>
															<ul data-v-8ed31374="" class="personnel-result">
																<li data-v-8ed31374=""> 
																	 
																 


															</ul>
															<div data-v-8ed31374="" class="btn-bottom-area">
																<ul data-v-8ed31374="" class="agreement-list">
																	<li data-v-8ed31374="">
																		<div data-v-34230fe0="" data-v-8ed31374=""
																			class="check-area reservation">
																			<input data-v-34230fe0="" id="check30"
																				type="checkbox" class=""> 
																				<label data-v-34230fe0="" for="check30"> 
																				<span data-v-34230fe0="" class="check" id="check30"></span>프로그램 참여시 유의사항 동의
																			</label>
																		</div>
																		<div data-v-26e42198="" data-v-8ed31374="" class="btn-area link">
																			<a data-v-26e42198="" href="javascript:void(0);" class="icon go-page"> 전문보기 </a>
																		</div>
																	</li>
																</ul>
																<div data-v-26e42198="" data-v-8ed31374=""
																	class="btn-area btn-reservation">
																 
																		<button data-v-26e42198="" id="btn32" type="button" class="primary" disabled>예매하기</button>
																	 
																 

																</div>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<!---->
										</div>
										<!---->
										<!---->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
 <div class = "background_exhibition">
		<div class = "window_exhibition">
			<div class = "popup_exhibition">
				<p class = "popup_title">전문보기</p>
				<div class="popup_detail">
								<table class="popup_detail_table">
										<div data-v-9a980cc6="" class="layer-body">
				<div data-v-9dea2aa6="" data-v-9a980cc6="">
					<div data-v-9dea2aa6="" data-v-9a980cc6="" class="title-area">
						<strong data-v-9dea2aa6="" data-v-9a980cc6="" class="title">관람
							시 유의사항 동의</strong>
					</div>
					<div data-v-9dea2aa6="" data-v-9a980cc6="" class="contents-area">
						<div>
							<strong style="line-height: 1.7; color: #111;">1. 입장, 티켓
								환불 &amp; 취소</strong>
							<ul>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									예매하신 티켓의 변경, 취소, 환불은 전시 관람 또는 프로그램 하루 전 오후 5시까지만 가능합니다. 이후에는
									취소와 환불이 불가하오니 유의해 주세요.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리 되어 취소,환불이 불가능합니다.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									재관람은 ‘사용완료’ 처리된 티켓으로만 가능합니다. 티켓을 취소 했거나, 예매 후 미술관을 방문하지 못해 기간만료
									처리 된 티켓으로는 재관람이 어렵습니다.</li>
							</ul>
						</div>

						<div style="padding-top: 1rem">
							<strong style="line-height: 1.7; color: #111;">2. 코로나19
								예방과 확산 방지를 위한 관람객 유의 사항</strong>
							<ul>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									미술관 안에서는 안전한 관람을 위하여 관람객 모두 마스크를 착용해야 합니다. <br>올바른 마스크 착용이
									아니거나 마스크 착용을 거부할 경우 퇴장 조치 될 수 있습니다.
								</li>
							</ul>
						</div>

						<div style="padding-top: 1rem">
							<strong style="line-height: 1.7; color: #111;">3. 미술관
								방문과 전시 관람</strong>
							<ul>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식물 반입이 불가하오니 꼭 기억해 주세요.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									미술관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다. 전시장에서는 어린이들이 보호자의 손을 잡고 전시를
									관람할 수 있게 해 주세요.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수 있으니, 관람에
									유의해 주세요.</li>
								<li
									style="line-height: 1.7; text-indent: -0.7rem; padding-left: 1rem;">•
									디뮤지엄에서는 디뮤지엄 교육팀을 제외한 타 기관의 교육, 전시 해설은 불가합니다. 디뮤지엄의 승인 없이 교육을
									진행할 경우 직원이 즉각 교육 중단을 요청할 수 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
									</table>
				
					</div>
				<div class = "popup_button">
					<button type = "button" class = "popup_close">확인</button>						 
				</div>
			</div>
		</div>
	</div>
  
			</main>
		</form>

		<button class="goto-top">상단으로 이동</button>
	</div>
	</div>
	<!-- built files will be auto injected -->
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	<footer>
		<!-- 0510 네이버 공통 js 추가 -->
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js">
			
		</script>
	</footer>

	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script>

</body>
</html>