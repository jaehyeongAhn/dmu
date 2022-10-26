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
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/adminpage.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script src="http://localhost:9000/dmu/resources/js/admin_member.js"></script>
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
												<a class="" href="adminexhibition_list.do" target="_blank">전시회 리스트 작성</a>
											</li>
											<li class="">
												<a class="" href="admin_notice_list.do" target="_blank">공지사항 작성</a>
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
					<div class="gray-box">
						<div class = "greeting-area">
							<p><strong>${ sessionScope.member.mname }</strong>님 안녕하세요.</p>						
						</div>
					</div>
					<div class="records-group">
						<div class="purchase-list">
							<div class="purchase-title">
								<div>
									<p><strong style = "font-size : 20px; color:black;">최근 예매 리스트</strong></p>
									<a href="http://localhost:9000/dmu/adminpage_reservation_list.do" class="booking_detail"><p>더보기</p></a>
								</div>
							</div>
							<div class="info-list" style="margin-top: 20px;">
									<!-- <table id="report"> -->
									<table class="info-table">
										<thead>
											<tr>
												<th>티켓번호</th>
												<th>이벤트명</th>
												<th>예약자명</th>
												<th>티켓금액</th>
												<th>티켓매수</th>
												<th>총 금액</th>
												<th>관람일</th>
												 
											</tr>
										</thead>
										<tbody>
										<c:forEach var="vo" items="${list}">
											<tr class = "name" id="${vo.rid}">												 										 
												<td  class="reservation_detail reservationId">${vo.rid}</td> <!-- 티켓번호 -->
												<td>${vo.dtitle }</td>   <!-- 전시/이벤트 명 --> 
												<td>${vo.mname }</td>   <!-- 예약자 명 -->
												<td>${vo.dpricech }</td>   <!-- 티켓금액 -->
												<td>${vo.rtotal }</td>   <!-- 티켓매수 -->
												<td>${vo.rallpricech }</td>   <!-- 총 금액 -->
												<td>${vo.rdateda }</td>   <!-- 관람일 -->
										</c:forEach>
										</tbody>
									</table>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px;"></iframe>
</body>
</html>