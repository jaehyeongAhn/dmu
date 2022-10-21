<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification" content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<meta name="format-detection" content="telephone=no">	
<link rel="icon" href="/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/exhibition_page.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/tag_page.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
 
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body class="">
	<!-- header  -->
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>

<main>
	<div data-v-97ddc3ec="">
		<section data-v-97ddc3ec="" class="sub-contents-wrap">
			<div data-v-0d03d759="" data-v-97ddc3ec="" class="sub-top-area current">
				<div data-v-0d03d759="" class="container">
					<h2 data-v-0d03d759=""> 현재 전시 </h2>
						<nav data-v-0d03d759="">
							<ul data-v-0d03d759="">
								<li data-v-0d03d759="" style="cursor: pointer;"> HOME </li>
								<li data-v-0d03d759=""> EXHIBITION </li>
								<li data-v-0d03d759=""> 현재 전시 </li>
					<!---->
							</ul>
						</nav>
				</div>
			</div>
<div data-v-080a389a="" data-v-97ddc3ec="">
	<div data-v-080a389a="" class="snb-area">
		<ul data-v-080a389a="" class="snb">
			<li data-v-080a389a="" class="on">
				<a data-v-080a389a="" href="exhibition_page.do" role="button" style="cursor: pointer;">전체</a>
			</li>
			<li data-v-080a389a="" class="">
				<a data-v-080a389a="" href="exhibition_page1.do" role="button" style="cursor: pointer;">디뮤지엄</a>
			</li>
			<li data-v-080a389a="" class="">
				<a data-v-080a389a=""href="exhibition_page2.do" role="button" style="cursor: pointer;">대림미술관</a>
			</li>
		</ul>
	</div>
	
<div data-v-080a389a="" class="sub-contents-area"></div>
<div data-v-080a389a="" class="sub-contents-area"><!----></div>
<div data-v-080a389a="" class="sub-contents-area"><!----></div>

</div>

<div data-v-97ddc3ec="" class="sub-contents-area" style="min-height: 400px;">
	<div data-v-97ddc3ec="" class="container">
		<div data-v-97ddc3ec="" class="current-list">
			<ul data-v-97ddc3ec="">
				<li data-v-97ddc3ec="">
					<div data-v-97ddc3ec="" class="box">
						<div data-v-97ddc3ec="" class="thumb">
							<img data-v-2fed1a9a="" data-v-97ddc3ec="" src="http://localhost:9000/dmu/resources/images/exhibition1.png" alt="어쨌든, 사랑" class="pc" style="">
						</div>
	
<div data-v-97ddc3ec="" class="info">
	<span data-v-97ddc3ec="" class="place"> ${vo.dplace } </span>
	<span data-v-97ddc3ec="" class="title">Romantic Days</span>
	<span data-v-97ddc3ec="" class="subtitle">${vo.dtitle }</span>
	<p data-v-97ddc3ec="" class="explain"></p>
		
	<div data-v-97ddc3ec="" class="term-share">
			<span data-v-97ddc3ec="" class="term"> ${vo.dstart } ~ ${vo.dend }</span>
		<div data-v-26e42198="" data-v-97ddc3ec="" class="btn-area">
			<button data-v-26e42198="" id="btn2965" type="button" class="btn-share"> 공유하기 </button>
		</div>
	</div>

	<div data-v-97ddc3ec="" class="btn-exhibition-current">
		<div data-v-26e42198="" data-v-97ddc3ec="" class="btn-area">
			<a href="exhibition_page_det.do"><button data-v-26e42198="" id="btn2966" type="button" class="secondary"> 자세히보기 </button></a>
		</div> 
		<div data-v-26e42198="" data-v-97ddc3ec="" class="btn-area">
			<a href="exhibition.do?did=${vo.did }"><button data-v-26e42198="" id="btn2967" type="button" class="primary"> 예매하기 </button></a>
		</div>
	</div>
</div>

						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section><!---->
</div>
</main>
	
	<!-- footer -->
<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
</body>
</html>