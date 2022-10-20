<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<!-- Header Include -->
<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
<div style="width:100%; height:17vh; color:transparent">헤더</div>
<div data-v-ec5a0c2c="" class="root-container">
<div data-v-ec5a0c2c="" class="content-wrapper">
<div data-v-ec5a0c2c="" class="body-wrapper">
<div data-v-25f87e60="" data-v-ec5a0c2c="">
<div data-v-25f87e60="" class="sub-contents-area">
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<form name="ticketlistform" action="adminticketlist_write_check.do" method="post" enctype="multipart/form-data" >

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

<div data-v-25f87e60="" class="container write">
<div data-v-8ed31374="" data-v-25f87e60="" class="reservation-area">
	<!---->
<div data-v-8ed31374="" class="left">

	<div data-v-8ed31374="" class="img-ticket write">
	<ul>
		<li>
			<label style="margin-right: 20px;">파일첨부</label>
			<input type="file" name="file1" id="file_list">
			</li>
		</ul>
	</div>
	
		
	<div data-v-8ed31374="" class="title-ticket">
		<h2 data-v-8ed31374="" class="title">제목</h2>
			<input type="text" name="dtitle" id="dtitle" >
			<span data-v-8ed31374="" class="explan"> </span>
	</div>
	
	<div data-v-8ed31374="" class="info-ticket">

   <div style = "margin-bottom: 20px;"><strong style="color:red;">*</strong>는 필수사항입니다.</div>
      <ul data-v-8ed31374="">
         <li data-v-8ed31374="">
            <strong data-v-8ed31374="" class="title">코드</strong>
            <select data-v-8ed31374="" name = "dcode" id = "dcode">
                                    <option value = "default">선택하세요</option>
                                    <option value = "exhibition">exhibition</option>
                                    <option value = "learn">learn</option>
                                    <option value = "event">event</option>
                                 </select>
         </li>
         <li data-v-8ed31374="">
            <strong data-v-8ed31374="" class="title">부제목</strong>
            <span data-v-8ed31374="" class="text"><input type="text" name="dtitle2" id="dtitle2" ></span>
         </li>
         <li data-v-8ed31374="">
            <strong data-v-8ed31374="" class="title">장소</strong>
            <select data-v-8ed31374="" name = "dplace" id = "dplace">
                                    <option value = "default">선택하세요</option>
                                    <option value = "디뮤지엄">디뮤지엄 </option>
                                    <option value = "대림미술관">대림미술관 </option>
                                    <option value = "구슬모아당구장">구슬모아당구장 </option>
                                 </select>
         </li>
         <li data-v-8ed31374="">
            <strong data-v-8ed31374="" class="title">회차/수업시간</strong>
            <span data-v-8ed31374="" class="text"><input type="text" name="dentertime" id="dentertime"></span>
         </li>
         
         <li data-v-8ed31374="" class="">
            <strong data-v-8ed31374="" class="title">전시기간</strong>
            <span data-v-8ed31374="" class="text"><input type="date" name="dstart" id="dstart" > ~ <input type="date" name="dend" id="dend" ></span>
         </li>
         
         
         <li data-v-8ed31374="" class=""><strong data-v-8ed31374="" class="title must-do">이용요금</strong>
            <p data-v-8ed31374="" class="price"><input type="text" name="dprice" id="dprice" ></p>
         </li>



         
         
         <li data-v-8ed31374="" class="">
            <strong data-v-8ed31374="" class="title must-do">정원</strong>
            <span data-v-8ed31374="" class="text"><input type="text" name="dpersonnel" id="dpersonnel"></span>
         </li>
         
         <li data-v-8ed31374="" class="">
            <strong data-v-8ed31374="" class="title">대상</strong>
            <select data-v-8ed31374="" name = "dtarget" id = "dtarget">
                                    <option value = "default">선택하세요</option>
                                    <option value = "유아">유아</option>
                                    <option value = "어린이">어린이</option>
                                    <option value = "청소년">청소년</option>
                                    <option value = "대학생">대학생</option>
                                    <option value = "성인">성인</option>
                                    <option value = "교사">교사</option>
                                    <option value = "전시해설">전시해설</option>
                                 </select>
         </li>
         
         <li data-v-8ed31374="" class="">
            <strong data-v-8ed31374="" class="title must-do">교육횟수</strong>
            <span data-v-8ed31374="" class="text"><input type="text" name="dnum" id="dnum" ></span>
         </li>
         <li data-v-8ed31374="">
            <strong data-v-8ed31374="" class="title">운영시간/교육시간</strong>
            <textarea name="dtime" class="time_text"></textarea>
         </li>
      </ul>
   </div>
		<strong data-v-8ed31374="" class="title" id="info">이용 정보</strong>
			<div data-v-8ed31374="" class="organ-ticket">
				<p data-v-8ed31374="" class="comment">
					<div data-v-8ed31374="" class="contents">
						<div class="editor-contents-area">
						<textarea name="dinformation"></textarea>
						<p>
							<br>
						</p>
						</div>
					</div>
			</div>
			
<div data-v-8ed31374="" class="use-info-ticket">
	<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
				<button data-v-26e42198="" name ="btn25" id="btn_exhibition_Write" type="button" class="secondary small">작성완료</button>
				<a href="adminexhibition_list.do"><button data-v-26e42198=""  type="button" class="secondary small">리스트</button></a>
	</div>
</div>
</div>
											
										
											</div>
											<!---->
										</div>	
		</form>
			
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- footer Include -->
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
</body>
</html>