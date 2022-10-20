<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/jquery-ui.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/am-pagination_dmu.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(function(){

		//페이징 리스트 출력
			var pager = jQuery('#ampaginationsm').pagination({
			
			    maxSize: 7,	    		// max page size
			    totals: '${dbCount}',	// total rows	
			    page: '${rpage}',		// initial page		
			    pageSize: '${pageSize}',	// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});

			//페이징 번호 클릭 시 이벤트 처리
			jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
				   jQuery('.showlabelsm').text('The selected page no: '+e.page);
		           $(location).attr('href', "http://localhost:9000/dmu/mypage_inquiry.do?rpage="+e.page);         
		    });
		
		let height_wirte = $(".popup_inquire").height() - $(".popup_inquire_title").outerHeight() - $(".inquire_button_list").outerHeight();
		$(".popup_inquire_write").css("height", height_wirte);
		

		//문의 사항 등록 안내
		let inquiry_write_result = "${inquiry_write_result}";
		if(inquiry_write_result == "ok"){
			$(".background_inquiry_result").addClass("show_result");
			$(".window_inquiry_result").addClass("show_result");
			$(".inquiry_result_ok").click(function(){
				$(".background_inquiry_result").removeClass("show_result");
				$(".window_inquiry_reuslt").removeClass("show_result");
			});
		}
	});
