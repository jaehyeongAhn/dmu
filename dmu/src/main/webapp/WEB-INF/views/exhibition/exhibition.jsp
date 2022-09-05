<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.museum.dao.TicketDAO" %>    
<%@ page import="com.museum.vo.ExhibitionVO" %>  
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
		href="http://localhost:9000/dmu/resources/css/ticket.css">

<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link href="/js/0.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/1.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/10.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/100.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/101.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/102.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/103.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/104.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/105.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/106.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/107.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/108.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/109.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/11.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/110.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/111.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/112.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/113.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/12.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/13.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/14.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/15.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/16.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/17.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/18.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/19.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/2.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/20.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/21.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/22.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/23.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/24.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/25.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/26.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/27.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/28.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/29.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/3.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/30.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/31.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/32.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/33.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/34.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/35.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/36.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/37.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/38.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/39.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/4.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/40.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/41.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/42.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/43.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/44.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/45.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/46.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/47.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/48.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/49.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/5.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/50.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/51.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/52.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/53.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/54.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/55.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/56.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/57.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/58.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/59.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/6.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/60.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/61.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/62.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/63.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/64.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/65.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/66.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/67.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/68.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/69.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/7.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/70.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/71.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/72.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/73.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/74.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/75.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/76.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/77.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/78.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/79.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/8.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/80.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/81.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/82.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/83.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/84.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/85.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/86.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/87.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/88.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/89.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/9.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/90.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/91.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/92.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/93.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/94.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/95.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/96.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/97.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/98.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/99.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-calender.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-event.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-exhibition.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-faq.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-guide.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-learn.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-login-find.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-login-join.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-login.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-museum.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-mypage.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-notice.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-reservation.85a954b2b4f1348cc700.js"
	rel="prefetch">
<link href="/js/group-search.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-shop.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-shop~group-ticket.85a954b2b4f1348cc700.js"
	rel="prefetch">
<link href="/js/group-ticket.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/group-visit.85a954b2b4f1348cc700.js" rel="prefetch">
<link href="/js/chunk-vendors.85a954b2b4f1348cc700.js" rel="preload"
	as="script">
<link href="/js/index.85a954b2b4f1348cc700.js" rel="preload" as="script">

<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/util.js"></script>
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
														src="https://cdn.daelimmuseum.org/Program/Exhibition/List/E/Small/202206/20220607103533991001.png"
														alt="어쨌든, 사랑" style="">
												</div>
												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">${ vo.dexhibtion }</h2>
													<span data-v-8ed31374="" class="explan"> </span>
												</div>
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374=""><strong data-v-8ed31374="" class="title">장소</strong><span data-v-8ed31374="" class="text">${ vo.dplace }</span></li>
														<li data-v-8ed31374="" class=""><strong data-v-8ed31374="" class="title">전시기간</strong><span data-v-8ed31374="" class="text">${ vo.dstart } ~ ${ vo.dend }</span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374="" class="title">운영시간</strong><span data-v-8ed31374="" class="text">${ vo.dtime } 
															 
															</span></li>
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
														<div data-v-8ed31374="" id="data-v-8ed31374_btn" role="button" class="title-area btn-toggle on">관람일</div>
														<div data-v-8ed31374="" class="field-area">
															<div data-v-8ed31374="" class="datepicker_wrap">
																<div class="vdp-datepicker small"
																	allowed-to-show-view="function() {}">
																	<div class="">
																		<!---->
																		<input type="hidden" readonly="readonly"
																			autocomplete="off" value="31 08 2022">
																		<!---->
																	</div>
																	<div class="dcalender vdp-datepicker__calendar"
																		style="position: static;">
																		<header>
																			<span class="prev disabled">&lt;</span> <span
																				class="day__month_btn">2022 . 08</span> <span
																				class="next">&gt;</span>
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
																				class="cell day disabled"><div
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
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>3</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
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
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>6</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
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
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>10</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
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
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>13</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
																					class="cell_wrap">
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
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>17</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
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
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>20</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
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
																				</div></span><span class="cell day disabled"><div
																					class="cell_wrap">
																					<div>
																						<p>24</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled"><div
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
																				</div></span><span class="cell day disabled weekend sat"><div
																					class="cell_wrap">
																					<div>
																						<p>27</p>
																						<div class="mark"></div>
																					</div>
																				</div></span><span class="cell day disabled weekend sun"><div
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
																				</div></span><span class="cell day selected today"><div
																					class="cell_wrap">
																					<div>
																						<p>31</p>
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
														<div data-v-8ed31374="" class="decision-area">
															2022.08.31</div></li>
													<li data-v-8ed31374="" class="item-ticketing"><div
															data-v-8ed31374="" role="button"
															class="title-area btn-toggle on">회차</div>
														<div data-v-8ed31374="" class="field-area">
															<ul data-v-8ed31374="" class="round-list">
																<li data-v-8ed31374="" class=""><button
																		data-v-8ed31374="" type="button" disabled="disabled"
																		class="round-selection">
																		<span data-v-8ed31374="">전일 입장 가능 11:00 ~ 20:00</span>
																		<!---->
																	</button></li>
															</ul>
														</div>
														<div data-v-8ed31374="" class="decision-area">~</div></li>
													<li data-v-8ed31374="" class="item-ticketing"><div
															data-v-8ed31374="" role="button"
															class="title-area btn-toggle">
															관람인원 및 권종
															<div data-v-8ed31374="" class="tooltip-area">
																<span data-v-8ed31374="" role="button"
																	class="icon-question"></span>
																<!---->
															</div>
														</div>
														<div data-v-8ed31374="" class="field-area"
															style="display: none;">
															<!---->
															<ul data-v-8ed31374="" class="personnel-list"></ul>
															<ul data-v-8ed31374="" class="personnel-result"></ul>
															<div data-v-8ed31374="" class="btn-bottom-area">
																<ul data-v-8ed31374="" class="agreement-list">
																	<li data-v-8ed31374=""><div data-v-34230fe0=""
																			data-v-8ed31374="" class="check-area reservation">
																			<input data-v-34230fe0="" id="check30"
																				type="checkbox" class=""><label
																				data-v-34230fe0="" for="check30"><span
																				data-v-34230fe0="" class="check"></span>관람시 유의사항 동의</label>
																		</div>
																		<div data-v-26e42198="" data-v-8ed31374=""
																			class="btn-area link">
																			<a data-v-26e42198="" href="javascript:void(0);"
																				class="icon go-page"> 전문보기 </a>
																		</div></li>
																</ul>
																<div data-v-26e42198="" data-v-8ed31374=""
																	class="btn-area btn-reservation">
																	<button data-v-26e42198="" id="btn32" type="button"
																		disabled="disabled" class="primary">예매하기</button>
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