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
											<li class="">
												<a class="" href="adminpage_admin_list.do">관리자승인</a>
											</li>
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

				 <div class="sub-contents">
					<div class="page-title" style = "margin: 10px 0 0 0;">
						<h2>예매 상세 내역</h2>
					</div>
					<div class = "ticket_content">
						<div class = "ticket_detail">
							<div class="result_purchase" style = "margin : 0; border-top : none;">
								<div class="purchase_result_list">
									<div class="purchase-result-list-title">
										<p>예매번호 <strong> ${list.vo.rid}</strong></p>
									</div>
									<div class="purchase-result-list-content" style = "width : 100%;">
										<div style="border-bottom: 0.5px solid #ddd;">
											<div class="purchase-result-content-title" style = "width : 100%;">
												<a href="#">
													<img src="http://localhost:9000/dmu/resources/upload/${list.vo.dsfile }" style = "width : 250px;">
												</a>
												<table>
													<tr>
														<td colspan = "4" class = "content_table_title">${list.vo.dtitle}</td>
													</tr>
													<tr>
														<th>예매 일시</th>
														<td>${vo.rokdatech}</td>
														<th>예약 매수</th>
														<td>${vo.rtotal}매</td>
													</tr>
													<tr>
														<th>장소</th>
														<td>${vo.dplace}</td>
														<th>상태</th>
														<td>${vo.rcheck}</td>
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
													<td>티켓금액<strong>${vo.dpricech}원</strong></td>
													<td>티켓<strong>${vo.rtotal}매</strong></td>
													<td>최종 결제금액<strong style="font-size:20px;">${vo.rallpricech}원</strong></td>
												</tr>
												<tr class="card_result">
													<td colspan = "6">${vo.pcoin}<br>결제일:${vo.pdate}</td>
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
											<button type = "button" class="ticket_cancle">예매취소</button>
										</div>
									</div>
									<div class="ticket-result-list-content">
										<div>
											<table>
												<tr style = "background:#efefef;">
													<th>선택</th>
													<th>티켓번호</th>
													<th>권종</th>
													<th>관람일</th>
													<th>상태</th>
												</tr>
												<c:forEach var="vo" items="${list}">
													<tr class = "ticket" id="${vo.tid}">
														<td><input type="checkbox"  id="check" class="ticket_list">
															<label for="check"></label>
														</td>
														<td>${vo.tid}</td>
														<td>일반</td>
														<td>${vo.rdateda}</td>
														<td><strong>${vo.tcheck}</strong></td>
													</tr>
												 </c:forEach>
											</table>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>