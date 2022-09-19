<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script>
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/index.css">
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/2/util.js"></script>
</head>
<body>
	<div id="app">
		<div id="contents">
			<header class="">
				<div class="header-web">
					<div class="header-side">
						<ul>
							<li><a href="http://localhost:9000/dmu/login.do"
								target="_parent" class=""> LOGIN </a></li>
							<li><a href="/join/info" target="_parent" class="">
									BECOME A MEMBER </a></li>
							<!---->
							<!---->
							<li><a href="http://localhost:9000/dmu/notice_list.do"
								target="_parent" class=""> NOTICE </a></li>
							<li><a href="https://daelimculturalfoundation.org"
								target="_blank"><a>대림문화재단</a></a></li>
						</ul>
					</div>
					<div class="main-menu-area">
						<h1>
							<a href="http://localhost:9000/dmu/index.do" target="_parent">대림문화재단</a>
						</h1>
						<div class="main-menu">
							<ul>
								<li class="visit"><a href="visit_main.do" target="_parents"> VISIT </a></li>
								<li class="exhibition"><a href="javascript:void(0);"> EXHIBITION
								</a></li>
								<li class="learn" ><a href="javascript:void(0);"> LEARN </a></li>
								<li class="event"><a href="javascript:void(0);"> EVENT </a></li>
								<li class="ticket"><a
									href="http://localhost:9000/dmu/exhibition_list.do"
									target="_parent"> TICKET </a></li>
							</ul>
							<div class="sub-menu" id="menu_visit" style="width: 100%; display:none;">
								<div class="pannel">
									<div>
										<div class="menu-area">
											<ul>
												<li><a href="javascript:void(0);"
													href="http://localhost:9000/dmu/visit_main.do" style="">
														미술관 소개 </a></li>
												<li><a href="javascript:void(0);"
													href="http://localhost:9000/dmu/visit_info.do"> 관람안내 </a></li>
												<li><a href="javascript:void(0);"
													href="http://localhost:9000/dmu/visit_map.do"> 오시는 길 </a></li>
											</ul>
										</div>
										<div class="banner-area">
											<ul>
												<li class="d-museum"><strong> <svg
															xmlns="http://www.w3.org/2000/svg" width="88"
															height="17.997" viewBox="0 0 88 17.997">
              <path data-name="-e-디뮤지엄"
																d="M5040 188.995v-17.979h17.28v17.979zm3.581-3.67h5.367a5.341 5.341 0 0 0 0-10.682h-5.367v1.615h1.386v7.454h-1.386zm15.289 3.652V171H5128v17.979zm43.272-12.543h1.066v5.158a3.663 3.663 0 1 0 7.325 0v-5.158h1.067v-1.618h-3.723v1.618h1.064v5.161a2.07 2.07 0 1 1-4.14 0v-5.161h1.064v-1.618h-3.723zm-12.747 8.876a3.3 3.3 0 0 0 3.4-3.192v-.018a2.98 2.98 0 0 0-.059-.578 2.477 2.477 0 0 0-.958-1.5 5.188 5.188 0 0 0-1.854-.806c-.122-.031-.244-.063-.368-.091-.227-.057-.458-.115-.689-.18a11.15 11.15 0 0 1-.729-.22 1.039 1.039 0 0 1-.769-.936 1.47 1.47 0 0 1 1.7-1.5c1.544.058 1.8 1.781 1.8 1.781h1.591v-3.314h-1.591v.468l-.009-.006a3.47 3.47 0 0 0-1.891-.551 3.052 3.052 0 0 0-3.207 2.87v.237a2.258 2.258 0 0 0 .016.282 2.569 2.569 0 0 0 1.159 1.852 2.53 2.53 0 0 0 .516.261 9.792 9.792 0 0 0 1.18.358 46.709 46.709 0 0 1 .921.244 4.433 4.433 0 0 1 1.057.4 1.01 1.01 0 0 1 .582.955 1.045 1.045 0 0 1-.017.2 1.86 1.86 0 0 1-1.936 1.368 2.033 2.033 0 0 1-1.953-1.879h-1.587v3.345h1.592v-.534a3.512 3.512 0 0 0 2.102.684zm-14.127-8.876h1.067v5.158a3.664 3.664 0 1 0 7.327 0v-5.158h1.065v-1.618H5081v1.618h1.066v5.161a2.07 2.07 0 1 1-4.14 0v-5.161h1.063v-1.618h-3.723zm45.534 8.718h3.727v-1.619h-1.065v-7.1h1.065v-1.618h-3.5l-2.48 5.059-2.48-5.059h-3.5v1.618h1.067v7.1h-1.067v1.619h3.726v-1.619h-1.067v-6.776l3.319 6.776 3.321-6.776v6.776h-1.068zm-26.788 0h7.154v-2.7h-1.591v1.078h-2.91v-2.74h2.919v-1.615h-2.919v-2.744h2.91v1.076h1.591v-2.694h-7.154v1.618h1.062v7.1h-1.062zm-23.442 0h3.725v-1.619h-1.067v-7.1h1.067v-1.618h-3.5l-2.48 5.059-2.479-5.059h-3.5v1.618h1.066v7.1h-1.066v1.619h3.725v-1.619H5065v-6.776l3.32 6.776 3.32-6.776v6.776h-1.067zm-24.015-1.444v-7.449h2.4a3.725 3.725 0 0 1 0 7.449z"
																transform="translate(-5039.999 -170.998)"
																style="fill:#111"></path>
            </svg>
												</strong><img src="/img/d-museum.053e2e0e.jpg" alt="디뮤지엄">
													<div>
														<p>
															<em>OPEN TODAY</em><span>11:00AM ~ 08:00PM</span>
														</p>
														<p>서울특별시 성동구 왕십리로 83-21,</p>
														<p>디뮤지엄</p>
													</div></li>
												<li class="daelim"><strong> <svg
															xmlns="http://www.w3.org/2000/svg" width="122.999"
															height="11.998" viewBox="0 0 122.999 11.998">
              <path data-name="-e-대림미술관"
																d="M4814.281 186.047v-8.389c0-.365.133-.527.489-.527h1.858c.367 0 .477.161.477.527v7.89c0 .791.7 1.114 1.557 1.114.837 0 1.556-.323 1.556-1.114v-7.89c0-.365.138-.527.49-.527h1.863c.354 0 .469.161.469.527v8.389c0 1.488-1.161 2.95-4.378 2.95-3.238.003-4.381-1.462-4.381-2.95zm-19.1 0V184.9c0-.37.132-.535.5-.535h1.785c.349 0 .471.165.471.535v.773c0 .793.67 1.089 1.513 1.089s1.533-.3 1.533-1.089v-.352c0-.618-.823-.909-1.487-1.148l-2.459-.931a2.562 2.562 0 0 1-1.6-2.294v-1c0-1.493.892-2.95 4.062-2.95 3.189 0 4.147 1.458 4.147 2.95v.637c0 .358-.138.518-.5.518h-1.79c-.35 0-.476-.16-.476-.518v-.261c0-.795-.553-1.091-1.337-1.091s-1.369.3-1.369 1.091v.181a.782.782 0 0 0 .561.729l2.884.979a2.793 2.793 0 0 1 2.143 2.606v1.226c0 1.488-1.045 2.95-4.279 2.95s-4.302-1.46-4.302-2.948zm-10.543 0v-8.389c0-.365.126-.527.5-.527h1.849c.368 0 .477.161.477.527v7.89c0 .791.7 1.114 1.555 1.114s1.558-.323 1.558-1.114v-7.89c0-.365.142-.527.5-.527h1.845c.359 0 .482.161.482.527v8.389c0 1.488-1.167 2.95-4.389 2.95s-4.378-1.462-4.378-2.95zm49.109 2.811c-.371 0-.5-.16-.5-.527v-5.458a31.524 31.524 0 0 1-.537 1.814l-.771 1.878a.667.667 0 0 1-.664.519h-1.49a.7.7 0 0 1-.657-.519l-.947-2.2a11.251 11.251 0 0 1-.437-1.428v5.4c0 .367-.13.527-.488.527h-1.681c-.361 0-.493-.16-.493-.527v-10.679c0-.365.132-.527.493-.527h1.681a.426.426 0 0 1 .444.283l2.335 5.276c.248.58.467 1.3.5 1.358a11.219 11.219 0 0 1 .489-1.336l2.264-5.337c.07-.174.2-.244.458-.244h1.765c.357 0 .483.161.483.527v10.673c0 .367-.126.527-.483.527zm-27.718 0c-.351 0-.5-.167-.5-.527v-10.673c0-.365.149-.527.5-.527h5.875c.36 0 .516.123.516.489v1.347c0 .354-.155.5-.516.5h-3.538v2.233h3.262c.358 0 .523.12.523.483v1.257c0 .359-.165.5-.523.5h-3.262v2.588h3.711c.367 0 .509.115.509.479v1.341c0 .359-.142.5-.509.5zm-25.669 0c-.353 0-.5-.16-.5-.527v-5.458c-.023.059-.341 1.261-.549 1.814l-.765 1.878a.677.677 0 0 1-.668.519h-1.478c-.342 0-.518-.217-.658-.519l-.932-2.2a11.413 11.413 0 0 1-.46-1.428v5.4c0 .367-.12.527-.472.527h-1.688c-.362 0-.5-.16-.5-.527v-10.679c0-.365.142-.527.5-.527h1.688a.432.432 0 0 1 .444.283l2.33 5.276c.242.58.464 1.3.5 1.358a12.513 12.513 0 0 1 .5-1.336l2.243-5.337c.073-.174.212-.244.467-.244h1.773c.358 0 .473.161.473.527v10.673c0 .367-.115.527-.473.527zm-15.726 0c-.375 0-.511-.16-.511-.527v-5.458c-.011.059-.337 1.261-.537 1.814l-.762 1.878c-.137.335-.313.519-.665.519h-1.492c-.351 0-.521-.217-.664-.519l-.937-2.2c-.185-.436-.408-1.3-.448-1.428v5.4c0 .367-.118.527-.479.527h-1.687c-.362 0-.493-.16-.493-.527v-10.679c0-.365.131-.527.493-.527h1.687a.413.413 0 0 1 .44.283l2.346 5.276c.232.58.456 1.3.491 1.358a11.055 11.055 0 0 1 .494-1.336l2.25-5.337c.073-.174.219-.244.472-.244h1.769c.354 0 .476.161.476.527v10.673c0 .367-.121.527-.476.527zm-13.062 0c-.368 0-.5-.16-.5-.527v-10.673c0-.365.128-.527.5-.527h1.851c.355 0 .483.161.483.527v10.673c0 .367-.127.527-.483.527zm-8.4 0c-.311 0-.443-.18-.443-.527v-10.673c0-.365.132-.527.506-.527h1.846c.367 0 .493.161.493.527v8.877h3.356c.363 0 .514.115.514.479v1.341c0 .359-.151.5-.514.5zm-8.755 0c-.363 0-.5-.167-.5-.527v-10.673c0-.365.138-.527.5-.527h5.875c.353 0 .5.123.5.489v1.347c0 .354-.149.5-.5.5h-3.541v2.233H4740c.362 0 .517.12.517.483v1.257c0 .359-.155.5-.517.5h-3.259v2.588h3.7c.368 0 .528.115.528.479v1.341c0 .359-.16.5-.528.5zm-4.347 0c-.37 0-.523-.188-.61-.527l-.441-1.638h-2.85l-.449 1.638c-.092.339-.236.527-.6.527h-1.733c-.358 0-.479-.188-.377-.527l3.106-10.673c.108-.343.271-.527.635-.527h1.859a.6.6 0 0 1 .633.527l3.108 10.673c.1.339-.015.527-.377.527zm-3.036-5.338-.249.921h1.613l-.24-.921a34.754 34.754 0 0 1-.537-3.612 34.3 34.3 0 0 1-.592 3.612zm-13.6 5.338c-.311 0-.432-.18-.432-.527v-10.673c0-.365.141-.527.5-.527h3.89c3.226 0 4.4 1.466 4.4 2.946v5.832c0 1.486-1.171 2.949-4.4 2.949zm2.407-2.323h1.546c.845 0 1.556-.328 1.556-1.125v-4.823c0-.793-.711-1.134-1.556-1.134h-1.546z"
																transform="translate(-4712.995 -176.999)"
																style="fill:#111"></path>
            </svg>
												</strong><img src="/img/daelim.171e3647.jpg" alt="대림미술관">
													<div>
														<p>
															<em>We are preparing for a next exhibition</em>
														</p>
														<p>서울특별시 종로구 자하문로 4길 21,</p>
														<p>대림미술관</p>
													</div></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						<div class="sub-menu normal" id="menu_exhibition" style="width: 100%; display:none;">
							<div class="pannel">
								<div>
									<div class="menu-area">
										<ul>
											<li><a href="javascript:void(0);" style=""> 현재 전시 </a></li>
											<li><a href="javascript:void(0);"> 지난 전시 </a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="sub-menu normal" id="menu_learn" style="width: 100%; display:none;">
							<div class="pannel">
								<div>
									<div class="menu-area">
										<ul>
											<li><a href="javascript:void(0);" style=""> 유아 </a></li>
											<li><a href="javascript:void(0);"> 어린이 </a></li>
											<li><a href="javascript:void(0);"> 청소년 </a></li>
											<li><a href="javascript:void(0);"> 대학생 </a></li>
											<li><a href="javascript:void(0);"> 성인 </a></li>
											<li><a href="javascript:void(0);"> 교사 </a></li>
											<li><a href="javascript:void(0);"> 전시해설 </a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
							<div class="side-links">
										<ul class="">
											<li class="search"><a href="javascript:void(0);">
													SEARCH </a></li>
											<li class="all-menu"><a href="javascript:void(0);">
													ALL MENU </a></li>
										</ul>
									</div>
									<div class="search-view-box" style="display: none;">
										<div>
											<div data-v-67ca82d2="" class="input-area">
												<input data-v-67ca82d2="" id="field13" autocomplete="on"
													placeholder="검색어를 입력하세요." maxlength="-1" type="text"
													class="">
												<!---->
												<!---->
												<!---->
												<!---->
												<!---->
												<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
												<!---->
											</div>
											<button type="button" class="search-submit">검색</button>
										</div>
										<button type="button" class="search-close">검색 닫기</button>
									</div>
								</div>
							</div>
							<!-- <div class="header-mobile">
					<div class="header-logo-area">
						<strong class="mo-subject"> TICKET</strong>
						<button type="button" class="btn-back">뒤로가기</button>
						
						<button type="button" class="btn-all-menu">전체메뉴</button>
					</div>
					<div class="main-menu-area">
						<div class="menu-header">
							<strong class="logo"><a href="/"
								class="router-link-active"> 대림문화재단 </a></strong>
						</div>
						<div class="main-menu">
							<ul class="menu-list">
								<li><a> VISIT </a></li>
								<li><a> EXHIBITION </a></li>
								<li><a> LEARN </a></li>
								<li><a> EVENT </a></li>
								<li><a> TICKET </a></li>
								<li><a> SHOP </a></li>
							</ul>
							<ul class="util-menu">
								<li><a href="/join/info" class=""> BECOME A MEMBER </a></li>
								<li><a href="/login/" class=""> LOGIN </a></li>
								
								
							</ul>
						</div>
						<div class="footer-area">
							<ul>
								<li class="schedule"><a> SCHEDULE </a></li>
								<li class="search"><a> SEARCH </a></li>
								<li class="alarm"><a> ALARM </a></li>
								<li class="help"><a> HELP </a></li>
							</ul>
							
							<div class="lang-area">
								<a href="https://daelimculturalfoundation.org" target="_blank"><strong>대림문화재단</strong></a>
								<ul>
									<li><a href="javascript:void(0);"> KOR </a></li>
								</ul>
							</div>
						</div>
						
						<button type="button" class="btn-close">닫기</button>
					</div>
					
				</div> -->
			</header>
</body>
</html>