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
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/admin_member.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){

	//페이징 리스트 출력
	function page(dbCount, rpage, pageSize){
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: dbCount,	// total rows	
		    page: rpage,		// initial page		
		    pageSize: pageSize,	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
	}
	
	//답변하기 팝업창
	let height = $(".popup_admin_inquiry").height() - $(".popup_admin_inquiry_title").outerHeight() - $(".admin_inquiry_button_list").outerHeight();
	$(".popup_admin_inquiry_form").css("height", height);
	
	function inquiry_popup_set(){
		$(".background_admin_inquiry").addClass("show");
		$(".window_admin_inquiry").addClass("show");
		$(".admin_inquiry_detail_close").click(function(){
			$(".background_admin_inquiry").removeClass("show");
			$(".window_admin_inquiry").removeClass("show");
		});
	}
	
	
	//탭 메뉴
	$(".admin-inquiry-search div").click(function(){
		$(".admin-inquiry-search div").removeClass("inquiry_on");
		$(this).addClass("inquiry_on");
		inquiry_ajax(1);
	});
	
	//list ajax
	
	inquiry_ajax(1);
	function inquiry_ajax(rpage){
		$.ajax({
			type : "post",
			data : {
				rpage : rpage,
				answerType : $(".inquiry_on").attr("data-type")
			},
			url : "adminpage_inquiry_list_ajax.do",
			success : function(result){
				let data = JSON.parse(result);
				
				let output = "";
				//결과 값이 없을 경우
				if(data.list.length == 0){
					output += "<div class = 'inquiry-info-list-no'>";
					output += "<div class='no-result'>";
					output += "<p>문의 사항이 없습니다.</p></div></div>";
				}else{
					//결과 값이 있을 경우
					output += "<div data-v-1b9c8af9='' data-v-080a389a='' class='search-result'>";
					output += "총 <strong>" + data.dbCount + "</strong>건";
					output += "</div>";
					output += "<div class = 'inquiry-info-list'>";
				
					output += "<ul style='list-style:none;' class = 'inquiry_list_ajax'>";
					for(dataset of data.list) {
						output += "<li>";
						output += "<div class = 'admin-inquiry-author'>";
						output += "<img src='http://localhost:9000/dmu/resources/images/public.svg'>";
						output += "<div style = 'margin: 10px 0 0 0;'>"
						output += "<span class = 'author'>작성자</span><span>" + dataset.mid + "</span>";
						output += "</div></div>";
						output += "<div class = 'admin-inquiry-info-list'>";
						output += "<div>";
						output += "<div class = 'admin-inquiry-category'>";
						output += "<div><span>미술관</span><span class = 'category'>" + dataset.iqcategory + "</span>";
						output += "<span>문의 유형</span><span class = 'type'>" + dataset.iqtype + "</span></div>";
						output += "<div><span>문의 등록일</span><span>" + dataset.iqdate +"</span></div></div>";
						output += "<div><h2>" + dataset.iqtitle + "</h2></div>";
						output += "</div></div>";
						
						if(dataset.iqanswer == 'n') {
							output += "<button type = 'button' class = 'admin-inquiry-answer'>";
							output += "<img src = 'http://localhost:9000/dmu/resources/images/airplane.png'>";
							output += "<div>답변 보내기</div><hr class = 'back_hr1'><hr class = 'back_hr2'><hr class = 'back_hr3'>";
							output += "</button>";
							output += "</li>";
						}else{
							output += "<button type = 'button' class = 'admin-inquiry-answer-ok'>";
							output += "<div>답변 완료</div></button>";
						}
					}
					output += "</ul></div>";
					output += "<div id='ampaginationsm' style='text-align:center;'></div>";
				}
				
				$(".myinfo-box div.inquiry-info-list-no").remove();
				$(".myinfo-box div.search-result").remove();
				$(".inquiry_list_ajax").remove();
				$("#ampaginationsm").remove();
				$(".myinfo-box").append(output);
			
				//문의사항 상세보기 및 답변 팝업창
				$(".admin-inquiry-answer").click(function(){
					inquiry_popup_set();
				});
				
				if(data.list.length != 0){
					//페이징 처리
					page(data.dbCount, data.rpage, data.pageSize);
					
					//페이징 번호 클릭 시 이벤트 처리
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
						    jQuery('.showlabelsm').text('The selected page no: '+e.page);;
							inquiry_ajax(e.page);      
				    });
				}
			}
		});
	}
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
											<li class="">
												<a class="" href="adminpage_admin_list.do">관리자승인</a>
											</li>
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

				<style>
					.inquiry-info-list-no {
						text-align: center;
					    padding: 150px 0 175px 0;
					    font-size: 20px;
					    font-weight: 400;
					    border-bottom: 0.5px solid #afafaf;
					}
					.admin-inquiry-title::after {
						content: "" !important;
					    display: block !important;
					    background: white !important;
					    height: 0 !important;
					}
					div.admin-inquiry-search {
					    display: flex;
					    justify-content: space-between;
					    height: 50px;
					    align-items: center;
					    font-size : 17px;
					    letter-spacing: -0.05rem;
					    margin-bottom : 25px;
					}
					div.admin-inquiry-answer-no {
						display : flex;
						text-align : center;
						border : 0.5px solid #ddd;
						flex-grow : 1;
						height : 100%;
						align-items : center;
						justify-content : center;
						color : #999;
						cursor : pointer;
					}
					div.admin-inquiry-answer-yes {
						display : flex;
						text-align : center;
						border : 0.5px solid #ddd;
						flex-grow : 1;
						height : 100%;
						align-items : center;
						justify-content : center;
						color : #999;
						cursor : pointer;
					}
					div.inquiry_on {
						background : black;
						color : white;
						border : 0.5px solid black;
					}
					div.inquiry-info-list li {
						display : flex;
						/* justify-content : space-between; */
						margin: 30px 20px;
					}
					div.admin-inquiry-author {
						width: 150px;
						display : flex;
						flex-direction : column;
						align-items : center;
						justify-content : center;
					}
					div.admin-inquiry-author span.author {
						font-weight : 600;
					}
					div.admin-inquiry-author span.author::after {
					    content: "|";
					    color: #767676;
					    margin: 0 5px;
					    font-weight : 400;
					}
					div.admin-inquiry-info-list {    
						clip-path: polygon(3% 0%, 100% 0%, 100% 100%, 3% 100%, 3% 65%, 0% 50%, 3% 32%);
					    background: #f5f5f5;
					    padding: 20px 20px 20px 50px;
					    width : 66%;
					}
					div.admin-inquiry-info-list span {
						/* font-size : 14px; */
					}
					button.admin-inquiry-answer {
						width: 150px;
					    display: flex;
					    align-items: center;
					    justify-content: center;
					    background: #c7c7c7;
					    color: white;
					    font-size: 17px;
					    flex-direction: column;
					    border : none;
					    cursor : pointer;
					    transition : all 0.3s;
					    overflow: hidden;
					    position : relative;
					}
					button.admin-inquiry-answer:hover {
						background : black;
						color : white;
					}
					button.admin-inquiry-answer img {
					    width: 40px;
					    height: 40px;
					    filter: invert(0.5);
					    margin: 5px 0;
					    transition : all 0.3s;
					}
					button.admin-inquiry-answer:hover img {
						filter : invert(1);
						transform : rotate(45deg);
						animation : airplane 2s 0s infinite alternate;
					}
					button.admin-inquiry-answer div {
						color : #898989;
					}
					button.admin-inquiry-answer:hover div {
						color : white;
					}
					@keyframes airplane {
					  0%{transform : rotate(45deg) translate(0, 0);}
					  25%{transform : rotate(45deg) translate(5px, -5px);}
					  50%{transform : rotate(55deg) translate(0, 0);}
					  45%{transform : rotate(55deg) translate(-5px, 5px);}
					  100%{transform : rotate(45deg) translate(0, 0);}
					}
					hr.back_hr1, hr.back_hr2, hr.back_hr3 {
					    position: absolute;
					    border: 0.5px solid #b0b0b0d4;
					}
					hr.back_hr1 {
					    width: 30px;
					    transform: translateX(100px);
					    top: 20%;
					}
					button.admin-inquiry-answer:hover hr.back_hr1 {
					    animation : back1 2s 0s infinite normal;
					}
					hr.back_hr2 {
					 	width : 40px;
					    transform: translateX(100px);
					    top: 53%;
					}
					button.admin-inquiry-answer:hover hr.back_hr2 {
						animation : back1 2s 0.7s infinite normal;
					} 
					hr.back_hr3 {
					    width: 10px;
					    transform: translateX(100px);
					    top : 40%;
					}
					button.admin-inquiry-answer:hover hr.back_hr3 {
						animation : back1 2s 1.2s infinite normal;
					}
					@keyframes back1 {
						0%{rigth : transform: translateX(100px);}
						100%{transform: translateX(-100px); border : 0.5px dotted #b0b0b0d4; width : 0px;}
					}
					div.admin-inquiry-author img {
						width : 40px;
						height : 40px;
						border : 0.5px solid #ddd;
						border-radius : 50%;
						filter : opacity(0.5);
						padding: 10px;
					}
					div.admin-inquiry-date {
						margin : 5px 0;
					}
					div.admin-inquiry-date span:first-child {
						font-weight : 600;
					}
					div.admin-inquiry-category {
						margin : 5px 0 15px 0;
						display: flex;
    					justify-content: space-between;
					}
					div.admin-inquiry-category span:nth-child(odd){
						font-weight : 600;
						margin-right : 10px;
					}
					div.admin-inquiry-date span:first-child::after,
					div.admin-inquiry-category span.category::after {
					    content: "|";
					    color: #767676;
					    margin: 0 10px;
					    font-weight : 400;
					}
					
					button.admin_inquiry_answer_btn {
					    background: black;
					    color: white;
					    padding: 5px 20px;
					    font-size: 16px;
					    margin-top: 10px;
					    border : 0.5px solid black;
					    cursor : pointer;
					}
					button.admin-inquiry-answer-ok {
					    width: 150px;
					    display: flex;
					    align-items: center;
					    justify-content: center;
					    background: black;
					    color: white;
					    font-size: 17px;
					    flex-direction: column;
					    border: none;
					    transition: all 0.3s;
					    overflow: hidden;
					}
				</style>
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
	
	<style>
		div.background_admin_inquiry {
			position : fixed;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
			background : rgba(0, 0, 0, 0.7);
			opacity : 0;
			z-index : -1;
		}
		div.window_admin_inquiry {
			position : relative;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
		}
		div.popup_admin_inquiry {
			position : absolute;
			top : 50%;
			left : 50%;
			transform : translate(-50%, -30%);
			width : 500px;
			height : 70vh;
			background : white;
			overflow : hidden;
			z-index : -1;
		}
		div.background_admin_inquiry.show {
			opacity : 1;
			z-index : 10;
			transition : all 0.3s;
		}
		
		div.background_admin_inquiry.show div.popup_admin_inquiry {
			transform : translate(-50%, -50%);
			z-index : 10;
			transition : all 0.3s;
		}
		
		div.popup_admin_inquiry_title {
		    padding: 10px 16px;
		    background: black;
		    color: white;
		    font-size: 17px;
		    letter-spacing: -0.08rem;
		}
		div.popup_admin_inquiry_form {
			overflow: auto;
		    padding: 26px;
		    box-sizing: border-box;
		}
		div.popup_admin_inquiry_form div.admin_inquiry_answer,
		div.popup_admin_inquiry_form div.popup_admin_inquiry_answer_title {
			display: flex;
		    align-items: center;
		    font-size: 20px;
		    font-weight: 700;
		    letter-spacing: -0.08rem;
		    margin-bottom: 20px;
		}
		div.popup_admin_inquiry_form div.admin_inquiry_answer::before {
			content: "";
		    width: 20px;
		    height: 20px;
		    display: inline-block;
		    margin-right: 10px;
		    background-image: url("http://localhost:9000/dmu/resources/images/inquiry.png");
		    background-repeat: no-repeat;
		    background-size: contain;
		    background-position-x: 50%;
		    background-position-y: 50%;
		}
		div.popup_admin_inquiry_answer_title::before {
			content: "";
		    width: 20px;
		    height: 20px;
		    display: inline-block;
		    margin-right: 10px;
		    background-image: url("http://localhost:9000/dmu/resources/images/review.svg");
		    background-repeat: no-repeat;
		    background-size: contain;
		    background-position-x: 50%;
		    background-position-y: 50%;
		}
		div.admin_category_list {
			margin: 10px 0;
		}
		div.admin_category_list span.first {
		    color: #9f9d9d;
		}
		div.admin_category_list span.second {
		    color: black;
    		margin-left: 15px;
		}
		div.admin_category_list span.category::after {
		    content: "|";
		    font-size: 14px;
		    margin: 0 10px;
		}
		div.admin_inquiry_write_date p {
		    color: #9f9d9d;
		}
		
		div.admin_inquiry_button_list {
		    width: 100%;
		    height: 60px;
		    display: flex;
		    justify-content: center;
		    box-shadow: 0px -10px 14px rgb(0 0 0 / 10%);
		    position: absolute;
		    bottom: 0;
		    background: white;
		}
		div.admin_inquiry_button_list button.admin_inquiry_detail_close {
			border: 0.5px solid black;
		    background: black;
		    color: white;
		    font-size: 15px;
		    width: 120px;
		    margin: 5px;
		    letter-spacing: -0.08rem;
		    cursor: pointer;
		}
		div.admin_inquiry_button_list button.admin_inquiry_detail_ok {
			border : 0.5px solid black;
			background : white;
		    font-size: 15px;
		    width: 120px;
		    margin: 5px;
		    letter-spacing: -0.08rem;
		    cursor: pointer;
		}
		div.admin_inquiry_write_content p {
			font-size: 20px;
		    margin: 20px 0;
		    font-weight: 700;
		}
		div.admin_inquiry_write_content div {
		    border: 0.5px solid #dbdbdb;
		    padding: 15px;
		    line-height: 22px;
		}
		div.hr-text-line {
			margin: 25px auto;
		    width: 95%;
		    height: 0px;
		    border: 0.5px dashed #d1d1d1;
		}
		div.popup_admin_inquiry_answer_content textarea {
			resize: none;
		    border: 0.5px solid #cdcdcd;
		    padding: 16px;
		    width: inherit;
		    box-sizing: border-box;
		    font-size: 17px;
		    height: 400px;
		}
	</style>
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
								<span class = "category first">미술관<span class = "second">대림미술관</span></span>
								<span class = "first">문의유형<span class = "second">교육 · 문화 프로그램</span></span>
							</div>
							<div class = "admin_inquiry_write_date">
								<p>등록일자<span style = "color : black; margin-left : 10px;">2022-10-12</span></p>
							</div>
							<div class = "admin_inquiry_write_content">
								<p>디뮤지엄의 정확한 위치는 어디인가요?</p>
								<div>디뮤지엄의 정확한 위치를 알고 싶습니다.</div>
							</div>
						</div>
						<div class = "hr-text-line"></div>
						<!-- 답변 작성란 -->
						<div>
							<div class = "popup_admin_inquiry_answer_title">
								<p>답변 작성</p>
							</div>
							<div class = "popup_admin_inquiry_answer_content" style = "width: 100%;">
								<textarea placeholder = "답변을 입력해주세요."></textarea>
							</div>
						</div>
					</div>
					<div class = "admin_inquiry_button_list">
						<button type = "button" class = "admin_inquiry_detail_close">닫기</button>
						<button type = "button" class = "admin_inquiry_detail_ok">전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>