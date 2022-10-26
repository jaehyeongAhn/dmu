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
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/visit.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function(){
	
		
		$('.snb-area .snb li a').click(function(){
			
			var idx = $(this).parent().index();
			
			$('.visual.wide.visitingInfo').removeClass('on');
			$('.snb-area .snb li').removeClass('on');
			$('.sub-contents-area.tab-content').removeClass('on');
			
			//alert(idx);
			
			if(idx==0){
				$(this).parent().addClass('on');
				$('.sub-contents-area.tab-content.tab_1').addClass('on');
				$('.back_img1').addClass('on');
			}else{
				$('.back_img2').addClass('on');
				$('.sub-contents-area.tab-content.tab_2').addClass('on');
			}
			
			$(this).parent().addClass('on');
			
		});
		
	
		
				
	});
	
</script>
<style>
	.sub-contents-area.tab-content {
		display : none;
	}
	.sub-contents-area.tab-content.on {
		display : block;
	}
	.visual.wide.visitingInfo {
		display : none;
	}
	.visual.wide.visitingInfo.on {
		display : block;
	}
</style>
</head>
<body>
	<div id="app">
		<div id="contents">
		<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
			<div style="width:100%; height:17vh; color:transparent">헤더</div>	
			<main>
				<section data-v-76e7a880="" class="sub-contents-wrap">
					<div data-v-0d03d759="" data-v-76e7a880=""
						class="sub-top-area visitingInfo">
						<div data-v-0d03d759="" class="container">
							<h2 data-v-0d03d759="">오시는 길</h2>
							<nav data-v-0d03d759="">
								<ul data-v-0d03d759="">
									<li data-v-0d03d759="" style="cursor: pointer;"><a href="index.do" style="opacity:0;">HOME</a></li>
									<li data-v-0d03d759="">VISIT</li>
									<li data-v-0d03d759="">오시는 길</li>
									<!---->
								</ul>
							</nav>
						</div>
					</div>
					<div data-v-76e7a880="" class="visual wide visitingInfo on back_img1" 
						style="background-image: url(&quot;https://pdcfsharestroage.blob.core.windows.net/share/Board/Visit/202202/20220204175916084001.png&quot;);">
					</div>
					<div data-v-76e7a880="" class="visual wide visitingInfo back_img2" 
						style="background-image: url(&quot;https://pdcfsharestroage.blob.core.windows.net/share/Board/Visit/202202/20220204164349319001.png&quot;);">
					</div>
					<div data-v-080a389a="" data-v-76e7a880="">
						<div data-v-080a389a="" class="snb-area">
							<ul data-v-080a389a="" class="snb">
								<li data-v-080a389a="" class="on" data-tab="tab-1"><a data-v-080a389a="" 
									role="button" style="cursor: pointer;">디뮤지엄</a></li>
								<li data-v-080a389a="" class="" data-tab="tab-2" onclick="map_list2()"><a data-v-080a389a=""
									role="button" style="cursor: pointer;">대림미술관</a></li>
							</ul>
						</div>
						<div data-v-080a389a="" class="sub-contents-area tab-content tab_1 on">
							<div data-v-76e7a880="" data-v-080a389a="" class="container">
								<div data-v-2f58bf89="" data-v-76e7a880="" data-v-080a389a="">
									<div data-v-2f58bf89="">
										<div id="map1" style="width:100%; height:350px;"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=170d8bc7a81666dad192c89ab7a5bd67"></script>
										<script>
											var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div 
											mapOption1 = {
												center : new kakao.maps.LatLng(37.5441547, 127.0433577), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};
											// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
											var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
											var markerPosition1 = new kakao.maps.LatLng(37.5441547, 127.0433577);
											var marker1 = new kakao.maps.Marker({ 
											    // 지도 중심좌표에 마커를 생성합니다 
											    position: markerPosition1
											}); 
											// 지도에 마커를 표시합니다
											marker1.setMap(map1);
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
						</div>
						<div data-v-080a389a="" class="sub-contents-area tab-content tab_2">
							<div data-v-76e7a880="" data-v-080a389a="" class="container">
								<div data-v-2f58bf89="" data-v-76e7a880="" data-v-080a389a="">
									<div data-v-2f58bf89="">
										<div id="map2" style="width:100%; height:350px;"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=170d8bc7a81666dad192c89ab7a5bd67"></script>
										<script>
										function map_list2(){											
											var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
											mapOption2 = {
												center : new kakao.maps.LatLng(37.5775335, 126.9733591), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};
											// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
											var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
											var markerPosition2 = new kakao.maps.LatLng(37.5775335, 126.9733591);
											var marker2 = new kakao.maps.Marker({ 
											// 지도 중심좌표에 마커를 생성합니다 
											position: markerPosition2
											}); 
											// 지도에 마커를 표시합니다
											marker2.setMap(map2);
										}
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
						<div data-v-080a389a="" class="sub-contents-area">
							<!---->
						</div>
					</div>
				</section>
				</section>
			</main>
			</main>
			<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
			<button class="goto-top show" onclick="window.scrollTo(0,0);">상단으로 이동</button>
		</div>
	</div>
	<!-- built files will be auto injected -->

	<script type="text/javascript"
		src="/js/chunk-vendors.65f4f95d8b53aa7e7c6f.js"></script>
	<script type="text/javascript" src="/js/index.65f4f95d8b53aa7e7c6f.js"></script>
</body>
</html>