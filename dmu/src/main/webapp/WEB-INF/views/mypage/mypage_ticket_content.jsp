<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<!-- 이미지 경로 수정하기 -->
<script>
	$(document).ready(function(){
		let height = $(".popup_refund").height() - $(".refund_title").outerHeight() - $(".refund_btn_list").outerHeight();
		$(".refund_content").css("height", height);
	});
</script>
<style>
	
</style>
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
												<strong><a class="" href="mypage_ticket.do" style = "color : black;">티켓예매 목록</a></strong>
											</li>
											<li class="">
												<a class="" href="mypage_inquiry.do">나의 문의</a>
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
												<a href="${ list.ticketVo.dcode }.do?did=${ list.ticketVo.did }">
													<img src="http://localhost:9000/dmu/resources/upload/${ list.ticketVo.dsfile }"
														style = "width : 250px;">
												</a>
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
										<h2>결제정보</h2>
									</div>
									<div class="payment-result-list-content">
										<div>
											<table>
												<tr>
													<td class = "ticket_purchase">티켓금액
														<strong><fmt:formatNumber value="${ list.rprice }" pattern = "#,###"/>원</strong>
													</td>
													<td>티켓<strong>${ list.rtotal }매</strong></td>
													<td>최종 결제금액<strong style="font-size:20px;">
														<fmt:formatNumber value="${ list.pallprice }" pattern = "#,###"/>원
													</strong></td>
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
													<td class = "purchase_dtitle">${ list.ticketVo.dtime }</td>
													
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
												<!-- <tr>
													<td><input type="checkbox"  id="check2" class="ticket_list">
														<label for="check2"></label>
													</td>
													<td>22082800783812132132</td>
													<td>성인</td>
													<td>2022.10.31</td>
													<td><strong>사용가능</strong></td>
												</tr> -->
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<style>
					</style>
					<%-- 유의 사항 --%>
					<div class = "flag" style = "margin:75px 0 20px 0;">
						<div class = "flag_content">
							<div clas = "flag_content_title">
								<h2>유의사항</h2>
							</div>
							<div>
								<ul>
									<li>예매하신 티켓의 변경, 취소, 환불은 관람 전 일 오후 5시까지만 가능합니다. 이후에는 취소와 환불이 불가하오니 유의해 주세요.</li>
									<li>전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</li>
									<li>관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리되어 취소,  환불이 불가능합니다.</li>
									<li>경로 및 장애인 우대할인 티켓을 구매하신 경우, 미술관 방문 당일 현장에서 확인 가능한 신분증 또는 증명서를 반드시 지참해 주시기 바랍니다.</li>
									<li>연령, 할인 기준에 맞지 않는 티켓을 예매하신 경우 현장에서의 차액 지불은 불가하며, 미술관 입장이 어려울 수 있습니다.</li>
									<li>예매취소 시점과 결제 시 사용하신 신용카드사의 따라 취소 방법과 환급일은 다소 차이가 있을 수 있습니다.</li>
									<li>신용카드 할부결제로 구매하신 티켓 수량의 일부를 취소하실 경우, 신용카드사의 사정에 따라 혜택(무이자 할부 등)의 적용 여부가 달라질 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
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
						<h3 class="refund_img">환불목록</h3>
						<div class="refund_ticket_list">
							<form name = "refundForm" action = "mypage_ticket_cancel.do" method = "post">
								<table>
									<tr style = "background:#efefef;">
										<th>티켓번호</th>
										<th>관람일</th>
										<th>상태</th>
										<th>가격</th>
									</tr>
									<!-- <tr>
										<td>22082800783812132132</td>
										<td>2022.10.31</td>
										<td><strong>취소가능</strong></td>
										<td>12,000원</td>
									</tr> -->
									<tr>
										<td colspan="4">환불 예상금액: <strong class = "total_count">24,000원</strong></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class = "refund_terms_div">
						<div>
							<h3 class="ticket_img">환불정책</h3>
							<div class="refund_terms_comment">
								<div style="text-align : center;">
									<h3 style="display : block; font-size:21px;">티켓 환불 정책</h3>
								</div>
								<ul class = "refund_terms">
									<li>신용카드 할부 결제로 구매하신 티켓 수량의 일부를 취소하실 경우, 신용카드사의 사정에 따라 혜택(무이자 할부 등)의 적용 여부가 달라질 수 있습니다.</li>
									<li>티켓 환불 시점과 해당 카드사의 환불 처리 기준에 따라 취소 금액의 환급일은 다소 차이가 있을 수 있습니다. 사용한 카드의 환불에 관한 사항은 시용카드사에 직접 문의해주시기 바랍니다.</li>
									<li>천재지변, 전시장 입장이 불가능한 상태에 이르는 시설 고장, 전시장 내 총기 또는 가스 등의 사고로 인한 인력 사고, 
										감염병 예방 등으로 인한 정부의 임시 폐관 조치와 같은 미술 관 측 사유로 전시 관람, 참여가 어려울 경우 취소 기한에 관계없이 구매하신 티켓에 대한 전액 환불을 진행합니다.</li>
									<li>전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다.</li>
									<li>예매하신 티켓의 변경, 취소, 환불은 관람 전 일 오후 5시까지만 가능합니다.</li>
									<li>환불은 결제한 수단으로만 진행됩니다.</li>
									<li>티켓의 환불 신청은 대림문화재단 홈페이지와 어플리케이션을 통해서만 가능합니다. 
										구체적인 내용은 각 해당 페이지에 명시된 취소 및 환불 규정을 따릅니다.</li>
								</ul>
							</div>
							<div class = "refund_checkbox">
								<input type = "checkbox" id = "refund_ticket_check_box">
								<label for = "refund_ticket_check_box">예매취소에 대한 환불정책을 확인했습니다.</label>
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