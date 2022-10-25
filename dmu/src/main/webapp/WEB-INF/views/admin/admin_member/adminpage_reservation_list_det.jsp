<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
		let height = $(".popup_refund").height() - $(".refund_title").outerHeight() - $(".refund_btn_list").outerHeight();
		$(".refund_content").css("height", height);
	});
</script>
<style>
	div.flag_content ul {
		list-style : "-";
		list-style-position :inside;
		margin-top : 30px;
	}
	div.flag_content ul li {
		line-height: 30px;
	    color: #4c4c4c;
	    letter-spacing: -0.08rem;
	}
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
												<a class="" href="adminpage_reservation_list.do" style="color:black; font-weight:700;">예매관리</a>
											</li>
											<li class="">
												<a class="" href="adminpage_inquiry_list.do">1대1 문의</a>
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
				<c:forEach var = "list" items = "${ list }">
				<div class="sub-contents">
					<div class="page-title" style = "margin: 10px 0 0 0;">
						<h2>예매 상세 내역</h2>
					</div>
					<div class = "ticket_content">
						<div class = "ticket_detail">
							<div class="result_purchase" style = "margin : 0; border-top : none;">
								<div class="purchase_result_list">
									<input type = "hidden" name = "rid" id = "reservation_ticket_rid" value = "${ list.rid }">
									<input type = "hidden" name = "rtotal" id = "reservation_ticket_total" value = "${ list.rtotal }">
									<div class="purchase-result-list-title">
										<p>예매번호 <strong> ${ list.rid }</strong></p>
									</div>
									<div class="purchase-result-list-content" style = "width : 100%;">
										<div style="border-bottom: 0.5px solid #ddd;">
											<div class="purchase-result-content-title" style = "width : 100%;">
													<img src="http://localhost:9000/dmu/resources/upload/${ list.ticketVo.dsfile }"
														style = "width : 250px;">
												<table>
													<tr>
														<td colspan = "4" class = "content_table_title">${ list.ticketVo.dtitle }</td>
													</tr>
													<tr>
														<th>예매 일시</th>
														<td>${ list.rokdate }</td>
														<th>예약 매수</th>
														<td>${ list.rtotal } 매</td>
													</tr>
													<tr>
														<th>장소</th>
														<td>${ list.ticketVo.dplace }</td>
														<th>상태</th>
														<c:choose>
															<c:when test = "${ list.rcheck == 'y' }">
																<td>예매 완료</td>
															</c:when>
															<c:when test = "${ list.rcheck == 'ex' }">
																<td>기간 만료</td>
															</c:when>
															<c:otherwise>
																<td>예매 취소</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<%-- 결제 정보 --%>
					<div class = "payment" style="margin:65px 0;">
						<div class = "payment_information">
							<div class="payment_content">
								<div class="payment_result_list">
									<div class="payment-result-list-title">
									<c:choose>
										<c:when test = "${ list.rcheck == 'n' }">
											<h2>환불정보</h2>
										</c:when>
										<c:otherwise>
											<h2>결제정보</h2>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="payment-result-list-content">
										<div>
											<table>
												<tr>
													<td class = "ticket_purchase">티켓금액
														<strong><fmt:formatNumber value="${ list.rprice }" pattern = "#,###"/>원</strong>
													</td>
													<c:set var = "refund_rtotal" value = "0"/>
													<c:forEach var = "refund_check" items = "${ list.ticketList }">
														<c:if test = "${ refund_check.tcheck == 'n' }">
															<c:set var = "refund_rtotal" value = "${ refund_rtotal+1 }"/>
														</c:if>
													</c:forEach>
													<td>티켓<strong>${ list.rtotal }매
													<c:if test = "${ refund_rtotal != 0 }">
														<span style = "font-weight : 400; color : #898989;">(-${ refund_rtotal }매)</span>
													</c:if>
													</strong></td>
													<c:choose>
														<c:when test = "${ list.rcheck == 'y' || list.rcheck == 'ex' }">
															<td>최종 결제금액<strong style="font-size:20px;">
																<fmt:formatNumber value="${ list.rallprice - (refund_rtotal * list.rprice) }" pattern = "#,###"/>원
															</strong></td>
														</c:when>
														<c:otherwise>
															<td>최종 환불금액<strong style="font-size:20px;">
																<fmt:formatNumber value="${ list.rallprice }" pattern = "#,###"/>원
															</strong></td>
														</c:otherwise>
													</c:choose>
												</tr>
												<tr class="card_result">
													<fmt:parseDate var = "pdate" value = "${ list.pdate }" type = "date" pattern = "yyyy-MM-dd"/>
													<td colspan = "6">${ list.pcoin }<br>
														결제일 : <fmt:formatDate value="${ pdate }" pattern = "yyyy-MM-dd"/></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					 
					<%-- 티켓 정보 --%>
					<div class = "ticket">
						<div class = "ticket_information">
							<div class="ticket_content">
								<div class="ticket_result_list">
									<div class="ticket-result-list-title">
										<h2>티켓목록</h2>
										<div>
											<c:if test = "${ list.rcheck == 'y' }">
												<button type = "button" class="ticket_cancle">예매취소</button>
											</c:if>
										</div>
									</div>
									<div class="ticket-result-list-content">
										<div>
											<table>
												<tr style = "background:#efefef;">
													<th>선택</th>
													<th>티켓번호</th>
													<th>이용시간</th>
													<th>관람일</th>
													<th>상태</th>
												</tr>
												<c:set var = "index" value = "1"/>
												<c:forEach var = "ticket_list" items = "${ list.ticketList }">
												<tr>
													<c:choose>
														<c:when test = "${ ticket_list.tcheck ne 'y' }">
															<c:set var = "check_disabled" value = "disabled"/>
														</c:when>
														<c:otherwise>
															<c:set var = "check_disabled" value = ""/>
														</c:otherwise>
													</c:choose>
													
													<td><input type="checkbox" id="check${ index }" class="ticket_list" ${ check_disabled }>
														<label for="check${ index }"></label>
													</td>
													<td class = "purchase_tid">${ ticket_list.tid }</td>
													<td class = "purchase_dtitle">${ list.ticketVo.dentertime }</td>
													
													<fmt:parseDate var = "rdate" value = "${ list.rdate }" type = "date" pattern = "yyyy-MM-dd"/>
													<td class ="purchase_rdate"><fmt:formatDate pattern="yyyy-MM-dd" value="${rdate}"/></td>
													<c:choose>
														<c:when test = "${ ticket_list.tcheck == 'y' }">
															<td class = "ticket_list_status"><strong>사용가능</strong></td>	
														</c:when>
														<c:when test="${ ticket_list.tcheck == 'ex' }">
															<td class = "ticket_list_status"><strong>기간만료</strong></td>		
														</c:when>
														<c:when test = "${ ticket_list.tcheck == 'n' }">
															<td class = "ticket_list_status"><strong>예매취소</strong></td>		
														</c:when>
														<c:otherwise>
															<td class = "ticket_list_status"><strong>사용불가</strong></td>		
														</c:otherwise>
													</c:choose>
												</tr>
													<c:set var = "index" value = "${ index+1 }"/>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					</c:forEach>
					</div>
				</div>
			</div>
	 <iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
				<p id = "popup_joinGuide">티켓을 선택해 주세요.</p>
				<div class = "popup_button">
					<button type = "button" id = "popup_joinOk">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "background_refund">
		<div class = "window_refund">
			<div class = "popup_refund">
				<div class = "refund_title">
					<p>예매 취소</p>
				</div>
				<div class = "refund_content">
					<div class = "refund_ticket">
						<div class="refund_ticket_list">
							<form name = "refundForm" action = "adminpage_ticket_cancel.do" method = "post">
								<table>
									<tr style = "background:#efefef;">
										<th>티켓번호</th>
										<th>관람일</th>
										<th>상태</th>
										<th>가격</th>
									</tr>
									<tr>
										<td colspan="4">환불 예상금액: <strong class = "total_count">24,000원</strong></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class = "refund_terms_div">
						<div>
						 
							<div class = "refund_checkbox">
								<input type = "checkbox" id = "refund_ticket_check_box">
								<label for = "refund_ticket_check_box">관리자 권한으로 삭제 하겠습니다.</label>
								<p></p>
							</div>
						</div>
					</div>
				</div>
				<div class="refund_btn_list">
					<button type="button" class="refund_popup_close">닫기</button>
					<button type="button" class="refund_ticket_btn" disabled>예매취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 환불 안내 -->
	<div class = "background_ticket_refund_result">
		<div class = "window_ticket_refund_result">
			<div class = "popup_ticket_refund_result">
				<p>선택하신 티켓의 취소가 완료되었습니다.</p>
				<button type = "button" id = "ticket_refund_result_btn">확인</button>
			</div>
		</div>
	</div>
	
 	
</body>
</html>