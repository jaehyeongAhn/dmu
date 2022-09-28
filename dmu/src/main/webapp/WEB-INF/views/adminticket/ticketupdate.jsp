<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.museum.dao.DmuTicketDAO" %>    
<%@ page import="com.museum.vo.DmuTicketVO" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  <!-- JSTL 태그 추가  --> 

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
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script>
	$(document).ready(function(){
		//새로운 파일선택하는 이벤트 
		$("input[type=file]").change(function(){
			if(window.FileReader){
				let fname = $(this)[0].files[0].name;
				$("#upload_file").text(fname);
			}
		});
	});
</script>

<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
</head>
<body>
<iframe src="http://localhost:9000/dmu/header.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
<form name="ticketlistform" action="ticketlist_write_check.do" method="post" enctype="multipart/form-data" >
	<main>
<div data-v-ec5a0c2c="" class="root-container">
<div data-v-ec5a0c2c="" class="content-wrapper">
<div data-v-ec5a0c2c="" class="body-wrapper">
<div data-v-25f87e60="" data-v-ec5a0c2c="">
<div data-v-25f87e60="" class="sub-contents-area">

<div data-v-6d324aa0="" data-v-25f87e60=""class="step-process-area">
	<ul data-v-6d324aa0="">
		<li data-v-6d324aa0="" class="complete">
			<span data-v-6d324aa0="" class="no">01</span>
			<span data-v-6d324aa0="" class="txt">ticket</span>
		</li>
		<li data-v-6d324aa0="" class="on">
			<span data-v-6d324aa0="" class="no">02</span>
			<span data-v-6d324aa0="" class="txt">ticket상세보기</span>
		</li>
		<li data-v-6d324aa0="" class="">
			<span data-v-6d324aa0="" class="no">03</span>
			<span data-v-6d324aa0="" class="txt">수정/삭제</span>
		</li>
	</ul>
</div>

<div data-v-25f87e60="" class="container">
	<div data-v-8ed31374="" data-v-25f87e60="" class="reservation-area">
<!---->
		<div data-v-8ed31374="" class="left">
			<div data-v-8ed31374="" class="img-ticket">
				<c:if test="${vo.dsfile != null }">
				<img data-v-2fed1a9a="" data-v-8ed31374="" src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }" style="">
				</c:if>
			</div>
			
			<div data-v-8ed31374="" class="title-ticket">
				<h2 data-v-8ed31374="" class="title"><input type="text" name="dtitle" id="dtitle" value="${vo.dtitle }"></h2>
					<span data-v-8ed31374="" class="explan"> </span>
			</div>
			
			<div data-v-8ed31374="" class="info-ticket">
				<ul data-v-8ed31374="">
					<li data-v-8ed31374="">
						<strong data-v-8ed31374="" class="title">장소</strong>
						<span data-v-8ed31374="" class="text">${ vo.dplace }</span>
					</li>
					
					<li data-v-8ed31374="" class="">
						<strong data-v-8ed31374="" class="title">전시기간/교육기간</strong>
						<span data-v-8ed31374="" class="text">${ vo.dstart } ~ ${ vo.dend }</span>
					</li>
					
					<li data-v-8ed31374="">
						<strong data-v-8ed31374="" class="title">운영시간/교육시간</strong>
						<span data-v-8ed31374="" class="text">${ vo.dtime }</span>
					</li>
					
					<li data-v-8ed31374="">
						<strong data-v-8ed31374="" class="title">대상</strong>
						<span data-v-8ed31374="" class="text">${ vo.dtarget }</span>
					</li>
					
					<li data-v-8ed31374="">
						<strong data-v-8ed31374="" class="title">교육횟수</strong>
						<span data-v-8ed31374="" class="text">${ vo.dnum }</span>
					</li>
					
					<li data-v-8ed31374="">
						<strong data-v-8ed31374="" class="title">정원 수</strong>
						<span data-v-8ed31374="" class="text">${ vo.dpersonnel }</span>
					</li>
					
					<li data-v-8ed31374="" class="">
						<strong data-v-8ed31374="" class="title">이용요금</strong>
						<p data-v-8ed31374="" class="price">${ vo.dprice } </p>
					</li>
				</ul>
			</div>
			
		<div data-v-8ed31374="" class="organ-ticket">
		<div data-v-8ed31374="" class="use-info-ticket">
			<strong data-v-8ed31374="" class="title">이용 정보</strong>
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
	
<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
		<a href="ticket_update.do?bid=${vo.did }"><button data-v-26e42198="" name ="btn25" id="btn25" type="button" class="secondary small">수정하기</button></a>
		<a href="ticket_delete.do?bid=${vo.did }"><button data-v-26e42198="" name ="btn25" id="btn25" type="button" class="secondary small">삭제하기</button></a>
		<a href="adminexhibition_list.do"><button data-v-26e42198="" name ="btn25" id="btn25" type="button" class="secondary small">리스트</button></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				</div>
			</main>
			
			<button class="goto-top">상단으로 이동</button>
	<!-- built files will be auto injected -->
	<footer>
		<!-- 0510 네이버 공통 js 추가 -->
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	</footer>

	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script>
	</form>		
	<iframe src="footer.do" width="100%" height="550px" scrolling="no" frameborder=0></iframe>

</body>
</html>