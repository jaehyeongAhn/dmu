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
<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0></iframe>
	<div id="app">
		<div id="contents">
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
						style="background-image: url(&quot;https://pdcfsharestroage.blob.core.windows.net/share/Board/Visit/202202/20220204164349319001.png&quot;);"></div>
					<div data-v-080a389a="" data-v-76e7a880="">
						<div data-v-080a389a="" class="snb-area">
							<ul data-v-080a389a="" class="snb">
								<li data-v-080a389a="" class=""><a data-v-080a389a=""
									href="visit_map1.do" role="button"
									style="cursor: pointer;">디뮤지엄</a></li>
								<li data-v-080a389a="" class="on"><a data-v-080a389a=""
									href="visit_map2.do" role="button"
									style="cursor: pointer;">대림미술관</a></li>
							</ul>
						</div>
						<div data-v-080a389a="" class="sub-contents-area">
							<!---->
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
												center : new kakao.maps.LatLng(37.5775335, 126.9733591), // 지도의 중심좌표
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
												<h4 data-v-d59cdbde="" data-v-080a389a="">서울특별시 종로구
													자하문로4길 21, 대림미술관</h4>
												<div data-v-d59cdbde="" data-v-080a389a="" class="info-area">
													<span data-v-d59cdbde="" data-v-080a389a=""><strong
														data-v-d59cdbde="" data-v-080a389a="">T.</strong>
														02-720-0667</span><span data-v-d59cdbde="" data-v-080a389a=""><strong
														data-v-d59cdbde="" data-v-080a389a="">F.</strong>
														02-720-0665</span>
												</div>
												<!---->
												<!---->
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">지하철로 오실 경우</h4>
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="" class="list-area">
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">경복궁역 (3호선)
															3번 출구</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">3번 출구에서
															100m 직진</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">스타벅스 경복궁역점
															바로 왼쪽 골목길 진입 후 100m 직진</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">골목길 왼편
															대림미술관 도착</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">종각역 (1호선)
															1번 출구</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">4번 출구에서 약
															100m 직진</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">경복궁 방향 횡단보도
															건너가기 전 (효자료 사거리)에서 좌회전 후 아름지기까지 약 200m 직진</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">아름지기 앞에서 왼쪽
															골목 진입</dd>
														<dd data-v-d59cdbde="" data-v-080a389a="">약 40m 직진 후
															대림미술관 도착</dd>
													</dl>
												</div>
												<!---->
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">버스로 오실 경우</h4>
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="" class="list-area">
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">경복궁역 하차
															(01115)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">1020, 1711,
															7016, 7018, 7022, 7212</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">경복궁역 (하차)
															01685</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">마을버스 종로 09</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">사직동 주민센터 하차
															(01114)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">171, 272,
															606, 708, 710, 7025, 01B</dd>
													</dl>
													<dl data-v-d59cdbde="" data-v-080a389a="">
														<dt data-v-d59cdbde="" data-v-080a389a="">서울경찰청∙경복궁역
															하차 (01127)</dt>
														<dd data-v-d59cdbde="" data-v-080a389a="">171, 272,
															606, 700, 707, 710, 7025, 9703, M7129, 01A</dd>
													</dl>
												</div>
												<!---->
											</div>
											<div data-v-d59cdbde="" data-v-080a389a="">
												<h4 data-v-d59cdbde="" data-v-080a389a="">자동차로 오실 경우</h4>
												<!---->
												<!---->
												<div data-v-d59cdbde="" data-v-080a389a="">
													<ol data-v-d59cdbde="" data-v-080a389a="">
														<li data-v-d59cdbde="" data-v-080a389a="">주차공간이 협소하여
															장애인 및 임신부를 위한 교통약자 배려주차장으로 사용하고 있습니다.<br>인근 유료주차장을
															이용해주시기 바랍니다.
														</li>
													</ol>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
				</section>
			</main>
			<iframe src="footer.do" width="100%" height="550px" scrolling="no" frameborder=0></iframe>
			<button class="goto-top">상단으로 이동</button>
		</div>
	</div>
	<!-- built files will be auto injected -->

	<script type="text/javascript"
		src="/js/chunk-vendors.65f4f95d8b53aa7e7c6f.js"></script>
	<script type="text/javascript" src="/js/index.65f4f95d8b53aa7e7c6f.js"></script>


	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
</body>
</html>