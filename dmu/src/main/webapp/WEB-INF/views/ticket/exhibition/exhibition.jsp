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
  	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script >
	 


	function onlyNumber() 
	{ 
		var str = 0;
		var Mynum = document.getElementById("inptext").value;
		Mynum =Mynum.replace(/[^0-9]/g,'');
		document.getElementById("inptext").value=Mynum;
		var plus = document.getElementById("inptext").value=Mynum;
		if (plus < str)
		{
			document.getElementById("inptext").value=0;
		}else if (plus > 4)
		{
			document.getElementById("inptext").value=4;
		}
	} 
	$(document).ready(function(){
		var inp =$("input").val();
		$(".btn-plus").on("click",function(){
			setTimeout(function(){
			if (inp == 4)
			{
				inp;
			}
			else{inp ++;}
			$("input").val(inp);
			},500);
		});
		$(".btn-minus").on("click",function(){
			setTimeout(function(){
			if (inp == 0)
			{
				inp;
			}
			else if(inp <= 4)
			{
				inp--;
			}
			$("input").val(inp);
			},4);
		});
	});
 
	</script>
	
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
					$(".round-selection").attr("disabled", false) 
				 
				 
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
	
		 
		 <div class="content">
		 
		<form name="ticket_reservationFrom"  action="ticketReservationCheck.do"  method="post">
	
		 
		 
			
			<main  >
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
													 
													<img data-v-2fed1a9a="" data-v-8ed31374="" src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"
													alt=${ vo.dtitle } style=""> 
													 
													
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
															<p data-v-8ed31374="" class="price">${ vo.dprice } 원 </p>
														</li>
													</ul>
												</div>
												<div data-v-8ed31374="" class=" ">
													 
												</div>
												<div data-v-8ed31374="" class="use-info-ticket">
													<strong data-v-8ed31374="" class="title">이용 정보</strong>
													<div class="content"> </div>
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
															<p>
																 
 

																<br>
															</p>
															<ul style="font-size: 15px"> ${ vo.dinformation } </ul>
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
														 	 
													 
													  
														<!-- 달력 코딩 -->
														<div id = "calendar" class="ticketing-list-area"></div>
														<input type = "hidden" name = "rdate" id = "rdate">
														
														
														<!-- 
														<div data-v-8ed31374="" class="decision-area">
															2022.08.31</div></li> -->
													<li data-v-8ed31374="" class="item-ticketing">
													<div data-v-8ed31374="" id="btn_toggle" role="button" class="title-area btn-toggle on">회차</div>
														<div data-v-8ed31374="" class="field-area">
															<ul data-v-8ed31374="" class="round-list">
																<li data-v-8ed31374="" class="">
																<button data-v-8ed31374="" type="button" disabled="disabled" class="round-selection" id="entertime">
																		<span data-v-8ed31374="" name="rtime" id="content" class="ContentEnter" > ${ vo.dstart }</span>
																		<!---->
																	</button></li>
															</ul>
														</div>
														<div data-v-8ed31374="" class="decision-area">~</div></li>
													<li data-v-8ed31374="" class="item-ticketing">
													<div data-v-8ed31374="" role="button" class="title-area btn-toggle" id="btb_toggle_hide" >관람인원  <div data-v-8ed31374="" class="tooltip-area">
																 
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
																	<div data-v-1dc6379c="" data-v-8ed31374="" class="control count-control" name="data-v-1dc6379c">
																	
																		<button id="countpeople" name="countpeople" data-v-1dc6379c="" type="button"   class="btn-minus"  id="decreaseQuantity"  ></button>
																		
																			<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area" >
																			<input data-v-67ca82d2="" id="inptext" name="rtotal"  type="text"   value="0"    onfocusout="onlyNumber();" autocomplete="on" placeholder="" readonly="readonly" maxlength="-1" > 	
																			 
																			<!-- <a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>--></div>  
																			
																		<button data-v-1dc6379c="" type="button" class="btn-plus" id="increaseQuantity"  ></button>
																		
																		 
																		  
																	</div>
																</div></li>
															<li data-v-8ed31374=""><div data-v-8ed31374=""
																	class="personal-control">
																	 
																	<div data-v-1dc6379c="" data-v-8ed31374=""
																		class="control count-control">
																		 
																		<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
																			 
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
																			<!---->
																		</div>
																		 
																	</div>
																</div></li>
															<li data-v-8ed31374=""><div data-v-8ed31374=""
																	class="personal-control">
																	<span data-v-8ed31374="" class="person"> </span>
																	<div data-v-1dc6379c="" data-v-8ed31374=""
																		class="control count-control">
																		 
																		<div data-v-67ca82d2="" data-v-1dc6379c="" class="input-area">
																			 
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<!---->
																			<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
																			<!---->
																		</div>
																		 
																	</div>
																</div></li>
														</ul>
														<ul data-v-8ed31374="" class="personnel-result">
															<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">인원</strong>
														 
															<input data-v-8ed31374=""   id="inptext"  value="0"   ></li>
														  
																			 
														</ul>
														<div data-v-8ed31374="" class="btn-bottom-area">
															<ul data-v-8ed31374="" class="agreement-list">
																<li data-v-8ed31374="">
																	<div data-v-34230fe0="" data-v-8ed31374="" class="check-area reservation">
																		<input data-v-34230fe0="" id="check30" type="checkbox" class = ""  >
																		<label data-v-34230fe0="" for="check30">
																			<span data-v-34230fe0="" class="check" id="check30"></span>관람시 유의사항 동의</label>
																	</div>
																	<div data-v-26e42198="" data-v-8ed31374="" class="btn-area link">
																		<a data-v-26e42198="" href="javascript:void(0);"
																			class="icon go-page"> 전문보기 </a>
																	</div></li>
															</ul>
															<div data-v-26e42198="" data-v-8ed31374=""
																class="btn-area btn-reservation"  >
														 <a href="http://localhost:9000/dmu/ticket_reservation.do?did=${ vo.getDid()}" target="_parent" >
														 <button data-v-26e42198="" id="btn32" type="button" class="primary"  disabled> 예매하기 </button></a>
															<input type="hidden" name="did" value="${ vo.did }"> 																		 						
																		 						
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
												</form>
														
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