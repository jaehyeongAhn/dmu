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
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket_reservation.css">
 


<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
 <script src="http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/mycgv/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
 
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body>
<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
<div style="width:100%; height:17vh; color:transparent">헤더</div>
	
  <div class="content">
 	 
		<form name="ticket_reservationFrom"  action="ticketCompleteCheck.do"  method="post">  
		
		
		 <input type="text" name="did" value="${vo.did }"> 
		 <input type="text" name="dprice" id="dprice" value=${vo.rprice }> 
		 <input type="text" name="rdate" id="rdate" value="${vo.rdate }"> 
		 <input type="text" name="rtotal" id="rtotal" value="${vo.rtotal }">  
		 <input type="text" name="dplace" id="dplace" value=${vo.dplace }> 
		 <input type="text" name="rallprice" id="rallprice" value="${vo.rallpricech }"> 
		 <input type="text" name="mid" id="mid" value=${ vo.mid }>  
		 <input type="text" name="pdate" id="pdate" value="s"> 
		 <input type="text" name="pcoin" id="pcoin" value="카드">  
			 
			<main>
				<div data-v-ec5a0c2c="" class="root-container">
					<div data-v-ec5a0c2c="" class="content-wrapper">
						<div data-v-ec5a0c2c="" class="body-wrapper">
							<div data-v-a42e08ec="" data-v-ec5a0c2c="">
								<div data-v-a42e08ec="" class="sub-contents-area">
									<div data-v-6d324aa0="" data-v-a42e08ec=""
										class="step-process-area">
										<ul data-v-6d324aa0="">
											<li data-v-6d324aa0="" class="complete"><span
												data-v-6d324aa0="" class="no">01</span><span
												data-v-6d324aa0="" class="txt">. 티켓 선택</span></li>
											<li data-v-6d324aa0="" class="complete"><span
												data-v-6d324aa0="" class="no">02</span><span
												data-v-6d324aa0="" class="txt">. 관람일/인원 선택</span></li>
											<li data-v-6d324aa0="" class="on"><span
												data-v-6d324aa0="" class="no">03</span><span
												data-v-6d324aa0="" class="txt">. 결제</span></li>
										</ul>
									</div>
									<div data-v-a42e08ec="" class="container">
										<div data-v-a42e08ec="" class="reservation-area">
											<div data-v-a42e08ec="" class="left">
												<div data-v-a42e08ec="" class="payment-info-area">
													<div data-v-a42e08ec="" class="payment-headline"> 티켓 정보 </div>
													<ul data-v-a42e08ec="" class="ticket-info">
														<li data-v-a42e08ec=""><span data-v-a42e08ec=""
															class="tit">전시명</span><span data-v-a42e08ec=""
															class="txt"><strong data-v-a42e08ec="">${ vo.dtitle }</strong></span></li>
														<li data-v-a42e08ec=""><span data-v-a42e08ec=""
															class="tit">관람일시</span><span data-v-a42e08ec=""
															class="txt">${vo.rdateda}</span></li>
														<li data-v-a42e08ec=""><span data-v-a42e08ec=""
															class="tit">장소</span><span data-v-a42e08ec="" class="txt">${ vo.dplace }</span></li>
													</ul>
													<ul data-v-a42e08ec="" class="ticket-personnel">
														<li data-v-a42e08ec=""><span data-v-a42e08ec=""
															class="title"></span><span data-v-a42e08ec=""
															class="price"> </span>
															<span data-v-a42e08ec=""
															class="personnel">인원 </span>
															<span data-v-a42e08ec="" class="total">  ${ vo.rtotal }인</span></li>
															
									 
															
													</ul>
												</div>
												<div data-v-a42e08ec="" class="payment-info-area">
													 
													<div data-v-a42e08ec="" class="discount-offer">
														 
													</div>
													<div data-v-a42e08ec="" class="discount-offer">
													 
														<ul data-v-a42e08ec="" class="list-offer">
															<li data-v-a42e08ec=""> 
															 
															<ul data-v-a42e08ec="" class="personnel-list">
																	<li data-v-a42e08ec=""><div data-v-a42e08ec=""
																			class="personal-control">
																			<div data-v-0f105554="" data-v-a42e08ec=""
																				class="select-area">
																				<div data-v-0f105554="" id="select290" class="">
																				 
																					<ul data-v-0f105554="" class="select-list"
																						style="display: none;">
																						
 																					</ul>
																				</div>
																			</div>
																			<div  data-v-a42e08ec=""
																				class=" ">
																				 
																				<div data-v-67ca82d2="" data-v-1dc6379c=""
																					class="input-area">
																					 
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<a data-v-67ca82d2="" href="javascript:void(0);"
																						class=""></a>
																					<!---->
																				</div>
																				 
																			</div>
																		</div></li>
																 </li>
															 </ul>
															<ul data-v-a42e08ec="" class="personnel-list">
																	<li data-v-a42e08ec=""><div data-v-a42e08ec=""
																			class="personal-control">
																		 
																			<div data-v-1dc6379c="" data-v-a42e08ec=""
																				class="control count-control">
																				 
																				<div data-v-67ca82d2="" data-v-1dc6379c=""
																					class="input-area">
																					 
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<a data-v-67ca82d2="" href="javascript:void(0);"
																						class=""></a>
																					<!---->
																				</div>
																				 
																			</div>
																		</div></li>
																</ul> </li>
															<li data-v-a42e08ec=""> 
															<ul data-v-a42e08ec="" class="personnel-list">
																	<li data-v-a42e08ec=""><div data-v-a42e08ec=""
																			class="personal-control">
																			 
																			<div data-v-1dc6379c="" data-v-a42e08ec=""
																				class="control count-control">
																				 
																				<div data-v-67ca82d2="" data-v-1dc6379c=""
																					class="input-area">
																					 
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<!---->
																					<a data-v-67ca82d2="" href="javascript:void(0);"
																						class=""></a>
																					<!---->
																				</div>
																				 
																			</div>
																		</div></li>
																</ul> </li>
														</ul>
														 </div>
												</div>
												<div data-v-a42e08ec="" class="payment-info-area">
													<div data-v-a42e08ec="" class="ticket-registration">
														<div data-v-26e42198="" data-v-a42e08ec=""
															class="btn-area">
															 
														</div>
														 </div>
													<!---->
												</div>
											</div>
											<div data-v-a42e08ec="" class="right">
												<ul data-v-a42e08ec="" class="ticketing-list-area">
													<li data-v-a42e08ec="" class="item-ticketing border-none"><div
															data-v-a42e08ec="" class="title-area"> 결제 정보 </div>
														<div data-v-a42e08ec="" class="field-payment-area">
															<ul data-v-a42e08ec="" class="payment-list">
																<li data-v-a42e08ec=""><strong data-v-a42e08ec="" class="title">총금액 / ${ vo.rtotal }매</strong> 
																<span data-v-a42e08ec="" class="price">${vo.rallpricech} </span></li>
																<!---->
																<li data-v-a42e08ec=""><strong data-v-a42e08ec=""
																	class="title"></strong><span data-v-a42e08ec=""
																	class="price"></span></li>
															</ul>
															<div data-v-a42e08ec="" class="payment-result">
																<strong data-v-a42e08ec="" class="title">최종 결제금액</strong><span
																	data-v-a42e08ec="" class="price">${vo.rallpricech}</span>
															</div>
														</div></li>
												</ul>
												<div data-v-a42e08ec="" class="btn-bottom-area">
													<ul data-v-a42e08ec="" class="agreement-list">
														<li data-v-a42e08ec=""><div data-v-34230fe0=""
																data-v-a42e08ec="" class="check-area">
																<input data-v-34230fe0="" id="check287" type="checkbox"
																	class=""><label data-v-34230fe0="" for="check287"><span data-v-34230fe0="" class="check" id="check287"></span>예약 티켓 정보에 대한 동의</label>
															</div>
															<p data-v-a42e08ec="" class="p-msg-local">예약하신 티켓의 가격, 할인 내역, 취소 정책을 최종확인 하였으며, 구매에 동의합니다.<br>(전자거래법 제8조 제2항)</p></li>
													</ul>
													<div data-v-26e42198="" data-v-a42e08ec=""
														class="btn-area btn-reservation">
														
														
														  <a  href="http://localhost:9000/dmu/complete.do?mid=${ vo.getMid()}" target="_parent"> 
														<button data-v-26e42198="" id="btn289" type="button" class="primary" disabled> 결제하기 </button> </a>
														 
															<!-- disabled="disabled" -->
													</div>
												</div>
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!---->
								<div data-v-a42e08ec="">
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
					</div>
				</div>
			</main>
			</form>
			<button class="goto-top"> 상단으로 이동 </button>
		</div>
	</div>
	
    <!-- built files will be auto injected -->
    <footer>
       <!-- 0510 네이버 공통 js 추가 -->
      <script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
    </footer>
    
   <script type="text/javascript"
		src="/js/chunk-vendors.65f4f95d8b53aa7e7c6f.js"></script>
	<script type="text/javascript" src="/js/index.65f4f95d8b53aa7e7c6f.js"></script>
 										 
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

</body>

</html>