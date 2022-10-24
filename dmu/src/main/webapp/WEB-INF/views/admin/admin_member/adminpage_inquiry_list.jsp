<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/am-pagination_dmu.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/adminpage.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/adminpage_inquiry.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/admin_member.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/admin_inquiry.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){
	//답변하기 팝업창
	let height = $(".popup_admin_inquiry").height() - $(".popup_admin_inquiry_title").outerHeight() - $(".admin_inquiry_button_list").outerHeight();
	$(".popup_admin_inquiry_form").css("height", height);
});
</script>
<style>
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
	<!-- 사이드 메뉴 -->
	<div class = "main">
		<div class = "section">
			<div class = "container">
				<aside class="mypage">
					<div class="mypage-list">
						<a href="adminpage_main.do" class="mypage-main">
							<strong class="menu-title">ADMIN PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on">
									<a class="menu-title" href="#">ADMIN</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="adminpage_member_list.do">회원관리</a>
											</li>
											<c:if test="${sessionScope.member.mid == 'master'}">
											<li class="">
												<a class="" href="adminpage_admin_list.do">관리자승인</a>
											</li>
											</c:if>
											<li class="">
												<a class="" href="adminpage_reservation_list.do">예매관리</a>
											</li>
											<li class="">
												<a class="" href="adminpage_inquiry_list.do" style="color: black;font-size: 17.5px;font-weight: 700;">1대1 문의</a>
											</li>
										</ul>
									</div>
								</li>
								<li class="on">
									<a class="menu-title">CONTENT</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="adminexhibition_list.do">상품 리스트 작성</a>
											</li>
											<li class="">
												<a class="" href="admin_notice_list.do">공지사항 작성</a>
											</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</aside>

				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title admin-inquiry-title" style = "margin-bottom : 0;">
						<h2>회원관리</h2>
					</div>
					<div class = "admin-inquiry-search">
						<div class = "admin-inquiry-answer-no inquiry_on" data-type = "stand-by">답변 대기 중</div>
						<div class = "admin-inquiry-answer-yes" data-type = "finish">답변 완료</div>
					</div>
					
					
					<div class="myinfo">
						<div class="myinfo-box">
							<!-- <div class = "inquiry-info-list-no">
								<div class="no-result">
									<p>문의 사항이 없습니다.</p>
								</div>
							</div>
							<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
								총 <strong></strong>건
							</div>
							<div class = "inquiry-info-list">
									<ul style="list-style:none;">
										<li>
											<div class = "admin-inquiry-author">
												<img src="http://localhost:9000/dmu/resources/images/public.svg">
												<div style = "margin: 10px 0 0 0;">
													<span class = "author">작성자</span><span>tester</span>
												</div>
											</div>
											<div class = "admin-inquiry-info-list">
												<div>
													<div class = "admin-inquiry-category">
														<div>
															<span>미술관</span><span class = "category">대림미술관</span>
															<span>문의 유형</span><span class = "type">전시</span>
														</div>
														<div>
															<span>문의 등록일</span><span>2022.10.17</span>
														</div>
													</div>
													<div>
														<h2>제목제목제목제목제목제목제목제목제목</h2>
													</div>
													<div class = "admin-inquiry-date">
													</div>
												</div>
											</div>
											<button type = "button" class = "admin-inquiry-answer">
												<img src = "http://localhost:9000/dmu/resources/images/airplane.png">
												<div>답변 보내기</div>
												<hr class = "back_hr1">
												<hr class = "back_hr2">
												<hr class = "back_hr3">
											</button>
										</li>
										<li>
											<div class = "admin-inquiry-author">
												<img src="http://localhost:9000/dmu/resources/images/public.svg">
												<div style = "margin: 10px 0 0 0;">
													<span class = "author">작성자</span><span>tester</span>
												</div>
											</div>
											<div class = "admin-inquiry-info-list">
												<div>
													<div class = "admin-inquiry-category">
														<div>
															<span>미술관</span><span class = "category">대림미술관</span>
															<span>문의 유형</span><span class = "type">전시</span>
														</div>
														<div>
															<span>문의 등록일</span><span>2022.10.17</span>
														</div>
													</div>
													<div>
														<h2>제목제목제목제목제목제목제목제목제목</h2>
													</div>
													<div class = "admin-inquiry-date">
													</div>
												</div>
											</div>
											<button type = "button" class = "admin-inquiry-answer">
												<img src = "http://localhost:9000/dmu/resources/images/airplane.png">
												<div>답변 보내기</div>
												<hr class = "back_hr1">
												<hr class = "back_hr2">
												<hr class = "back_hr3">
											</button>
										</li>
										<li>
											<div class = "admin-inquiry-author">
												<img src="http://localhost:9000/dmu/resources/images/public.svg">
												<div style = "margin: 10px 0 0 0;">
													<span class = "author">작성자</span><span>tester</span>
												</div>
											</div>
											<div class = "admin-inquiry-info-list">
												<div>
													<div class = "admin-inquiry-category">
														<div>
															<span>미술관</span><span class = "category">대림미술관</span>
															<span>문의 유형</span><span class = "type">전시</span>
														</div>
														<div>
															<span>문의 등록일</span><span>2022.10.17</span>
														</div>
													</div>
													<div>
														<h2>제목제목제목제목제목제목제목제목제목</h2>
													</div>
													<div class = "admin-inquiry-date">
													</div>
												</div>
											</div>
											<button type = "button" class = "admin-inquiry-answer-ok">
												<div>답변 완료</div>
											</button>
										</li>
									</ul>
								</div> 
								<div class="pagination-area" id="ampaginationsm" style="text-align:center;">-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

	<div class = "background_admin_inquiry">
		<div class = "window_admin_inquiry">
			<div class = "popup_admin_inquiry">
				<div class = "popup_admin_inquiry_title">
					<p id = "popup_admin_inquiry_info">답변 작성</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div>
					<div class = "popup_admin_inquiry_form">
						<div class = "popup_admin_inquiry_content">
							<div class = "admin_inquiry_answer">
								<p>문의 내역</p>
							</div>
							<div class = "admin_category_list">
								<span class = "category first">미술관<span class = "second"></span></span>
								<span class = "first">문의유형<span class = "second"></span></span>
							</div>
							<div class = "admin_inquiry_write_date">
								<p>등록일자<span style = "color : black; margin-left : 10px;"></span></p>
								<div class = "popup-admin-inquiry-author">
									<img src="http://localhost:9000/dmu/resources/images/public.svg">
									<div>
										<span class = "popup_author">작성자</span><span></span>
									</div>
								</div>
							</div>
							<div class = "admin_inquiry_write_content">
								<p></p>
								<div></div>
							</div>
						</div>
						<div class = "hr-text-line"></div>
						<!-- 답변 작성란 -->
						<div>
							<div class = "popup_admin_inquiry_answer_title">
								<p>답변 작성</p>
							</div>
							<div class = "popup_admin_inquiry_answer_content" style = "width: 100%;">
								<textarea placeholder = "답변을 입력해주세요." name = "inquiry_response" class = "inquiry_response"></textarea>
								<div style = "display : none;">
									<img src = "http://localhost:9000/dmu/resources/images/warning.png">
									<span>답변을 입력해주세요.</span>
								</div>
							</div>
							<div class = "popup_admin_inquiry_response_check">
								<input type = "checkbox" class = "inquiry_response_check" id = "inquiry_check">
								<label for = "inquiry_check">위의 내용으로 답변을 전송하겠습니다.</label>
							</div>
						</div>
					</div>
					<div class = "admin_inquiry_button_list">
						<button type = "button" class = "admin_inquiry_detail_close">닫기</button>
						<button type = "button" class = "admin_inquiry_detail_ok" disabled>전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 전송 완료 -->
	<div class = "background_inquiry_result">
		<div class = "window_inquiry_result">
			<div class = "popup_inquiry_result">
				<div>답변이 완료되었습니다.</div>
				<button type = "button" class = "inquiry_result_success">확인</button>
			</div>
		</div>
	</div>
</body>
</html>