</script>
</head>
<body>
	<iframe src="header.do" width="100%" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
	<div style="width:100%; height:17vh; color:transparent">헤더</div>
	<!-- 사이드 메뉴 -->
	<div class = "main">
		<div class = "section">
			<div class = "container">
				<aside class="mypage">
					<div class="mypage-list">
						<a href="mypage_main.do" class="mypage-main">
							<strong class="menu-title">MY PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on">
									<a class="menu-title">MY TICKETS</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="mypage_ticket.do">티켓예매 목록</a>
											</li>
											<li class="">
												<strong><a class="" href="mypage_inquiry.do" style = "color : black;">나의 문의</a></strong>
											</li>
										</ul>
									</div>
								</li>
								<li class="on">
									<a class="menu-title">MY INFO</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="mypage_member_check.do">개인정보 변경/탈퇴</a>
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
					<div class="page-title title-page inquire-title">
						<h2 class = "inquire_main_title">나의 문의</h2>
						<div class = "inquire_wirte">
							<button type = "button" class = "review_write_btn">
								<div>+</div>
								<span class = "comment">문의작성</span>
							</button>
						</div>
					</div>
					
					<div class="contents">
						<div style = "width: 1076px; box-sizing: border-box;">
							<div class = "inquire">
								<c:choose>
									<c:when test = "${ fn:length(list) == 0 }">
										<div class="no-result_purchase" style = "border-top:none;">
											<div class="no-result">
												<p>문의 하신 내역이 없습니다.</p>
											</div>
										</div>
										<div id="ampaginationsm" style="text-align:center;display:none;"></div>
									</c:when>
									<c:otherwise>
										<ul style="list-style: none;">
											<c:forEach var = "list" items = "${ list }">
												<li>
													<input type = "hidden" value = "${ list.iqid }" class = "iqid">
													<div class = "inquire_content">
														<div class = "inquire_title">
															<div>
																<span><strong>문의 등록일</strong><span style = "margin-left : 10px;">${ list.iqdate }</span></span>
															</div>
															<a href = "#" class = "detail">상세보기</a>
														</div>
														<div class = "inquire_content_list">
															<div class = "inquire_content_list_information">
																<span class = "category first">미술관<span class = "second">${ list.iqcategory }</span></span>
																<span class = "first">문의유형<span class = "second"> ${ list.iqtype }</span></span>
																<h2>${ list.iqtitle }</h2>
															</div>
															<c:choose>
																<c:when test = "${ list.iqanswer == 'y' }">
																	<div class = "inquire_content_list_answer">
																		<span>답변<br>완료</span>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class = "inquire_content_list_answer" style = "background:#9b9b9b;">
																		<span>답변<br>대기</span>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</li>
											</c:forEach>
											<!-- <li>
												<div class = "inquire_content">
													<div class = "inquire_title">
														<div>
															<span><strong>문의 등록일</strong><span style = "margin-left : 10px;">2022.09.27</span></span>
														</div>
														<a href = "#" class = "detail">상세보기</a>
													</div>
													<div class = "inquire_content_list">
														<div class = "inquire_content_list_information">
															<span class = "category first">미술관<span class = "second">디뮤지엄</span></span>
															<span class = "first">문의유형<span class = "second"> 전시회/관람</span></span>
															<h2>디뮤지엄의 정확한 위치가 어디인지 알려주실 수 있으신가요?</h2>
														</div>
														<div class = "inquire_content_list_answer" style = "background:#9b9b9b;">
															<span>답변<br>대기</span>
														</div>
													</div>
												</div>
											</li> -->
										</ul>
										<div id="ampaginationsm" style="text-align:center;"></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>

	<div class = "background_inquire">
		<div class = "window_inquire">
			<div class = "popup_inquire">
				<div class = "popup_inquire_title">
					<p id = "popup_inquire">문의하기</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div class = "popup_inquire_write">
					<div class = "popup_inquire_write_form">
						<form name = "inquireWriteForm" action = "mypage_inquiry_write.do" method = "post">
							<p class = "title_comment">문의하기</p>
							<p class = "comment">표시는 필수 입력 항목입니다.</p>
							<div class = "write_form">
								<label>미술관</label>
								<select name ="iqcategory" class = "inquire_category">
									<option value = "default">미술관을 선택해주세요.</option>
									<option value = "디뮤지엄">디뮤지엄</option>
									<option value = "대림미술관">대림미술관</option>
									<option value = "구슬모아당구장">구슬모아당구장</option>
									<option value = "뮤지엄샵">뮤지엄샵</option>
								</select>
								<label>문의 유형</label>
								<select name ="iqtype" class = "inquire_type">
									<option value = "default">문의 유형을 선택해주세요.</option>
									<option value = "회원가입 · 정보변경">회원가입 · 정보변경</option>
									<option value = "전시">전시</option>
									<option value = "교육 · 문화 프로그램">교육 · 문화 프로그램</option>
									<option value = "이벤트 프로그램">이벤트 프로그램</option>
									<option value = "뮤지엄샵">뮤지엄샵</option>
									<option value = "사전답사 · 방문">사전답사 · 방문</option>
									<option value = "기타">기타</option>
								</select>
								<div class = "write_inquire_form">
									<ul>
										<li>
											<label>제목</label>
											<input type = "text" name = "iqtitle" class = "iqtitle"
												placeholder = "제목은 50글자 내로 입력해주세요.">
										</li>
										<li>
											<label>내용</label>
											<textarea name = "iqcontent" placeholder="문의 내용을 입력해주세요" class = "iqcontent" maxlength = "500"></textarea>
										</li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class = "inquire_button_list">
					<button type = "button" class = "inquire_close">취소</button>
					<button type = "button" class = "inquire_ok">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 문의 상세 내역 보기 -->
	<div class = "background_inquire_detail">
		<div class = "window_inquire_detail">
			<div class = "popup_inquire_detail">
				<div class = "popup_inquire_detail_title">
					<p id = "popup_inquire_detail">문의 상세 보기</p>
					<!-- <button type="button" id = "popup_close"></button>	 -->			
				</div>
				<div class = "popup_inquire_detail_form">
					<div class = "popup_inquire_detail_content">
						<div class = "inquiry_answer">
							<p>문의 내역</p>
							<p class = "inquiry_answer_status">답변 완료</p>
						</div>
						<div class = "category_list">
							<span class = "category first">미술관<span class = "second"></span></span>
							<span class = "first">문의유형<span class = "second"></span></span>
						</div>
						<div class = "inquire_write_date">
							<p>등록일자<span style = "color : black; margin-left : 10px;"></span></p>
						</div>
						<div class = "inquire_write_content">
							<p></p>
							<div></div>
						</div>
					</div>
				</div>
				<div class = "inquire_detail_button_list">
					<button type = "button" class = "inquire_detail_close">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 문의 사항 등록 안내 -->
	<div class = "background_inquiry_result">
		<div class = "window_inquiry_result">
			<div class = "popup_inquiry_result">
				<span style = "letter-spacing: -0.05rem;">문의사항이 정상적으로 등록되었습니다.</span>
				<button type = "button" class = "inquiry_result_ok">확인</button>
			</div>
		</div>
	</div>
</body>
</html>