<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.museum.dao.DmuTicketDAO" %>    
<%@ page import="com.museum.vo.DmuTicketVO" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- JSTL 태그 추가  --> 

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
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/comment.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<%--  jQuery UI CSS파일  --%>
  	<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> --%>
  	<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/jquery-ui.css">
	
	<%-- jQuery 기본 js파일 --%>
 	 <script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
	
	<%-- jQuery UI 라이브러리 js파일 --%>
  	<%-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> --%>
  	<script src="http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			let enddate = "${vo.enddate}";
			// Getter
			var dayNamesShort = $( "#calendar" ).datepicker( "option", "dayNamesShort" );
			
			$("#calendar").datepicker({
				//datepicker 초기 설정
				dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
				dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
				monthNames : [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				minDate : 0,
				maxDate : parseInt(enddate),
				showMonthAfterYear : true,
				//datepicker의 DOM이 업데이트 될 때 호출 (오늘 날짜 자동으로 받아 저장)
				onUpdateDatepicker : function(){
					var date = $.datepicker.formatDate("yy-mm-dd", $("#calendar").datepicker("getDate"));
					$("#date").val(date);
				},
				//datepicker의 날짜가 변경될 때마다 이벤트 발생 (선택 날짜 받아 저장)
				onSelect : function(){
					var date = $.datepicker.formatDate("yy-mm-dd", $("#calendar").datepicker("getDate"));
					$("#date").val(date);
					//alert(date);
				}
			});
			 
			// Setter
			$( "#calendar" ).datepicker( "option", "dayNamesShort", [ "Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam" ] );
			
		});
	</script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body>
	<iframe src="http://localhost:9000/dmu/header.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
		 
		
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
													<img data-v-2fed1a9a="" data-v-8ed31374=""
														src="http://localhost:9000/dmu/resources/upload/${vo.dsfile}"
														alt="어쨌든, 사랑" style="">
														 
												</div>
												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">${ vo.dtitle }</h2>
													<span data-v-8ed31374="" class="explan"> </span>
												</div>
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">장소</strong>
															<span data-v-8ed31374="" class="text">${ vo.dplace }</span>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">전시기간</strong>
															<span data-v-8ed31374="" class="text">${ vo.dstart } ~ ${ vo.dend }</span>
														</li>
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">운영시간</strong>
															<span data-v-8ed31374="" class="text">${ vo.dtime }</span>
														</li>
														<li data-v-8ed31374="" class=""><strong data-v-8ed31374="" class="title">이용요금</strong>
															<p data-v-8ed31374="" class="price">${ vo.dprice } </p>
														</li>
													</ul>
												</div>
												<div data-v-8ed31374="" class="organ-ticket">
													<p data-v-8ed31374="" class="comment">
														※ 10명 이상의 단체라면, 단체 예매로 신청하세요.<br> &nbsp;&nbsp;&nbsp;&nbsp;단체를 위한 할인 혜택을 드립니다.
													</p>
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<button data-v-26e42198="" name ="btn25" id="btn25" type="button" class="secondary small">단체예매 신청</button>
													</div>
												</div>
												<div data-v-8ed31374="" class="use-info-ticket">
													<strong data-v-8ed31374="" class="title">이용 정보</strong>
													<div class="content">
		 
		<table class="board">
			<tr>
				<td colspan="4">
					<a href="board_write.do">
					<button type="button" class="btn_style">글쓰기</button>
					</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>후기</th>
				<th>등록날짜</th>
				 
			</tr>
			<c:forEach var="vo" items="${ list }"> 
			 <tr>
				<td>${ vo.getRno() }</td>
				<td><a href="board_content.do?bid=${ vo.getBid()}">${ vo.getBtitle() }</a></td>
				<td>${ vo.getBdate() }</td>
				<td>${ vo.getBhits() }</td>
			</tr>
			</c:forEach> 
			
			<tr>
				<%-- 페이지 네비게이션 시작 --%>						
				<td colspan=4><div id="ampaginationsm"></div></td>
				<%-- 페이지 네비게이션 종료  --%>
			</tr>
		</table>	
	</div>
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<p>
																 
 

																<br>
															</p>
															<ul style="font-size: 15px">
																${ vo.dinformation }
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
														<div data-v-8ed31374="" name="btn_toggle" id="data-v-8ed31374_btn" role="button" class="title-area btn-toggle on">관람일</div>
														  <div data-v-8ed31374="" class="field-area"></div>
														  	<div data-v-8ed31374="" class="datepicker_wrap"></div>
																  <div class="vdp-datepicker small"
																	allowed-to-show-view="function() {}"></div> 
																	<div class=""></div> 
														 		<!---->
															<!-- 			<input type="hidden" readonly="readonly"
																			autocomplete="off" value="31 08 2022">
																		
																	</div>
																	<div class="dcalender vdp-datepicker__calendar" style="position: static;">
																		<header>
																			<span class="prev disabled">&lt;</span> <span
																				class="day__month_btn">2022 . 08</span> <span
																				class="next">&gt;</span>
																		</header>
													 
														-->
														<!-- 달력 코딩 -->
														<div id = "calendar" class="ticketing-list-area"></div>
														<input type = "hidden" name = "date" id = "date">
														
														
														<!-- 
														<div data-v-8ed31374="" class="decision-area">
															2022.08.31</div></li> -->
													<li data-v-8ed31374="" class="item-ticketing">
													<div data-v-8ed31374="" id="btn_toggle" role="button" class="title-area btn-toggle on">회차</div>
														<div data-v-8ed31374="" class="field-area">
															<ul data-v-8ed31374="" class="round-list">
																<li data-v-8ed31374="" class=""><button
																		data-v-8ed31374="" type="button" disabled="disabled"
																		class="round-selection">
																		<span data-v-8ed31374="" name="content" id="content">전일 입장 가능 11:00 ~ 20:00</span>
																		<!---->
																	</button></li>
															</ul>
														</div>
														<div data-v-8ed31374="" class="decision-area">~</div></li>
													<li data-v-8ed31374="" class="item-ticketing">
													<div data-v-8ed31374="" role="button" class="title-area btn-toggle" id="btb_toggle_hide">관람인원 및 권종<div data-v-8ed31374="" class="tooltip-area">
																<span data-v-8ed31374="" role="button" class="icon-question"></span>
															<!---->
														</div>
													</div>
													<div data-v-8ed31374="" class="field-area" style="" id="content_hide">
														<p data-v-8ed31374="" class="error-msg">한 개의 ID로 회당 최대 4매까지 예매
															가능합니다.</p>
														<ul data-v-8ed31374="" class="personnel-list">
															<li data-v-8ed31374=""><div data-v-8ed31374=""
																	class="personal-control">
																	<span data-v-8ed31374="" class="person">인원</span>
																	<div data-v-1dc6379c="" data-v-8ed31374=""
																		class="control count-control">
																		<button data-v-1dc6379c="" type="button" disabled="disabled"
																			class="btn-minus"></button>
																		<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
																			<input data-v-67ca82d2="" id="field40" autocomplete="on"
																				placeholder="" readonly="readonly" maxlength="-1" type="text"
																				class="">
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
																			<!---->
																		</div>
																		<button data-v-1dc6379c="" type="button" class="btn-plus"></button>
																	</div>
																</div></li>
															<li data-v-8ed31374=""><div data-v-8ed31374=""
																	class="personal-control">
																	 
																	<div data-v-1dc6379c="" data-v-8ed31374=""
																		class="control count-control">
																		<button data-v-1dc6379c="" type="button" disabled="disabled"
																			class="btn-minus"></button>
																		<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
																			<input data-v-67ca82d2="" id="field42" autocomplete="on"
																				placeholder="" readonly="readonly" maxlength="-1" type="text"
																				class="">
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
																			<!---->
																		</div>
																		<button data-v-1dc6379c="" type="button" class="btn-plus"></button>
																	</div>
																</div></li>
															<li data-v-8ed31374=""><div data-v-8ed31374=""
																	class="personal-control">
																	<span data-v-8ed31374="" class="person">유아 및 어린이</span>
																	<div data-v-1dc6379c="" data-v-8ed31374=""
																		class="control count-control">
																		<button data-v-1dc6379c="" type="button" disabled="disabled"
																			class="btn-minus"></button>
																		<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
																			<input data-v-67ca82d2="" id="field44" autocomplete="on"
																				placeholder="" readonly="readonly" maxlength="-1" type="text"
																				class="">
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
																			<!---->
																		</div>
																		<button data-v-1dc6379c="" type="button" class="btn-plus"></button>
																	</div>
																</div></li>
														</ul>
														<ul data-v-8ed31374="" class="personnel-result">
															<li data-v-8ed31374=""><strong data-v-8ed31374="" class="title">성인</strong><span
																data-v-8ed31374="" class="count">0</span></li>
															<li data-v-8ed31374=""><strong data-v-8ed31374="" class="title">청소년</strong><span
																data-v-8ed31374="" class="count">0</span></li>
															<li data-v-8ed31374=""><strong data-v-8ed31374="" class="title">유아
																	및 어린이</strong><span data-v-8ed31374="" class="count">0</span></li>
														</ul>
														<div data-v-8ed31374="" class="btn-bottom-area">
															<ul data-v-8ed31374="" class="agreement-list">
																<li data-v-8ed31374=""><div data-v-34230fe0=""
																		data-v-8ed31374="" class="check-area reservation">
																		<input data-v-34230fe0="" id="check30" type="checkbox" class=""><label
																			data-v-34230fe0="" for="check30"><span
																			data-v-34230fe0="" class="check"></span>관람시 유의사항 동의</label>
																	</div>
																	<div data-v-26e42198="" data-v-8ed31374="" class="btn-area link">
																		<a data-v-26e42198="" href="javascript:void(0);"
																			class="icon go-page"> 전문보기 </a>
																	</div></li>
															</ul>
															<div data-v-26e42198="" data-v-8ed31374=""
																class="btn-area btn-reservation"  >
														 <a href="http://localhost:9000/dmu/ticket_reservation.do?did=${ vo.getDid()}" target="_parent" >
														 <button data-v-26e42198="" id="btn32" type="button" class="primary" >
														  예매하기 </button></a>
																		 							</div>
																										</div>
																									</div></li>
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