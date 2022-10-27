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
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>

<title>ADMIN | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>	
			<main>
				<div data-v-ec5a0c2c="" class="root-container">
					<div data-v-ec5a0c2c="" class="content-wrapper">
						<div data-v-ec5a0c2c="" class="body-wrapper">
							<div data-v-25f87e60="" data-v-ec5a0c2c="">
								<div data-v-25f87e60="" class="sub-contents-area">
									<div data-v-6d324aa0="" data-v-7b1f57c8="" class="step-process-area">
										<ul data-v-6d324aa0="">
											<li data-v-6d324aa0="" class="complete">
													<span data-v-6d324aa0="" class="no">01</span>
													<span data-v-6d324aa0="" class="txt">ticket</span>
											</li>
											<li data-v-6d324aa0="" class="on">
												<span data-v-6d324aa0="" class="no">02</span>
												<span data-v-6d324aa0="" class="txt">ticket content</span>
											</li>
											<li data-v-6d324aa0="" class="">
												<span data-v-6d324aa0="" class="no">03</span>
												<span data-v-6d324aa0="" class="txt">수정/삭제</span>
											</li>
										</ul>
									</div>
									<div data-v-25f87e60="" class="container">
										<div data-v-8ed31374="" data-v-25f87e60=""
											class="reservation-area">
											<!---->
											<div data-v-8ed31374="" class="left">
												<div data-v-8ed31374="" class="img-ticket">
													<c:if test="${vo.dsfile != null }">
														<img data-v-2fed1a9a="" data-v-1e8092ec="" src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"> 
													</c:if>
												</div>
												<div data-v-8ed31374="" class="title-ticket">
													<h2 data-v-8ed31374="" class="title">${ vo.dtitle }</h2>
													<span data-v-8ed31374="" class="explan"> </span>
												</div>
												
												
												
												<!-- 		 		-->
												<!-- 	exhibition	 -->
												<!-- 		 		-->
												<c:if test="${vo.dcode eq 'exhibition' }">
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">장소</strong>
															<span data-v-8ed31374="" class="text">${ vo.dplace }</span>
														</li>
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">회차/수업시간  </strong>
															<span data-v-8ed31374="" class="text">${ vo.dentertime }</span>
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
															<p data-v-8ed31374="" class="price">${ vo.dprice }원 </p>
														</li>
													</ul>
												</div>
												</c:if>
												<!-- 		 		-->	
												<!-- 	learn		 -->
												<!-- 		 		-->
												<c:if test="${vo.dcode eq 'learn' }">
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">장소</strong>
															<span data-v-8ed31374="" class="text">${ vo.dplace }</span>
														</li>
														
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">부제목 </strong>
															<span data-v-8ed31374="" class="text">${ vo.dtitle2 }</span>
														</li>
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">수업시간 </strong>
															<span data-v-8ed31374="" class="text">${ vo.dentertime }</span>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">교육기간</strong>
															<span data-v-8ed31374="" class="text">${ vo.dstart } ~ ${ vo.dend }</span>
														</li>
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">교육시간</strong>
															<span data-v-8ed31374="" class="text">${ vo.dtime }</span>
														</li>
														<li data-v-8ed31374="" class=""><strong data-v-8ed31374="" class="title">이용요금</strong>
															<p data-v-8ed31374="" class="price">${ vo.dprice }원 </p>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">정원</strong>
															<span data-v-8ed31374="" class="text">${ vo.dpersonnel }</span>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">대상</strong>
															<span data-v-8ed31374="" class="text">${ vo.dtarget}</span>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">교육횟수</strong>
															<span data-v-8ed31374="" class="text">${ vo.dnum}</span>
														</li>
													</ul>
												</div>
												</c:if>
												<!-- 		 	-->
												<!-- 	evnet	 -->
												<!-- 		 	-->
												<c:if test="${vo.dcode eq 'event' }">
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">장소</strong>
															<span data-v-8ed31374="" class="text">${ vo.dplace }</span>
														</li>
														
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">부제목 </strong>
															<span data-v-8ed31374="" class="text">${ vo.dtitle2 }</span>
														</li>
														<li data-v-8ed31374="">
															<strong data-v-8ed31374="" class="title">회차</strong>
															<span data-v-8ed31374="" class="text">${ vo.dentertime }</span>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">이벤트 기간</strong>
															<span data-v-8ed31374="" class="text">${ vo.dstart } ~ ${ vo.dend }</span>
														</li>
														
														<li data-v-8ed31374="" class=""><strong data-v-8ed31374="" class="title">참가비</strong>
															<p data-v-8ed31374="" class="price">${ vo.dprice } </p>
														</li>
														<li data-v-8ed31374="" class="">
															<strong data-v-8ed31374="" class="title">대상</strong>
															<span data-v-8ed31374="" class="text">${ vo.dtarget}</span>
														</li>
													</ul>
												</div>
												</c:if>
												
												
													<strong data-v-8ed31374="" class="title" id="info">이용 정보</strong>
												<div data-v-8ed31374="" class="organ-ticket">
													<p data-v-8ed31374="" class="comment">
													<div data-v-8ed31374="" class="contents">
														<div class="editor-contents-area">
																${ vo.dinformation }
															<p>
																<br>
															</p>
														</div>
													</div>
													
												</div>
												<div data-v-8ed31374="" class="use-info-ticket">
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<a href="adminticket_update.do?did=${vo.did}"><button data-v-26e42198=""  type="button"  class="secondary small">수정</button></a>
														<a href="adminticket_delete.do?did=${vo.did}"><button data-v-26e42198=""  type="button" class="secondary small">삭제</button></a>
														<a href="adminexhibition_list.do"><button data-v-26e42198=""  type="button" class="secondary small">리스트</button></a>
													</div>
												</div>
											</div>
											
										
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
				
			</main>
			
			
		
	
	<!-- built files will be auto injected -->
	<footer>
		<!-- 0510 네이버 공통 js 추가 -->
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	</footer>

	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

</body>
</html>