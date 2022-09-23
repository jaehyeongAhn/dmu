<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="icon" href="/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">

<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script> -->
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/visit.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/admin.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
</head>
<body>
	<div id="app">
		<div id="contents">
		<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0></iframe>
			<main>
				<section data-v-76e7a880="" class="sub-contents-wrap">
					<div data-v-0d03d759="" data-v-76e7a880=""
						class="sub-top-area visitingInfo">
						<div data-v-0d03d759="" class="container">
							<h2 data-v-0d03d759="">오시는 길</h2>
							<nav data-v-0d03d759="">
								<ul data-v-0d03d759="">
									<li data-v-0d03d759="" style="cursor: pointer;">HOME</li>
									<li data-v-0d03d759="">VISIT</li>
									<li data-v-0d03d759="">오시는 길</li>
									<!---->
								</ul>
							</nav>
						</div>
					</div>
					<div data-v-76e7a880="" class="visual wide visitingInfo"
						style="background-image: url(&quot;https://pdcfsharestroage.blob.core.windows.net/share/Board/Visit/202202/20220204175916084001.png&quot;);"></div>
					<div data-v-080a389a="" data-v-76e7a880="">
						<div data-v-080a389a="" class="snb-area">
							<ul data-v-080a389a="" class="snb">
								<li data-v-080a389a="" class="on"><a data-v-080a389a=""
									href="visit_map1.do" role="button"
									style="cursor: pointer;">디뮤지엄</a></li>
								<li data-v-080a389a="" class=""><a data-v-080a389a=""
									href="visit_map2.do" role="button"
									style="cursor: pointer;">대림미술관</a></li>
							</ul>
						</div>
						<div data-v-080a389a="" class="sub-contents-area">
							<div data-v-76e7a880="" data-v-080a389a="" class="container">
								<div data-v-2f58bf89="" data-v-76e7a880="" data-v-080a389a="">
									<div data-v-2f58bf89="">
										<div id="map" style="width:100%; height:350px;"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=170d8bc7a81666dad192c89ab7a5bd67"></script>
										<script>
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(37.5441547, 127.0433577), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};
											// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
											var map = new kakao.maps.Map(mapContainer, mapOption);
											var marker = new kakao.maps.Marker({ 
											    // 지도 중심좌표에 마커를 생성합니다 
											    position: map.getCenter() 
											}); 
											// 지도에 마커를 표시합니다
											marker.setMap(map);
										</script>
										<div data-v-d59cdbde="" data-v-080a389a=""
											class="normal-area row">
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">서울특별시 성동구
													왕십리로 83-21, D MUSEUM</h4>
												<div data-v-d59cdbde="" data-v-080a389a="" class="info-area">
													<span data-v-d59cdbde="" data-v-080a389a=""><strong
														data-v-d59cdbde="" data-v-080a389a="">T.</strong>
														02-6233-7200</span>
												</div>
												<!---->
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">지하철로 오실 경우</h4>
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="" class="list-area">
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">서울숲역
															(수인분당선) 4번 출구</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															4번 출구 진입 후 정면 에스컬레이터 탑승
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															한 개 층만 올라와서 좌회전하면 디뮤지엄 도착
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">뚝섬역 (2호선)
															8번 출구</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															8번 출구에서 뚝섬역 사거리까지 130m 이동 후 왼쪽 방향
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															하나은행 서울숲지점까지 600m 직진
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															디타워 서울포레스트 방향으로 횡단보도 건넌 후, 서울숲역 4번 출구까지 125m이동
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															에스컬레이터 탑승 후 한 개 층만 내려오면 디뮤지엄 도착
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
													</dl>
												</div>
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">버스로 오실 경우</h4>
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="" class="list-area">
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">서울숲 하차
															(04178)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															121, 2014, 2224, 2413
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">서울숲역 하차
															(04866)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															마을 성동 13
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">성동구민체육센터
															하차(04850)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															마을 성동 13
															<h5 data-v-d59cdbde="" data-v-080a389a=""></h5>
															<p data-v-d59cdbde="" data-v-080a389a=""></p>
															<ul data-v-d59cdbde="" data-v-080a389a=""></ul>
														</dd>
													</dl>
												</div>
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">자동차로 오실 경우</h4>
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="" class="list-area">
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">디뮤지엄 (서울특별시
															성동구 왕십리로 83-21)으로 이동</dt>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">주차 안내 - 주차
															요금</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">
															디뮤지엄 당일 티켓 소지 시 2시간 무료 (이후 초과 요금: 매 10분당 1,000원)
															<h5 data-v-d59cdbde="" data-v-080a389a="">* 정산 방법</h5>
															<p data-v-d59cdbde="" data-v-080a389a="">디뮤지엄 방문 후,
																지하 3, 4층 엘리베이터 앞 사전 정산기에서 QR 티켓을 태그 한 다음, 주차 정산을 진행해
																주세요. (주차비는 카드결제만 가능합니다.)</p>
															<ul data-v-d59cdbde="" data-v-080a389a="">
																<li data-v-d59cdbde="" data-v-080a389a="">지하 4층에
																	주차하시면 보다 편리하게 디뮤지엄에 도착할 수 있습니다.</li>
															</ul>
														</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!---->
								<!---->
							</div>
						</div>
						<div data-v-080a389a="" class="sub-contents-area">
							<!---->
						</div>
					</div>
				</section>
			</main>
			<iframe src="footer.do" width="100%" height="160px" scrolling="no" frameborder=0></iframe>
			<button class="goto-top">상단으로 이동</button>
		</div>
	</div>
	<!-- built files will be auto injected -->

	<script type="text/javascript"
		src="/js/chunk-vendors.65f4f95d8b53aa7e7c6f.js"></script>
	<script type="text/javascript" src="/js/index.65f4f95d8b53aa7e7c6f.js"></script>
</body>
</html>