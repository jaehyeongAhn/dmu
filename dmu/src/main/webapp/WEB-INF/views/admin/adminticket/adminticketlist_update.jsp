<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 태그 추가  -->
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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/ticket.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function() {
		//새로운 파일선택하는 이벤트 
		$("input[type=file]").change(function() {
			if (window.FileReader) {
				let fname = $(this)[0].files[0].name;
				$("#upload_file").text(fname);
			}
		});
	});

	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>

<title>ADMIN | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<main>
		<div data-v-ec5a0c2c="" class="root-container">
			<div data-v-ec5a0c2c="" class="content-wrapper">
				<div data-v-ec5a0c2c="" class="body-wrapper">
					<div data-v-25f87e60="" data-v-ec5a0c2c="">
						<div data-v-25f87e60="" class="sub-contents-area">

							<form name="ticketUpdateForm"
								action="adminticket_update_check.do" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="did" value="${vo.did}"> <input
									type="hidden" name="dfile" value="${vo.dfile}"> <input
									type="hidden" name="dsfile" value="${vo.dsfile}">
								<div data-v-6d324aa0="" data-v-7b1f57c8=""
									class="step-process-area">
									<ul data-v-6d324aa0="">
										<li data-v-6d324aa0="" class="complete"><span
											data-v-6d324aa0="" class="no">01</span> <span
											data-v-6d324aa0="" class="txt">ticket</span></li>
										<li data-v-6d324aa0="" class="on"><span
											data-v-6d324aa0="" class="no">02</span> <span
											data-v-6d324aa0="" class="txt">ticket content</span></li>
										<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
											class="no">03</span> <span data-v-6d324aa0="" class="txt">수정/삭제</span>
										</li>
									</ul>
								</div>

								<div data-v-25f87e60="" class="container write">
									<div data-v-8ed31374="" data-v-25f87e60=""
										class="reservation-area">
										<!---->
										<div data-v-8ed31374="" class="left">

											<div data-v-8ed31374="" class="img-ticket write">
												<ul>
													<li><label>파일첨부</label> <input type="file"
														name="file1"> <!-- jstl의 if는 조건이 단 하나로 체크될때 사용, 조건이 여러개로 체크될 경우 choose/when -->
														<c:choose>
															<c:when test="${vo.dfile != null }">
																<!--if~else  -->
																<span id="upload_file">${vo.dfile}</span>
															</c:when>
															<c:otherwise>
																<span id="upload_file">선택된 파일 없음</span>
															</c:otherwise>
														</c:choose></li>
												</ul>
											</div>

											<div data-v-8ed31374="" class="title-ticket">
												<h2 data-v-8ed31374="" class="title">제목</h2>
												<input type="text" name="dtitle" id="dtitle"
													value="${vo.dtitle }"> <span data-v-8ed31374=""
													class="explan"> </span>
											</div>
											<!-- 		 	-->
											<!-- 	exhibition	 -->
											<!-- 		 	-->
											<c:if test="${vo.dcode eq 'exhibition'}">
												<div data-v-8ed31374="" class="info-ticket">
													<input type="hidden" name="dtitle2" value="${vo.dtitle2}">
													<input type="hidden" name="dpersonnel" value="${vo.dpersonnel}">
													<input type="hidden" name="dtarget" value="${vo.dtarget}">
													<input type="hidden" name="dnum" value="${vo.dnum}">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">장소</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dplace"
																id="dplace" value="${vo.dplace }"></span></li>
														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">전시기간</strong> <span
															data-v-8ed31374="" class="text"><input type="date"
																name="dstart" id="dstart" value="${vo.dstart }">
																~ <input type="date" name="dend" id="dend"
																value="${vo.dend }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">운영시간</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dtime"
																id="dtime" value="${vo.dtime }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">회차</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dentertime"
																id="dentertime" value="${vo.dentertime }"></span></li>
														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title must-do">이용요금</strong>
															<p data-v-8ed31374="" class="price">
																<input type="number" name="dprice" id="dprice"
																	maxlength="10" value="${vo.dprice }">
															</p></li>
													</ul>
												</div>
											</c:if>
											<!-- 		 	-->
											<!-- 	learn	 -->
											<!-- 		 	-->
											<!-- 		 	-->
											<c:if test="${vo.dcode eq 'learn'}">
												<div data-v-8ed31374="" class="info-ticket">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">부제목</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dtitle2"
																id="dtitle2" value="${vo.dtitle2 }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">장소</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dplace"
																id="dplace" value="${vo.dplace }"></span></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">교육기간</strong> <span
															data-v-8ed31374="" class="text"><input type="date"
																name="dstart" id="dstart" value="${vo.dstart }">
																~ <input type="date" name="dend" id="dend"
																value="${vo.dend }"></span></li>

														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">운영시간</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dtime"
																id="dtime" value="${vo.dtime }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">수업시간 </strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dentertime"
																id="dentertime" value="${vo.dentertime }"></span></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title must-do">이용요금</strong>
															<p data-v-8ed31374="" class="price">
																<input type="number" name="dprice" id="dprice"
																	maxlength="10" value="${vo.dprice }">
															</p></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title must-do">정원</strong> <span
															data-v-8ed31374="" class="text"><input
																type="number" name="dpersonnel" id="dpersonnel"
																maxlength="10" value="${ vo.dpersonnel }"
																oninput="maxLengthCheck(this)"></span></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">대상</strong> <span
															data-v-8ed31374="" class="text"><input type="text"
																name="dtarget" id="dtarget" value="${ vo.dtarget }"></span>
														</li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">이용횟수</strong> <span
															data-v-8ed31374="" class="text"><input
																type="number" name="dnum" id="dnum" maxlength="10"
																value="${ vo.dnum }" oninput="maxLengthCheck(this)"></span>
														</li>
													</ul>
												</div>
											</c:if>
											<!-- 	evnet	 -->
											<!-- 		 	-->
											<c:if test="${vo.dcode eq 'event'}">
												<div data-v-8ed31374="" class="info-ticket">
												<input type="hidden" name="dtime" value="${vo.dtime}">
												<input type="hidden" name="dpersonnel" value="${vo.dpersonnel}">
												<input type="hidden" name="dnum" value="${vo.dnum}">
													<ul data-v-8ed31374="">
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">부제목</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dtitle2"
																id="dtitle2" value="${vo.dtitle2 }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">장소</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dplace"
																id="dplace" value="${vo.dplace }"></span></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">전시기간</strong> <span
															data-v-8ed31374="" class="text"><input type="date"
																name="dstart" id="dstart" value="${vo.dstart }">
																~ <input type="date" name="dend" id="dend"
																value="${vo.dend }"></span></li>
														<li data-v-8ed31374=""><strong data-v-8ed31374=""
															class="title">회차</strong> <span data-v-8ed31374=""
															class="text"><input type="text" name="dentertime"
																id="dentertime" value="${vo.dentertime }"></span></li>
														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title must-do">이용요금</strong>
															<p data-v-8ed31374="" class="price">
																<input type="number" name="dprice" id="dprice"
																	maxlength="10" value="${vo.dprice }">
															</p></li>

														<li data-v-8ed31374="" class=""><strong
															data-v-8ed31374="" class="title">대상</strong> <span
															data-v-8ed31374="" class="text"><input type="text"
																name="dtarget" id="dtarget" value="${ vo.dtarget }"></span>
														</li>
														
													</ul>
												</div>
											</c:if>
											<strong data-v-8ed31374="" class="title">이용 정보</strong>
											<div data-v-8ed31374="" class="organ-ticket">
												<p data-v-8ed31374="" class="comment">
												<div data-v-8ed31374="" class="contents">
													<div class="editor-contents-area">
														<textarea name="dinformation">${vo.dinformation }</textarea>
														<p>
															<br>
														</p>
													</div>
												</div>
											</div>

											<div data-v-8ed31374="" class="use-info-ticket">
												<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
													<button data-v-26e42198="" name="btn25"
														id="btnTicketUpdate" type="button" class="secondary small">수정완료</button>
													<a href="adminexhibition_list.do"><button
															data-v-26e42198="" type="button" class="secondary small">리스트</button></a>
												</div>
											</div>
										</div>


									</div>
									<!---->
								</div>
								<!---->
								<!---->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>




	<!-- built files will be auto injected -->
	<!-- <footer>
		0510 네이버 공통 js 추가
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	</footer>

	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script> -->
	<iframe src="footer.do" width="100%" height="490px" scrolling="no"
		frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>

</body>
</html>