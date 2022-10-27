<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<meta name="format-detection" content="telephone=no">
<link rel="icon" href="/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/exhibition_page_det.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/tag_page.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>


<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body class="">
	<!-- header  -->
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>

	<main>
		<div data-v-6e774a1a="">
			<!---->
			<section data-v-6e774a1a="" class="sub-contents-wrap">
				<div data-v-6e774a1a="" class="current-view-top">
					<h2 data-v-6e774a1a="">Romantic Days</h2>
					<span data-v-6e774a1a="" class="subtitle">${vo.dtitle }</span>
					<div data-v-6e774a1a="" class="info">
						<span data-v-6e774a1a="" class="place">${vo.dplace }</span><span
							data-v-6e774a1a="" class="term"> ${vo.dstart } ~ ${vo.dend } </span>
						<div data-v-6e774a1a="" class="btn-exhibition">
							<div data-v-26e42198="" data-v-6e774a1a="" class="btn-area">
								<button data-v-26e42198="" id="btn216" type="button"
									class="btn-share">공유하기</button>
							</div>
							<div data-v-26e42198="" data-v-6e774a1a="" class="btn-area">
								<a href="exhibition.do?did=${vo.did }"><button data-v-26e42198="" id="btn219" type="button"
									class="btn-ticketing primary">예매하기</button></a>
							</div>
						</div>
					</div>
				</div>
				<div data-v-6e774a1a="" class="current-view-poster">
					<div data-v-6e774a1a="" class="poster">
						<img data-v-2fed1a9a="" data-v-6e774a1a=""
							src="https://cdn.daelimmuseum.org/Program/Exhibition/Detail/E/202204/20220413153608451001.jpg"
							alt="어쨌든, 사랑" class="pc" style=""><img data-v-2fed1a9a=""
							data-v-6e774a1a=""
							src="https://cdn.daelimmuseum.org/Program/Exhibition/Detail/D/202204/20220413153612787001.jpg"
							alt="어쨌든, 사랑" class="mo" style="">
					</div>
					<div data-v-6e774a1a="" class="infomation">
						<ul data-v-6e774a1a="">
							<li data-v-6e774a1a=""><strong data-v-6e774a1a="">장르</strong><span
								data-v-6e774a1a="">사진, 만화, 일러스트레이션, 설치</span></li>
							<li data-v-6e774a1a=""><strong data-v-6e774a1a="">주최</strong><span
								data-v-6e774a1a="">디뮤지엄</span></li>
							<li data-v-6e774a1a=""><strong data-v-6e774a1a="">후원</strong><span
								data-v-6e774a1a="">DL E&amp;C, 삼성화재, 현대해상, 교보생명</span></li>
							<!---->
							<!---->
						</ul>
					</div>
				</div>
				<div data-v-47166101="" class="program-view-contents">
				<div data-v-080a389a="" data-v-6e774a1a="">
					<div data-v-080a389a="" class="snb-area" id="snb">
											
											<ul data-v-080a389a="" class="snb"  >
												<li data-v-080a389a="" class="on">
													<a data-v-080a389a="" role="button"   onclick="myFunction1()"  style="cursor: pointer;  ">전시소개</a>
												</li>
												<li data-v-080a389a="" class="">
													<a data-v-080a389a="" role="button"  onclick="myFunction2()"  style="cursor: pointer;">작가소개</a>
												</li>
												<li data-v-080a389a="" class="">
													<a data-v-080a389a="" role="button"   onclick="myFunction3()"  style="cursor: pointer;">전시연계프로그램</a>
												</li>
											</ul>
										</div>
					<div data-v-080a389a="" id="introduction" class="sub-contents-area">
						<div data-v-6e774a1a="" data-v-080a389a=""
							class="introduction-area">
							<div data-v-6e774a1a="" data-v-080a389a="" class="container">
								<div data-v-6e774a1a="" data-v-080a389a=""
									class="sub-title-area" id="program">
									<h3 data-v-6e774a1a="" data-v-080a389a="" class="tit-underline">
										전시소개</h3>
								</div>
								<div data-v-6e774a1a="" data-v-080a389a="">
									<div class="editor-contents-area">
										<div class="special-project-html">
											<div class="special-project">
												<div class="pc">
													<img
														src="https://cdn.daelimmuseum.org/Program/Contents/202210/20221011103409082001.jpg">
												</div>
												<div class="mo">
													<img
														src="https://cdn.daelimmuseum.org/Program/Contents/202210/20221011103409082001.jpg">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-v-080a389a="" id="brand" class="sub-contents-area">
						<div data-v-6e774a1a="" data-v-080a389a=""
							class="author-about-area">
							<div data-v-6e774a1a="" data-v-080a389a="" class="container">
								<div data-v-6e774a1a="" data-v-080a389a=""
									class="sub-title-area">
									<h3 data-v-6e774a1a="" data-v-080a389a="" class="tit-underline">
										작가소개</h3>
								</div>
								<!---->
							</div>
							<div data-v-6e774a1a="" data-v-080a389a="" class="cont">
								<div data-v-4d0d3256="" data-v-6e774a1a=""
									class="responsive-area" data-v-080a389a="">
									<div data-v-ea82c312="" data-v-4d0d3256=""
										class="slide-pagination-area">
										<button data-v-ea82c312="" type="button"
											class="btn-prev btn-list-prev">prev</button>
										<div data-v-ea82c312="" class="page-list221"></div>
										<button data-v-ea82c312="" type="button"
											class="btn-next btn-list-next">next</button>
									</div>
									<div data-v-65d27eab="" data-v-4d0d3256="" class="swiper-area"
										is-small="true">
										<div data-v-65d27eab="" class="step4">
											<ul data-v-65d27eab="">
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															천계영 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204407015001.jpg"
																	alt="천계영" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">천계영은 1996년 만화잡지
																	『윙크』의 신인 만화 공모전에서 대상을 수상한 단편작 &lt;TALENT&gt;로 데뷔해, 컴퓨터
																	그래픽 프로그램을 활용한 신선한 그림체와 매력적인 캐릭터로 다양한 취향의 독자들을 사로잡았다. 이어
																	연재한 &lt;언플러그드 보이&gt;는 사춘기의 설레는 풋사랑을 대변하는 소년, 소녀의 이야기에
																	트렌디한 패션 감각까지 갖춘 특별한 캐릭터로 대중의 인기를 얻었다. 이 열기를 반영하여 만화의
																	주인공 ‘강현겸’은 현실 세계에서도 신드롬을 일으키며, 풍선껌 CF에 주연으로 발탁되기도 했다.
																	천계영의 두 번째 장편 &lt;오디션&gt;은, 당시에는 상상하기 어려웠던 서바이벌 음악
																	오디션이라는 배경과 개성 강한 등장인물들로 독자들의 폭발적인 사랑을 받으며 누적 판매량 100만
																	권을 달성했다. 이후 3D 프로그램으로 만화를 그리기 시작하여, &lt;DVD&gt;,
																	&lt;하이힐을 신은 소녀&gt;, &lt;예쁜 남자&gt;, &lt;드레스 코드&gt;를 웹툰
																	플랫폼과 만화책의 경계를 오가며 선보였다. 그뿐만 아니라 2014년부터 연재 중인 웹툰
																	&lt;좋아하면 울리는&gt;은 IT 기술을 반영한 SF로맨스로 청춘들의 공감을 얻어내며 2019년
																	넷플릭스 오리지널 드라마로 제작되었다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">천계영</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															지미 마블 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204351621001.jpg"
																	alt="지미 마블" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">로스앤젤레스를 기반으로 활동하는
																	영상 감독이자 포토그래퍼 지미 마블은 각본과 영상 그리고 사진에 다양한 스토리텔링을 담는다.
																	어려서부터 자신의 글을 읽는 사람들의 감정 변화에 관심이 있었던 작가는, 문예 창작을 전공한 후
																	직접 쓴 시나리오를 기반으로 단편영화, 뮤직비디오, 웹 광고 등을 연출했다. 2013년부터는
																	사진으로 영역을 확장해, 프레임 속 미장센을 통해 전달되는 다양한 심리에 관심을 두고, 초현실적이고
																	화려하며 선명한 컬러들이 섞인 이미지가 불러일으키는 긍정적인 감정들을 탐색해왔다. 작가는 사랑하는
																	아내이자 포토그래퍼였던 아내 제스 마블(Jesse Marble)과 함께 그룹 ‘더 마블스(The
																	Marbles)’를 결성하여 본격적인 협업 작업을 선보였는데, 가장 친밀한 아티스트 파트너였던
																	아내와 함께 활동하던 시기의 작품들은 독보적인 감각과 따뜻한 시선을 지니고 있다.
																	코카콜라(Coca-Cola), 나이키(Nike), 애플(Apple) 등 다수의 브랜드와 협업했으며,
																	특히 그의 필름은 트라이베카 영화제(Tribeca Film Festival),
																	나우니스(NOWNESS) 등에 상영된 바 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">지미
																	마블</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															루카스 와이어보스키 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204336843001.jpg"
																	alt="루카스 와이어보스키" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">루카스 와이어보스키는 독특한
																	패턴과 색감과 기이하고 낯선 모델들의 포즈로 환상적이고 신비로운 장면을 연출해 작품에 담아내는
																	포토그래퍼다. 작가는 어린 시절 재봉사였던 어머니가 직접 디자인한 레트로 스타일의 의상에 매료되어
																	원색적인 컬러와 화려한 패턴을 사진 작업에 반영하는데, 이 과정에서 80년대 빈티지 의상을 소품으로
																	활용하기도 한다. 전형적인 70년대 폴란드식 인테리어로 꾸며진 집에서 자란 작가는 집 근처 공터나
																	친구의 집 등 지극히 일상적인 장소를 배경으로 노스탤지어가 묻어나는 공간을 포착한다. 아날로그
																	카메라로 즉흥적으로 셔터를 누르는 작업 방식을 선호하는 그의 사진 전반에는, 매력적인 아날로그적
																	감성과 계산되지 않은 순간의 순수하고 자유로운 관찰이 담겨있다. 그의 작업은 『보그(Vogue)』,
																	『마리끌레르(Marie Claire)』, 『데이즈드(Dazed)』 등 다수의 패션지에 소개되었다.
																</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">루카스
																	와이어보스키</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															이은혜 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330151951272001.jpg"
																	alt="이은혜" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">이은혜는 시대를 반영한 서정적이고
																	감각적인 작품들로 1990년대 청춘들의 뜨거운 사랑을 받은 만화가 중 한 명으로, 1986년
																	&lt;가을소나타&gt;로 데뷔했다. 가수를 꿈꾸는 여고생의 사랑 이야기를 담은
																	&lt;댄싱러버&gt;와 고등학교 동아리를 중심으로 학창 시절의 고민을 풀어낸 &lt;점프트리
																	A+&gt;가 연달아 성공하며, 10대와 20대의 감성을 대변하는 만화가로 자리매김했다. 작가의
																	대표작 &lt;블루&gt;는 아름다운 청년들의 사랑과 방황을 특유의 감성적인 내레이션과 감수성
																	넘치는 표현력으로 담아내 순정만화 최초로 단행본 14판 인쇄라는 기록을 세우며 팬덤을 형성했다.
																	작가는 특히 영화, 드라마, 가요, 패션 등 대중문화 산업이 폭발적으로 성장하던 90년대의 기호를
																	작품 속에 녹여내고, 당시 유행하던 패션, 음악 등을 만화 속에 세련되게 투영하여 이은혜만의
																	트렌디한 스타일을 구축했다. &lt;블루&gt;의 이미지로 완성된 컬러 일러스트는 화보집, 포스터와
																	문구류 등 60종의 상품으로 개발되어 높은 판매율을 기록하며 만화의 인기를 반영했고, 한국 만화
																	최초로 제작된 OST는 발매 두 달 만에 약 10만 장이 판매되며 만화 콘텐츠가 대중문화의 주류
																	산업으로 편입되는 데 기여했다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">이은혜</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															트리스탄 홀링스워스 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204312518001.jpg"
																	alt="트리스탄 홀링스워스" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">트리스탄 홀링스워스는 꽃과 나체,
																	물결과 황혼이 교차된 매혹적이고 몽환적인 이미지를 창조한다. 어린 시절 필름 카메라와 녹음기를
																	가지고 자신의 일상을 기록했던 그는, 2016년에 떠난 여행을 기점으로 포토그래퍼로서의 활동을
																	시작했다. 낯선 여행지에서 얻는 다양한 자극들을 영감으로 최근에는 자신의 집 근처 자연과 일상을
																	기록하는 것에 집중하는데, 평범해 보이는 순간들을 초현실적으로 표현하는 데에 탁월한 능력이 있다.
																	작가는 빛이 깃들 때 무지갯빛을 발산하는 순간을 정확하게 포착하고, 한 컷에 여러 장면을 중첩
																	시키는 다중노출(Multiple Exposure)로 흐릿하고 흔들리는 것 같은 몽환적인 분위기와
																	색감을 만들어 마치 공간을 이동하거나 꿈을 꾸는 듯한 장면을 연출한다. 트리스탄은 사진뿐만 아니라
																	글쓰기, 비디오, 자연 그리고 식물 의학에도 관심을 두고 다양한 분야에서 활동하고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">트리스탄
																	홀링스워스</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															마가렛 더로우 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330152022184001.jpg"
																	alt="마가렛 더로우" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">마가렛 더로우는 척추측만증으로
																	비롯된 지속적인 통증을 자화상과 풍경 사진에 투영한다. “사진은 내게 고립 속에서 자아를 찾는
																	고독한 시간을 선사했고, 신체의 나약함을 강인한 정신으로 탈바꿈하도록 도와주었다.”라 말하는
																	작가는, 사진을 자신의 몸과 마음을 단련하고 내면의 감정을 표출하며, 이동이 어려운 상황 속에서
																	타자와 소통하는 도구로 여긴다. 그녀는 사진을 찍는 행위를 통해 치유와 회복의 기회를 얻고, 자신이
																	나약하다고 여겨질 때마다 힘을 얻었다. 때로는 평범해 보이지만 시적이고 서정적인 그녀의 이미지에는
																	수많은 삶의 순간들, 고통 속에서 고뇌하며, 살아 숨 쉬고, 생존하고, 극복하고, 치유하고,
																	회복해가는 복잡한 감정들이 점철되어 있다. 짙고 푸른 색감과 흑백의 대조, 소프트 포커스로 연출된
																	몽환적인 장면들은 보는 이들로 하여금 어떠한 상황 속에서도 꿈꾸는 것을 멈추지 않고, 내면의 소리에
																	귀 기울이며, 자신만의 방식으로 목소리를 내도록 독려한다. 2020년 아트북 『Margaret
																	Durow』를 출간하며 포토그래퍼로서의 입지를 다지고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">마가렛
																	더로우</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															아이엠파인 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330151935634001.jpg"
																	alt="아이엠파인" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">아이엠파인은 디지털로 표현할 수
																	있는 모든 것에 관심을 두고 디자인, 예술, 개발 분야를 다루는 전문가들이 모여 결성한 인터랙티브
																	뉴미디어 아트 그룹이다. 새로운 기술과 다양한 플랫폼을 접목한 스토리텔링을 바탕으로, 상상력 가득한
																	경이로운 뉴미디어 경험을 창조해 사람들에게 전달하는 것을 목표로 한다. 2011년 국내 최초로
																	공연, 게임, 예술을 한자리에서 선보인 미디어아트 전시 ‘라이브파크’ 구축에 참여했고, 이후
																	코카콜라(Coca-Cola), 나이키(NIKE), 방탄소년단(BTS), 젠틀몬스터(Gentle
																	Monster) 등 폭넓은 영역과의 협업 콘텐츠를 선보이며 현실과 예술의 경계를 넘나드는 실험을
																	지속하고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">아이엠파인</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															이빈 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330151920539001.jpg"
																	alt="이빈" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">이빈은 1991년 『르네상스』의
																	신인 공모전을 통해 데뷔한 후, 화려하고 개성 강한 그림체로 10대들의 모습을 파격적으로 그려내며
																	만화의 스펙트럼을 넓혔다. 전형적인 순정만화 주인공들의 모습에서 벗어난 당돌하고 반항적인
																	등장인물들은 당시 대중문화의 매력적인 요소들을 적극적으로 흡수하며 폭넓은 층의 팬덤을 확보했다.
																	특히 홍콩 누아르 영화의 무드를 연상시키는 &lt;크레이지 러브 스토리&gt;는 10대들의 방황과
																	내면의 고뇌를 스타일리시하게 그려내 독자들을 열광시켰다. 30년이 넘는 활동 기간 동안
																	&lt;걸즈&gt;, &lt;개똥이&gt;, &lt;Merry Tuesday&gt;,
																	&lt;패리스와 결혼하기&gt;와 같은 명랑 만화 와 록 음악과 록 밴드를 소재로 한
																	&lt;포스트모더니즘 시티&gt;, &lt;틴에이지 팬클럽&gt;, &lt;ONE&gt;, 그리고
																	판타지적 요소가 가미된 &lt;MANA&gt; 등을 선보이며, 끊임없이 새로운 주제와 변화된
																	스타일로 작품을 만들어 왔다. 특히 7-80년대를 살아가는 평범한 가족의 일상을 친근하고 유쾌하게
																	그려낸 &lt;안녕?! 자두야!!&gt;는 TV 애니메이션, 극장판 애니메이션, 어린이용 학습만화
																	및 캐릭터 상품으로 개발되어 25년이 지난 원작 만화의 확장 가능성을 보여주고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">이빈</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															테오 고슬린 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204246012001.jpg"
																	alt="테오 고슬린" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">테오 고슬린은 “즐기며 살고,
																	열렬히 사랑하라(Live fast, love hard)”는 모토를 바탕으로 젊음, 자유, 사랑,
																	세대, 모험 등을 담은 친구들의 이야기에 주목한다. 2007년 포토그래퍼로 활동을 시작한 그는
																	사랑하는 주변 인물들과 함께 떠난 로드 트립에서 만난 사람들의 자유로운 모습을 마치 영화 속 한
																	장면처럼 아름답게 포착한 작업으로 주목받기 시작했다. 특히 각별한 연인 모드 샬라드(Maud
																	Chalard)와 함께 낡은 벤을 타고 미국을 횡단하는 여행에서 촬영한 사진들을 엮어 2015년
																	출간한 사진집 『Joe’s Road』는 영화보다 더 영화 같은 장면들로 역동하는 감정들을 전달한다.
																	시적 목가 표현(Poésie Bucolique)이 두드러지는 그의 작업은, 니콜라
																	푸생(Nicolas Poussin, 1594-1665), 에두아르 마네(Édouard Manet,
																	1832-1883) 또는 폴 세잔(Paul Cézanne, 1839-1906)과 같은 고전 화가의
																	21세기 버전으로 여겨지기도 하는데, 가까운 친구를 피사체로 하는 일상적 장면이라는 데에 그 차이가
																	있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">테오
																	고슬린</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															모드 샬라드 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330151643002001.jpg"
																	alt="모드 샬라드" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">모드 샬라드의 사진은 여성,
																	자유, 사랑을 주제로 사랑하는 연인들을 피사체로 담아 오직 두 사람만이 공유하는 친밀하고 애틋한
																	감정과 내밀한 시간을 전달한다. 작가는 작업 전반에 걸쳐 사랑이라는 주제를 탐구하고 끊임없는
																	영감으로 삼아 왔는데, 그중 《Lovers》 시리즈는 그녀의 사랑에 대한 가치관을 반영하는
																	대표작이자 현재 진행 중인 작업이다. 이 시리즈는 연인 간의 사적인 순간들을 고스란히 보여주며
																	인간의 몸, 특히 여성의 나체가 지닌 신체 본연의 아름다움을 통해 진실하게 지속되는 사랑, 따뜻한
																	유대, 자유로운 해방의 메시지를 전한다. 또한 그녀의 연인 테오 고슬린(Theo Gosselin)과
																	함께한 작업, 『Joe’s Road』 에서도 초원과 바다 등 대자연을 누비는 연인들의 역동적인
																	움직임을 포착함으로써 사람과 사람, 자연과 사람, 자연과 자연 등 다양한 관계에서 비춰지는 사랑의
																	순간들을 보여준다. 작가는 캐논 브랜드 앰버서더(Canon Ambassador)를 역임하였고,
																	『코스모폴리탄(Cosmopolitan)』, 『리베라시옹(Libération)』 등 다수의 매거진
																	에디토리얼 작업을 진행한 바 있으며, 새로운 사진집 출간을 앞두고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">모드
																	샬라드</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															막달레나 워싱카 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330151203638001.jpg"
																	alt="막달레나 워싱카" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">막달레나 워싱카는 로스앤젤레스를
																	중심으로 활동하는 포토그래퍼로, 젊음의 에너지가 발산되는 순간들을 즉흥적으로 기록한다.
																	스케이트보드, 메탈 음악 등의 하위문화부터 카우보이의 삶까지, 작가는 항상 카메라를 지니고 다니며
																	마주친 폭넓은 문화 속 다양한 사람들의 모습을 편견 없이 포착해왔다. 특히, 관계를 맺는 과정에서
																	발생한 자전적 이야기를 담은 개인 프로젝트에서 누드 작업을 통해 날 것 그대로의 모습을 직관적으로
																	담아내는 독특한 스타일을 선보여왔다. 2004년부터 2017년까지 만난 다양한 인연들과의 사적인
																	기록들을 모아 2018년 출간한 다큐멘터리 사진집 『Leftover of Love』는 설렘, 사랑,
																	욕망, 황홀, 배신, 고통, 희망, 그리움 등으로 뒤섞인 사랑의 잔상들을 담아냈다.
																	아디다스(Adidas), 애플(Apple), 필라(FILA), 『보그(Vogue)』,
																	『엘르(Elle)』, 『데이즈드(Dazed)』, 『뉴욕 타임즈(The New York Times)』
																	등 유수의 브랜드 및 잡지와 협업하며 다양한 창작활동에 매진하고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">막달레나
																	워싱카</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															채드 무어 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204221133001.jpg"
																	alt="채드 무어" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">채드 무어는 청춘의 자유분방한
																	모습을 가감 없이 담아내며 온전히 현재에 집중하는 사람들의 때 묻지 않은 순수함을 사진으로
																	담아낸다. 그는 익스트림 스포츠 ‘BMX(Bicycle Motocross, 묘기 자전거)’를 즐기며
																	미국과 유럽에서 경합을 펼쳤던 순간들을 기록하고 싶어 사진을 시작하였고, 열정 가득했던 자신의
																	10대 시절을 비롯한 청춘들의 빛나는 순간을 전한다. 일출과 일몰 무렵 비추는 햇살 혹은 밤거리를
																	밝히는 네온사인을 배경으로 하는 그의 작업은 부드러우면서도 강렬한 오묘한 색감이 특징인데, 이는
																	아이와 어른 사이 모호한 경계에 위치한 청춘의 감성을 시각적으로 드러낸다. 사랑을 속삭이는 연인들,
																	유영하는 자유로운 영혼들, 설렘으로 상기된 표정의 사람들로 채워진 그의 작업들은 끝없는 자유와
																	순수한 행복을 그린다. 라이언 맥긴리 스튜디오(Ryan McGinley Studio)에서 인턴십을
																	거치며 쌓은 경력을 기반으로 현재 『지큐(GQ)』, 『아이디(i-D)』, 『보그(Vogue)』,
																	버버리(Burberry), 나이키(Nike) 등 유수 잡지 및 패션 브랜드와 협업을 이어오고 있다.
																</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">채드
																	무어</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															사라 맥스웰 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204138009001.jpg"
																	alt="사라 맥스웰" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">사라 맥스웰은 만화가이자
																	일러스트레이터로, 패션 일러스트레이션에서 애니메이션 GIF 및 만화에 이르기까지 다양한 분야를
																	유연하게 아우르며 활동하고 있다. 그녀는 20대 초반에 패션 일러스트레이터가 되기 위해 텍사스에서
																	프랑스로 떠나왔고, 파리에서의 삶은 작가로서의 커리어에 새로운 영감과 자극이 되었다. 특히 본인의
																	정체성을 탐색하며 사랑이 성별과 관계없이 누구에게나 허락된 것임을 작품을 통해 이야기함으로써,
																	내면에 가두어두기만 했던 감정과 생각을 표현하고, 소통하며, 연대한다. 그녀의 작업은
																	성(gender), LGBTQ, 정치 및 음악과 같은 민감한 주제를 8~90년대의 빛 바랜
																	노스탤지어가 담긴 듯한 섬세하고 부드럽게 묘사하는 것이 특징이다. 작가는 아디다스(Adidas),
																	『플레이보이(Playboy)』, 『와이어드(WIRED)』, 허핑턴 포스트(Huffington
																	Post), BBC 등 다양한 매체와 협업을 이어오고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">사라
																	맥스웰</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															이미라 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330150737191001.jpg"
																	alt="이미라" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">이미라는 1986년 &lt;바람의
																	방향&gt;으로 데뷔하여 섬세한 그림체와 감수성 넘치면서도 친근한 스토리텔링으로 90년대 한국
																	순정만화의 대표 작가로 자리 잡았다. 한국적 서사를 바탕으로 한 애절한 로맨스에 이전 세대
																	작품에서는 볼 수 없던 유머 감각을 더한 작가만의 스타일은 &lt;늘 푸른 나무&gt;,
																	&lt;늘푸른 이야기&gt;, 그리고 &lt;인어공주를 위하여&gt;를 연이어 성공시키며 당대
																	최고의 인기를 얻었다. 특히 외모와 긴밀하게 연결되는 등장인물의 독특한 이름 – 푸르매, 이슬비,
																	백장미 등 – 은 독자들을 작가의 세계관에 더 쉽고 빠르게 몰입하도록 도와주었다. 그뿐만 아니라
																	작가는 판타지, 역사, 로맨스 등 다양한 장르를 결합하고 한국적 정서에 친숙한 소재나 배경을 적용한
																	&lt;은비가 내리는 나라&gt;, &lt;남성해방대작전&gt; 등의 만화로 폭넓은 독자층의 사랑을
																	받았으며, 최근에는 &lt;인어공주를 위하여&gt;, &lt;은비가 내리는 나라&gt;
																	&lt;늘푸른 이야기&gt;의 애장본 출간과 네이버 시리즈 웹툰 &lt;남성해방대작전&gt;시즌 3
																	연재를 준비중이다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">이미라</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															양지윤 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204123293001.jpg"
																	alt="양지윤" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">양지윤은 자연에서 영감을 받아
																	한지를 주재료로 오브제를 만들고 공간 설치를 하며 전시, 공예, 브랜드 협업 등으로 작업 영역을
																	확장해왔다. 2008년 국제환경디자인공모전 ‘GREEN EARTH’에서 대상을 수상하고
																	‘서울디자인페스티벌’, ‘공예트렌드페어, ‘메종앤오브제 파리’ 참여 등 국내외를 오가며 디자이너이자
																	작가로 활동해왔으며, 2018년경부터 직접 뜬 한지와 한복 천을 활용하여 부드러운 곡선과 질감을
																	가진 독창적인 행잉 오브제 설치를 선보이고 있다. 빛이 투과되며 공기의 흐름에 따라 아름다운
																	그림자를 만들어내는 작가의 오브제들은 따뜻하고 아련한 공간적 경험을 극대화하며, 잠시 발걸음을
																	늦추고 희미해진 사랑의 기억에 스며들 수 있는 시간을 선사한다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">양지윤</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															원수연 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204112922001.jpg"
																	alt="원수연" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">원수연은 1987년
																	&lt;그림자를 등진 오후&gt;로 데뷔하여, 세련되고 감각적인 작화와 탄탄한 스토리텔링으로 많은
																	독자들의 사랑을 받아 왔다. 당시 관습적인 순정만화의 여성 캐릭터에서 탈피한 주체적이고 진보적인
																	여성상을 그려내 특히 20, 30대 여성 독자들에게 각광받았다. 또한 작가는 &lt;로미오와
																	줄리엣&gt;을 현대적으로 해석한 &lt;엘리오와 이베트&gt;, 청소년들의 방황과 동성 간의
																	사랑을 깊이 있게 묘사한 &lt;Let 다이&gt;, 로봇과 인간과의 사랑을 보여준
																	&lt;휴머노이드 이오&gt; 등 다양한 형태의 로맨스 서사를 독자들에게 전달하며 순정만화의 범주를
																	확장했다. 특히, 이국적이고 아름다운 그림체와 완벽한 남자와 당찬 여주인공의 로맨스로 선풍적인
																	인기를 얻은 &lt;풀하우스&gt;는 2012년 비와 송혜교 주연의 드라마로 제작되어 대중에게 다시
																	한번 큰 사랑을 받았고, &lt;매리는 외박중&gt;은 2010년에 만화 연재와 동시에 결말이 다른
																	드라마를 실험적인 방식으로 선보여 만화 콘텐츠의 확장 가능성과 문화적 가치를 증명했다.
																	2014년에는 웹툰 &lt;떨림&gt;을 연재하며 만화 플랫폼의 변화에 따른 작업을 시도하는 한편,
																	2016년부터 제 1대 (사)세계웹툰협회 협회장으로 활동 중이다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">원수연</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															니나 콜치츠카이아 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204051168001.jpg"
																	alt="니나 콜치츠카이아" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">니나 콜치츠카이아는 모스크바에서
																	태어나 비엔티안과 밀라노를 거쳐, 파리에서 활동하며 자유와 사랑, 낭만을 사진과 그림으로 표현하는
																	페인터이자 포토그래퍼이다. 타고난 예술적 기질을 바탕으로 여행하는 삶 속에서 사진 작업을 시작한
																	그녀는, 정확한 시점에 필름 카메라의 셔터를 누르던 감각을 그림과 시로 확장했고, 사진보다 더
																	사적이고 내밀한 감정들을 그림에 담는다. 그중 《Left Handed Lovers》 시리즈는 그녀가
																	마음의 손이라 여기는 왼손으로 그린 사랑 이야기로, 어설프게 떨리던 선들이 점차 선명해지는 작업의
																	흐름은 사랑의 과정을 은유적으로 보여준다. 또한 그림의 배경은 그녀가 고전 시집에서 선택한
																	페이지들로, 세월의 흔적이 담긴 낡은 페이지 위에 수채화를 그려 완성하였다. 그녀는
																	샤넬(Chanel)과 미우미우(MiuMiu) 등 패션 브랜드의 커미션 작업을 비롯해 개인 및 그룹
																	사진전에 참여하였고, 2019년 파리 현대 미술전(The Paris International
																	Contemporary Art Fair)의 신진아티스트를 지원하는 YIA 페어(Young
																	International Art Fair) 및 2021년 러시아 현대 아트 페어인
																	아트라이프(ArtLife)에 페인팅을 출품하였다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">니나
																	콜치츠카이아</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															박은아 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330150725459001.jpg"
																	alt="박은아" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">박은아는 1993년 스무 살의
																	나이로 만화잡지 『댕기』의 신인작가 공모전에서 &lt;키작은 보호자&gt;를 발표하며 데뷔했다.
																	이후 서양 고전 동화 &lt;잠자는 숲속의 공주&gt;를 현대물로 각색한 &lt;스위티 젬&gt;과
																	학창 시절의 추억과 사랑을 그린 &lt;다정다감&gt;, 그리고 10대들의 성장통을 그려 낸
																	&lt;불면증&gt;을 각각 다른 잡지에 동시 연재하며 인기를 얻었다. 주인공들 사이에서 일어나는
																	감정의 흐름에 깊이 빠져들게 하는 작가의 섬세한 내레이션 화법은 평범한 일상의 이야기를 특별하게
																	만들고, 전형적인 순정만화의 클리셰를 따르지 않는 결말로 작가만의 작품 스타일을 만들어 냈다. 그중
																	&lt;다정다감&gt;은 학창 시절 누구나 가졌을 법한 첫사랑, 우정, 미래와 같은 고민들을
																	박은아식 내레이션과 함께 풀어내어 지나버린 추억에 대한 애틋함과 따뜻한 잔상을 전달한다. 이 외에도
																	잔잔하지만 흡인력 있는 사랑 이야기를 그려낸 &lt;녹턴&gt;, 그리고 투명한 수채화 같은 작화로
																	그 작품성을 인정받은 &lt;방울공주&gt; 등이 대표작이다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">박은아</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															헨리 오 헤드 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204033917001.jpg"
																	alt="헨리 오 헤드" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">포토그래퍼이자 비디오그래퍼 헨리
																	오 헤드의 감각적인 사진과 영상은 청춘의 감성을 불러일으킨다. 유목적 삶 속에서 만난 사람들과 현지
																	문화에서 얻은 영감을 바탕으로 작업해 온 그는, 19살 때 히치하이킹으로 세계 각지를 여행하며
																	작가로서의 삶을 시작하였다. 자유분방한 작가의 라이프스타일은 이후 음악, 스케이트보드, 패션,
																	인물, 로드 트립 등 다양한 주제들을 다루는 사진과 영상작업으로 이어졌다. 특히 작가는 포인트 앤
																	슛(Point-and-Shoot)이라는 필름 카메라를 사용해 서로 다른 두 장면을 한 장의 필름에
																	중첩시키는 이중 노출(Double Exposures) 방식을 실험해 왔는데, 풍경을 찍은 필름을
																	되감아 그 위에 인물을 촬영한 후 인화하는 과정을 거치며 빛을 더한 작가만의 독특한 스타일을
																	구축했다. 또한 뉴질랜드 여행 중에 만난 그래픽 디자이너 아내 인디 피닉스(India
																	Phoenix)와 결혼 후 웨딩 사진 스튜디오 ‘Torches Together’를 설립해, 전형적인
																	웨딩 촬영 방식에서 벗어나 커플의 순간들을 자연스럽게 기록한다. 뮤지션 힐리(Healy)와 프로듀서
																	요지머니YoG$(YoGmoney), 그리고 로컬 상점들과 사진 및 영상 협업을 진행해오고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">헨리
																	오 헤드</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															니코 비 영 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330150705201001.jpg"
																	alt="니코 비 영" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">니코 비 영은 젊음과 일상의
																	모습을 진솔하게 담아내는 포토그래퍼로 자신의 고등학교 생활을 엮은 &lt;Inside Santa
																	Monica High&gt; 시리즈로 『뉴욕 타임즈(The New York Times)』에
																	소개되었다. 졸업을 앞둔 십 대의 비밀스러운 라이프를 솔직하게 포착한 그의 사진은 친근하고
																	익살스러운 풍경을 보여주며 학창 시절의 추억을 소환한다. 친구들과 매일같이 공유하는 일상을 사진으로
																	담아내어 꾸밈없이 풀어내는 작가는, 평소 포토저널리즘 방식으로 사건 혹은 시대를 기록하는 것을
																	즐기는데, 네 개의 고등학교 시리즈를 발표하며 자신의 학창 시절을 기록한 시리즈가 그 대표작이다.
																	스토리텔링이 겸비된 작업을 추구하는 그는 사진 외에 순수예술 영역에도 흥미를 가지며 작업 영역을
																	확장해 나가고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">니코
																	비 영</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															파올로 라엘리 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220325204016171001.jpg"
																	alt="파올로 라엘리" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">파올로 라엘리는 친구들과 경험한
																	일상의 아름다운 순간들을 카메라에 담아냄으로써 청춘이라는 시기에 겪을 수 있는 모호한 감정들을 사진
																	속에 다채롭게 녹여낸다. 사랑, 젊음, 행복, 슬픔, 탐험과 여행의 기쁨 등 젊은이들이 공감하고
																	꿈꾸는 것들을 포착한 그의 사진은 몽환적인 색상, 놓친 초점, 기울어진 구도로 하여금 열광적이면서
																	낭만적이고, 위태롭지만 자유로운 등의 형용사들을 자연스럽게 떠올리게 만든다. 사랑의 경험을 기억 그
																	이상으로 간직하고 싶다는 생각으로부터 시작된 그의 사진은 청춘의 한 시절에 겪는 수많은 장면들을
																	통해 영원한 것은 없을지라도 영원할 순간이 있음을 전한다. 그는 2017년 디뮤지엄에서 한국
																	관객들의 뜨거운 사랑을 받았던 《YOUTH: 청춘의 열병, 그 못다한 이야기》 전, 로마의 국립
																	로마 현대 미술관(MAXXI - National Museum of 21st Century Art)를
																	비롯해, LA, 런던, 이탈리아 지역의 미술관 및 갤러리의 개인전 및 그룹전에 참여하는 등 활발히
																	작업을 이어오고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">파올로
																	라엘리</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															신일숙 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330150650064001.jpg"
																	alt="신일숙" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">신일숙은 1984년
																	&lt;라이언의 왕녀&gt;로 데뷔한 후, 주어진 운명에 맞서 스스로 삶을 개척해 나가는 강인하고
																	주체적인 주인공을 등장시키며 독자적인 세계관을 구축했다. 이후 대본소 단행본, 잡지 만화를 거쳐
																	웹툰에 이르기까지 작가는 역사, 액션, SF 판타지, 신화, 로맨스 등 다양한 장르를 넘나들며
																	수많은 명작들을 선보여왔다. 특히 1986년부터 1995년까지 10여 년에 걸쳐 연재한
																	&lt;아르미안의 네 딸들&gt;은 방대한 역사와 신화적 배경에 작가의 상상력을 밀도 있게 결합해
																	당시 순정만화 열풍을 주도했던 장편 대작이다. 네 명의 왕녀들이 서사의 중심을 이루며 각자의 신념에
																	따라 운명과 사랑을 주도해나가는 줄거리는 완결된 지 25년이 지난 지금까지도 독자들에게 큰 울림을
																	주고 있다. 또한 1993년에 발표한 &lt;리니지&gt;는 ‘원 소스 멀티 유스(one
																	source multi-use)’ 대표 사례로, 1998년 국내 최초 ‘대규모 다중 사용자 온라인
																	롤 플레잉 게임(MMORPG)’으로 제작되어 현재까지 전 세계로 수출되고 있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">신일숙</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
												<li data-v-65d27eab=""><div data-v-0516949c=""
														data-v-65d27eab="">
														<strong data-v-0516949c="" class="instructor-name">
															델피 카르모나 <!---->
														</strong>
														<div data-v-0516949c="" class="instructor-area">
															<div data-v-0516949c="" class="img-area">
																<img data-v-2fed1a9a="" data-v-0516949c=""
																	src="https://cdn.daelimmuseum.org/Artist/Person/202203/20220330150627259001.jpg"
																	alt="델피 카르모나" style="">
															</div>
															<div data-v-0516949c="" class="info-area">
																<p data-v-0516949c="" class="txt">포토그래퍼이자 아트 디렉터,
																	콘텐츠 크리에이터로 활발한 활동을 이어나가고 있는 델피 카르모나는 빛과 색, 그리고 그림자로 구성한
																	미장센으로 내면의 다양한 감정을 표출한다. 아르헨티나의 부에노스아이레스에서 태어나고 자란 그녀는
																	햇살 가득한 도시를 닮은 다채로운 색감과 섬세한 장면 연출로 자신만의 작업 스타일을 만들었다.
																	작가는 모든 장면에 시각적 재미와 조형적 요소들을 가미하는데, 특히 자연 채광이 피사체를 투과하며
																	변화시키는 색감과 그림자에 감정을 대입시킨다. 그녀에게 그림자는 이미지를 완성하고 이야기를 전달하는
																	주된 요소로, 얼굴이 드러나지는 않지만 따사로운 빛과 색 그리고 우아한 실루엣으로 자기 자신을
																	감각적으로 표현해 낸 작업들로 주목 받았다. 작가는 전 세계 다수의 사진전에 참여했으며,
																	에르메스(Hermès), 아디다스(Adidas), 프라이탁(Freitag),
																	루인아트(Ruinart), 닥터마틴(Dr. Martens) 등 다양한 브랜드와 협업을 이어오고
																	있다.</p>
																<ul data-v-0516949c="" class="work-list"></ul>
																<div data-v-0516949c="" class="photo-list">
																	<ul data-v-0516949c=""></ul>
																</div>
																<strong data-v-0516949c="" class="instructor-name">델피
																	카르모나</strong>
																<!-- <div data-v-26e42198="" data-v-0516949c=""
																	class="btn-area">
																	<a data-v-26e42198="" href="javascript:;" class="">
																		자세히 보기 </a>
																</div> -->
															</div>
														</div>
													</div></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-v-080a389a="" id="program" class="sub-contents-area">
						<div data-v-6e774a1a="" data-v-080a389a=""
							class="affiliate-program-area">
							<div data-v-6e774a1a="" data-v-080a389a="" class="container">
								<div data-v-6e774a1a="" data-v-080a389a=""
									class="sub-title-area" id="info">
									<h3 data-v-6e774a1a="" data-v-080a389a="" class="tit-underline">
										전시연계 프로그램</h3>
									<div data-v-ea82c312="" data-v-6e774a1a=""
										class="slide-pagination-area" data-v-080a389a="" style = "display : none;">
										<button data-v-ea82c312="" type="button"
											class="btn-prev btn-program-prev swiper-button-disabled"
											tabindex="-1" role="button" aria-label="Previous slide"
											aria-disabled="true">prev</button>
										<div data-v-ea82c312=""
											class="page-program swiper-pagination-fraction">
											<span class="swiper-pagination-current">1</span> / <span
												class="swiper-pagination-total">5</span>
										</div>
										<button data-v-ea82c312="" type="button"
											class="btn-next btn-program-next" tabindex="0" role="button"
											aria-label="Next slide" aria-disabled="false">next</button>
									</div>
								</div>
								<div data-v-6e774a1a="" data-v-080a389a="" class="program-list">
									<div data-v-3c3ec2ba="" data-v-6e774a1a="" class="swiper-area"
										data-v-080a389a="">
										<div data-v-3c3ec2ba=""
											class="swiper-container swiper-container-initialized swiper-container-horizontal">
											<div class="swiper-wrapper"
												style="transform: translate3d(0px, 0px, 0px);">
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide swiper-slide-active"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202204/20220407205730369001.jpg"
														alt="키즈워크룸 : 애니메이터 프로젝트(개인)" style=""></a><strong
														data-v-3c3ec2ba="" class="title">키즈워크룸 : 애니메이터
														프로젝트(개인)</strong>
													<p data-v-3c3ec2ba="" class="contents">움직이는 그림을 만드는
														우리는, 키즈 애니메이터! 과학과 움직임의 원리가 더해진 무빙 프로젝터로 2D 애니메이션을 제작하는
														문제해결 중심 융·복합 교육</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide swiper-slide-next"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202204/20220407220003054001.jpg"
														alt="키즈워크룸 : 애니메이터 프로젝트(단체)" style=""></a><strong
														data-v-3c3ec2ba="" class="title">키즈워크룸 : 애니메이터
														프로젝트(단체)</strong>
													<p data-v-3c3ec2ba="" class="contents">움직이는 그림을 만드는
														우리는, 키즈 애니메이터! 과학과 움직임의 원리가 더해진 무빙 프로젝터로 2D 애니메이션을 제작하는
														문제해결 중심 융·복합 교육</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202203/20220309124726637001.png"
														alt="해피투게더(초등)" style=""></a><strong data-v-3c3ec2ba=""
														class="title">해피투게더(초등)</strong>
													<p data-v-3c3ec2ba="" class="contents">누구나, 차별없이 문화예술을
														경험 할 수 있도록 대림문화재단이 진행하는 문화소외 아동 대상 예술 교육 프로그램</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202204/20220422185944418001.jpg"
														alt="틴 랩 : 미술관 직업 탐.험(탐색하고 체험하기)" style=""></a><strong
														data-v-3c3ec2ba="" class="title">틴 랩 : 미술관 직업
														탐.험(탐색하고 체험하기)</strong>
													<p data-v-3c3ec2ba="" class="contents">전시 기획부터, 컨텐츠 개발,
														디자인, 운영까지, 미술관 직업을 체험한다! 미술관 업무를 탐구하는 진로체험+창작활동 시리즈</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202203/20220309132443524001.png"
														alt="해피투게더(중등)" style=""></a><strong data-v-3c3ec2ba=""
														class="title">해피투게더(중등)</strong>
													<p data-v-3c3ec2ba="" class="contents">누구나, 차별없이 문화예술을
														경험 할 수 있도록 대림문화재단이 진행하는 문화소외 청소년 대상 예술 교육 프로그램</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202203/20220309133822892001.png"
														alt="필드트립" style=""></a><strong data-v-3c3ec2ba=""
														class="title">필드트립</strong>
													<p data-v-3c3ec2ba="" class="contents">전문인의 시각에서 전시와
														미술관을 이해 하는, 대학 단체를 위한 특별한 야외 수업</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202203/20220309135048102001.png"
														alt="온라인 진로특강" style=""></a><strong data-v-3c3ec2ba=""
														class="title">온라인 진로특강</strong>
													<p data-v-3c3ec2ba="" class="contents">문화예술 분야 진로를 희망하는
														대학(원)생들을 위한 미술관 진로탐색 교육</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202205/20220502171310685001.png"
														alt="교사 워크숍(성동·광진구 교사 대상)" style=""></a><strong
														data-v-3c3ec2ba="" class="title">교사 워크숍(성동·광진구 교사
														대상)</strong>
													<p data-v-3c3ec2ba="" class="contents">지역 연계 일환으로
														성동·광진구 관내 교사 대상 교사 워크숍. 에듀케이터와 함께하는 특별한 전시 감상과 전시연계 교육 그리고
														디뮤지엄 방문 팁까지, 새로운 디뮤지엄과 교육 프로그램을 소개하는 워크숍</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202205/20220502173433719001.png"
														alt="교사 워크숍 (초·중·고등 교사)" style=""></a><strong
														data-v-3c3ec2ba="" class="title">교사 워크숍 (초·중·고등
														교사)</strong>
													<p data-v-3c3ec2ba="" class="contents">새로 이전한 D
														MUSEUM에서, 에듀케이터와 함께하는 특별한 전시 감상과 전시연계 교육 그리고 디뮤지엄 방문 팁까지,
														선생님들께 새로운 디뮤지엄과 교육 프로그램을 소개하는 워크숍</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202205/20220513184602627001.jpg"
														alt="정규 투어" style=""></a><strong data-v-3c3ec2ba=""
														class="title">정규 투어</strong>
													<p data-v-3c3ec2ba="" class="contents">《어쨌든,
														사랑:Romantic Days》 전시 관람객이면 누구나 참여할 수 있는 정규 투어</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202207/20220719195132463001.jpg"
														alt="여름방학 특별 프로그램 : ALL ABOUT PHOTO" style=""></a><strong
														data-v-3c3ec2ba="" class="title">여름방학 특별 프로그램 :
														ALL ABOUT PHOTO</strong>
													<p data-v-3c3ec2ba="" class="contents"></p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202208/20220818131514653001.jpg"
														alt="아티스트 아뜰리에 with 니나 콜치츠카이아" style=""></a><strong
														data-v-3c3ec2ba="" class="title">아티스트 아뜰리에 with
														니나 콜치츠카이아</strong>
													<p data-v-3c3ec2ba="" class="contents">작가와 함께 왼손으로 사랑하는
														사람을 그려보는 성인 대상 드로잉 워크숍</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202208/20220818131613764001.jpg"
														alt="아티스트 토크 with 니나 콜치츠카이아" style=""></a><strong
														data-v-3c3ec2ba="" class="title">아티스트 토크 with 니나
														콜치츠카이아</strong>
													<p data-v-3c3ec2ba="" class="contents">일상을 로맨틱하게 바라보는
														작가와의 캐주얼 토크</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba=""
														src="https://cdn.daelimmuseum.org/Program/Learn/List/C/202208/20220818132909870001.jpg"
														alt="스페셜 키즈워크룸 with 니나 콜치츠카이아" style=""></a><strong
														data-v-3c3ec2ba="" class="title">스페셜 키즈워크룸 with
														니나 콜치츠카이아</strong>
													<p data-v-3c3ec2ba="" class="contents">마음의 손으로 사랑 이야기를
														그리는 니나 콜치츠카이아의 《Left Hand Lovers》 시리즈처럼, 마음을 담아 왼손으로 사랑하는
														사람을 드로잉 해보는 어린이 워크숍</p>
												</div>
												<div data-v-3c3ec2ba=""
													class="slide-item normal-item swiper-slide"
													style="width: 406.667px; margin-right: 30px;">
													<a data-v-3c3ec2ba="" class="thumb"
														style="cursor: pointer;"><img data-v-2fed1a9a=""
														data-v-3c3ec2ba="" src="" alt="찾아가는 키즈워크룸 " style=""></a><strong
														data-v-3c3ec2ba="" class="title">찾아가는 키즈워크룸 </strong>
													<p data-v-3c3ec2ba="" class="contents"></p>
												</div>
											</div>
											<span class="swiper-notification" aria-live="assertive"
												aria-atomic="true"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</section>
			<!---->
			<!---->
		</div>
	</main>


	<!-- footer -->
<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
</body>
</html>