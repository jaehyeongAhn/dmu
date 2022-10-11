<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.museum.dao.DmuTicketDAO"%>
<%@ page import="com.museum.vo.DmuTicketVO"%>
<%@ page import="com.museum.vo.DmuMemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script src="http://localhost:9000/mycgv/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script>
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/index.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/complete.css">
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/util.js"></script>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
 <script src="http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/mycgv/resources/js/am-pagination.js"></script>

</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
	
	 <div class="content">
		 
		<form name=""  action=""  method="post">  
		
		
	<div id="app">
		<div id="contents">
			<main>
				<div data-v-ec5a0c2c="" class="root-container">
					<div data-v-ec5a0c2c="" class="content-wrapper">
						<div data-v-ec5a0c2c="" class="body-wrapper">
							<div data-v-7f52b83a="" data-v-ec5a0c2c="">
								<div data-v-7f52b83a="" class="sub-contents-area">
									<div data-v-7f52b83a="" class="container">
										<div data-v-7f52b83a="" class="title-complete">
											<h2 data-v-7f52b83a="">예매완료</h2>
											<p data-v-7f52b83a="">${  vo.mname },님 예매가 성공적으로 완료되었습니다.</p>
										</div>
										<div data-v-7f52b83a="" class="complete-base-info">
											<div data-v-7f52b83a="" class="thumb">
												<img data-v-2fed1a9a="" data-v-7f52b83a=""
													src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"
													alt=${ vo.dtitle } style="">
											</div>
											<div data-v-7f52b83a="" class="info-area">
												<strong data-v-7f52b83a="" class="title">${ vo.dtitle }</strong>
												<div data-v-7f52b83a="" class="ticket-number-area">
													<span data-v-7f52b83a="" class="info-tit">예매번호</span><a
														data-v-7f52b83a="" href="javascript:void(0)"
														class="info-txt">${ vo.rid } </a>
												</div>
												<ul data-v-7f52b83a="" class="info">
													<li data-v-7f52b83a=""><span data-v-7f52b83a=""
														class="info-tit">관람일시</span><span data-v-7f52b83a=""
														class="info-txt">${vo.rdateda}</span></li>
													<li data-v-7f52b83a=""><span data-v-7f52b83a=""
														class="info-tit">장소</span><span data-v-7f52b83a=""
														class="info-txt">${vo.dplace}</span></li>
													<li data-v-7f52b83a=""><span data-v-7f52b83a=""
														class="info-tit">관람인원</span><span data-v-7f52b83a=""
														class="info-txt">${vo.rtotal}</span></li>
												</ul>
											</div>
										</div>
										<div data-v-7f52b83a="" class="complete-price-ara">
											<ul data-v-7f52b83a="">
												<li data-v-7f52b83a="" class="total-price"><strong
													data-v-7f52b83a="" class="title">총 금액</strong>
												<p data-v-7f52b83a="" class="amount">
														<strong data-v-7f52b83a="">${vo.rallpricech}</strong>
													</p></li>
												<li data-v-7f52b83a="" class="discount-amount minus"><strong
													data-v-7f52b83a="" class="title">인원</strong>
												<p data-v-7f52b83a="" class="amount">
														<strong data-v-7f52b83a="">${vo.rtotal}</strong>
													</p></li>
												<li data-v-7f52b83a="" class="final-payment"><strong
													data-v-7f52b83a="" class="title">최종 결제금액</strong>
												<p data-v-7f52b83a="" class="amount">
														<strong data-v-7f52b83a="">${vo.rallpricech}</strong>
													</p></li>
											</ul>
										</div>
										<div data-v-7daecfee="" data-v-7f52b83a="" class="pr-info"
											style="display: none;">
											<p data-v-7daecfee=""></p>
										</div>
										<div data-v-08a066f5="" data-v-7f52b83a="" class="note-list">
											<ul data-v-08a066f5="">
												<li data-v-08a066f5=""><strong data-v-08a066f5=""
													class="note-title">관람 시 유의사항</strong>
												<ul data-v-08a066f5="" class="dot-list">
														<li data-v-08a066f5=""><p data-v-08a066f5="">예매
																내역은 MY PAGE에서 확인 가능합니다.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">디뮤지엄
																APP을 통해 관람 당일 사용 가능한 QR티켓이 생성됩니다. 꼭 APP을 설치해 주세요.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">예매하신
																날짜만 전시 관람이 가능합니다. 예매 일시를 꼭 기억해 주세요.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">적합한
																연령의 티켓을 소지하지 않았을 경우, 입장에 제한이 있습니다. 티켓은 환불 처리되지 않으니 예매한
																티켓의 권종을 다시 한번 확인해 주세요.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">코로나19
																확산 예방과 안전한 관람을 위하여 마스크 착용 후 관람이 가능합니다.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">14세
																미만의 어린이는 반드시 보호자와 함께 방문하셔야 합니다.</p></li>
													</ul></li>
												<li data-v-08a066f5=""><strong data-v-08a066f5=""
													class="note-title">취소 및 환불 안내</strong>
												<ul data-v-08a066f5="" class="dot-list">
														<li data-v-08a066f5=""><p data-v-08a066f5="">예매
																티켓의 취소와 환불은 관람 전일 17시까지 가능합니다.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">전시
																관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">
																예매 취소와 환불 절차는 <a href="/mypage/tickets/list">[MY
																	PAGE &gt; MY TICKETS &gt; 티켓예매 목록]</a>을 통해 확인 하실 수 있습니다.
															</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">환불은
																결제와 동일한 수단으로 진행됩니다.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">신용카드로
																결제 하신 경우, 취소 처리 접수 후 7일 이내에 확인이 가능합니다.</p></li>
														<li data-v-08a066f5=""><p data-v-08a066f5="">예매
																취소 시점과 카드사의 환불 처리 기준에 따라 환급 일은 다소 차이가 있을 수 있습니다.</p></li>
														<!---->
													</ul></li>
											</ul>
											<!---->
											<!---->
										</div>
										<div data-v-7f52b83a="" class="btn-area-wrap">
											<div data-v-26e42198="" data-v-7f52b83a="" class="btn-area">
												<button data-v-26e42198="" id="btn23" type="button"
													class="primary">예매내역 확인</button>
											</div>
											 
											<div data-v-26e42198="" data-v-7f52b83a="" class="btn-area">
											<a href="http://localhost:9000/dmu/index.do" target="_parent" >
												<button data-v-26e42198="" id="btn25" type="button"
													class="secondary">홈으로</button></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
			</main>
			<button class="goto-top">상단으로 이동</button>
		</div>
	</div>
			</form>


</body>

</html>