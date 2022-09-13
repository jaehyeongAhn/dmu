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
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/notice.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/admin.js"></script>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0></iframe>
	<main>
		<section class="sub-contents-wrap">
			<div data-v-0d03d759="" class="sub-top-area notice">
				<div data-v-0d03d759="" class="container">
					<h2 data-v-0d03d759="">공지사항</h2>
					<nav data-v-0d03d759="">
						<ul data-v-0d03d759="">
							<li data-v-0d03d759="" style="cursor: pointer;">HOME</li>
							<!---->
							<li data-v-0d03d759="">공지사항</li>
							<!---->
						</ul>
					</nav>
				</div>
			</div>
			<div class="sub-contents-area">
				<div class="container">
					<div class="notice-view-area">
						<div class="base-info-area">
							<span class="category">${vo.ncategory}</span>
							<div class="title-area">
								<strong class="title">${vo.ntitle}</strong>
								<span class="date">${vo.ndate}</span>
							</div>
						</div>
						<div class="notice-content">
							<p style="line-height: 1.5">
								<font color="#666666">${vo.ncontent}</font>
							</p>
						</div>
						<!---->
						<div class="list-bottom-area">
<!-- 							<ul>
								<li class="next"><strong>다음글</strong><a
									href="/noticeDetail/9" class=""> 신규 멤버십 &lt;D GREW&gt; 런칭 및
										기존 멤버십 안내 </a></li>
							</ul> -->
						</div>
					</div>
					<div class="btn-bottom-area">
						<div data-v-26e42198="" class="btn-area">
						<a href="admin_notice_update.do?nid=${vo.nid}">
							<button data-v-26e42198="" id="btn62" type="button"
								class="secondary">수정하기</button></a>
						<a href="admin_notice_delete.do?nid=${vo.nid}">
							<button data-v-26e42198="" id="btn62" type="button"
								class="secondary">삭제하기</button></a>
						<a href="admin_notice_list.do">
							<button data-v-26e42198="" id="btn62" type="button"
								class="secondary">목록</button></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>