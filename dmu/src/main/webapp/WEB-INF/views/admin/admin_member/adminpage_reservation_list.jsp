<<<<<<< HEAD
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
<script src = "http://localhost:9000/dmu/resources/js/admin_member.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){
	
	let dbCount = '${dbCount}'
	let rpage = '${rpage}'
	let pageSize = '${pageSize}'
	
	//페이징 리스트 출력
	function paging(dbCount, rpage, pageSize) {
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
	
	paging(dbCount, rpage, pageSize);
	
	//페이징 번호 클릭 시 이벤트 처리
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/dmu/adminpage_reservation_list.do?rpage="+e.page);         
    });
	
	
	//popup
	$(".reservation_detail").click(function(){
		$(".background_reservation").addClass("show");
		$(".window_reservation").addClass("show");
		$(".popup_close").click(function(){
			$(".background_reservation").removeClass("show");
			$(".window_reservation").removeClass("show");
		});
	});
	

});



</script>
 
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
												<a class="" href="adminexhibition_list.do" target="_blank">상품 리스트 작성</a>
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
					<div class="page-title">
						<h2>예매관리</h2>
					</div>
					<div class="myinfo">
						<div class="myinfo-box">
						<div style="display:flex; justify-content:space-between;">
						<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
							총 <strong class='total'>${dbCount}</strong>건
						</div>
						<div>
							<input type="text" name="search" placeholder="검색어를 입력하세요." class="search-bar-reserve">
							<button class="search-btn-reserve">검색</button>
						</div>
						</div>
								<div data-v-1b9c8af9="" data-v-080a389a="" class="no-result" style="display:none;"><p data-v-1b9c8af9="" data-v-080a389a="">작성된 공지사항이 없습니다.</p></div>
								<div class="info-list">
									<table id="report">
									<table class="info-table">
										<thead>
											<tr>
												<th>분류</th>
												<th>티켓번호</th>
												<th>이벤트명</th>
												<th>예약자명</th>
												<th>티켓금액</th>
												<th>티켓매수</th>
												<th>총 금액</th>
												<th>관람일</th>
												<th>예약일</th>
												<th>예약취소  진행</th>
												 
											</tr>
										</thead>
										<tbody>
										<c:forEach var="vo" items="${list}">
											<tr>												 
												<td >${vo.dcode}</td>											 
												<td  class=" reservation_detail reservationId" id="${vo.rid}"><a href="#"> ${vo.rid}</a> </td> <!-- 티켓번호 -->
												<td>${vo.dtitle }</td>   <!-- 전시/이벤트 명 --> 
												<td> ${vo.mname } </td>   <!-- 예약자 명 -->
												<td>${vo.dpricech }</td>   <!-- 티켓금액 -->
												<td>${vo.rtotal }</td>   <!-- 티켓매수 -->
												<td>${vo.rallpricech }</td>   <!-- 총 금액 -->
												<td>${vo.rdateda }</td>   <!-- 관람일 -->
												<td>${vo.rokdatech }</td>   <!-- 예약일 -->
										<c:choose>
														<c:when test="${vo.rid == 'n'}">  <!-- 예약취소 진행 -->  
															<td>취소완료</td>
														</c:when>
															<c:otherwise>
																<td >   <button class="reservation_detail_admin" type="button" id="${vo.rid}" > 관리자 모드 </button></a>  </td>
														</c:otherwise>
													</c:choose>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
				<div data-v-650d6904="" data-v-1b9c8af9="" class="pagination-area" data-v-080a389a="" id="ampaginationsm" style="text-align:center;">
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
	<div class = "background_reservation">
		<div class = "window_reservation">
			<div class = "popup_reservation">
				<p class = "popup_title">티켓 정보</p>
				<div class="popup_detail">
								<table class="popup_detail_table">
										<thead>
											<tr>
												<th>분류</th>
												<td class="dcode">${vo.dcode}</td>
											</tr>
											<tr>
												<th>예매번호</th>
												<td class="rid">${vo.rid}</td>
											</tr>
											<tr>
												<th>티켓번호</th>
												<td class="tid">${vo.tid}</td>
											</tr>
											<tr>
												<th>전시/이벤트 명</th>
												<td class="dtitle">${vo.dtitle}</td>
											</tr>
											<tr>
												<th>예약자명</th>
												<td class="mid">${vo.mname}</td>
											</tr>
											<tr>	
												<th>티켓금액</th>
												<td class="dprice">${vo.dpricech}</td>
											</tr>
											<tr>
												<th>티켓매수</th>
												<td class="rtotal">${vo.rtotal}</td>
											</tr>
											<tr>
												<th>총 금액</th>
												<td class="rallprice">${vo.rallpricech}</td>
											</tr>
											<tr>
												<th>관람일</th>
												<td class="rdate">${vo.rdateda}</td>
											</tr>
											<tr>	
												<th>예약일</th>
												<td class="rokdate">${vo.rokdate}</td>
											</tr>
											<tr>	
												<th>결제번호</th>
												<td class="pid">${vo.pid}</td>
											</tr>
											<tr>	
												<th>결제일</th>
												<td class="pdate">${vo.pdate}</td>
											</tr>
											<tr>	
												<th>결제수단</th>
												<td class="pcoin">${vo.pcoin}</td>
											</tr>
											<tr>	
												<th>상태</th>
												<td class="tcheck">${vo.tcheck}</td>
											</tr>
										</thead>
									</table>
				
				</div>
				<div class = "popup_button">
					<button type = "button" class = "popup_close">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
=======
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
<script src = "http://localhost:9000/dmu/resources/js/admin_member.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){
	
	let dbCount = '${dbCount}'
	let rpage = '${rpage}'
	let pageSize = '${pageSize}'
	
	//페이징 리스트 출력
	function paging(dbCount, rpage, pageSize) {
	var pager = jQuery('#ampaginationsm').pagination({
	
	    maxSize: 5,	    		// max page size
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
	
	paging(dbCount, rpage, pageSize);
	
	//페이징 번호 클릭 시 이벤트 처리
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/dmu/adminpage_reservation_list.do?rpage="+e.page);         
    });
	
	
	//popup
	$(".reservation_detail").click(function(){
		$(".background_reservation").addClass("show");
		$(".window_reservation").addClass("show");
		$(".popup_close").click(function(){
			$(".background_reservation").removeClass("show");
			$(".window_reservation").removeClass("show");
		});
	});
	

});



</script>
 
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
												<a class="" href="adminexhibition_list.do" target="_blank">상품 리스트 작성</a>
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
					<div class="page-title">
						<h2>예매관리</h2>
					</div>
					<div class="myinfo">
						<div class="myinfo-box">
						<div style="display:flex; justify-content:space-between;">
						<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
							총 <strong class='total'>${dbCount}</strong>건
						</div>
						<div class="search-part">
							<input type="text" name="search" placeholder="티켓번호/이벤트명/예약자명으로 검색 가능합니다" class="search-bar-reserve">
							<button class="search-btn-reserve">검색</button>
						</div>
						</div>
								<div data-v-1b9c8af9="" data-v-080a389a="" class="no-result" style="display:none;"><p data-v-1b9c8af9="" data-v-080a389a="">검색 결과가 없습니다.</p></div>
								<div class="info-list">
									<!-- <table id="report"> -->
									<table class="info-table">
										<thead>
											<tr>
												<th>분류</th>
												<th>티켓번호</th>
												<th>이벤트명</th>
												<th>예약자명</th>
												<th>티켓금액</th>
												<th>티켓매수</th>
												<th>총 금액</th>
												<th>관람일</th>
												<th>예약일</th>
												<th>예약취소  진행</th>
												 
											</tr>
										</thead>
										<tbody>
										<c:forEach var="vo" items="${list}">
											<tr class = "name" id="${vo.rid}">												 
												<td >${vo.dcode}</td>											 
												<td  class="reservation_detail reservationId"><a href="#">${vo.rid}</a></td> <!-- 티켓번호 -->
												<td>${vo.dtitle }</td>   <!-- 전시/이벤트 명 --> 
												<td>${vo.mname }</td>   <!-- 예약자 명 -->
												<td>${vo.dpricech }</td>   <!-- 티켓금액 -->
												<td>${vo.rtotal }</td>   <!-- 티켓매수 -->
												<td>${vo.rallpricech }</td>   <!-- 총 금액 -->
												<td>${vo.rdateda }</td>   <!-- 관람일 -->
												<td>${vo.rokdatech }</td>   <!-- 예약일 -->
													<c:choose>
														<c:when test="${vo.rid == 'n'}">  <!-- 예약취소 진행 -->  
															<td>취소완료</td>
														</c:when>
															<c:otherwise>
																<td>  <button class="reservation_detail_admin member_detail" type="button" id="${vo.rid}"> 관리자 모드 </button> </td>
														</c:otherwise>
													</c:choose>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
				 <div data-v-650d6904="" data-v-1b9c8af9="" class="pagination-area" data-v-080a389a="" id="ampaginationsm" style="text-align:center;"> 
							<button data-v-650d6904="" type="button" disabled="disabled"
								class="btn-first">first</button>
							<button data-v-650d6904="" type="button" disabled="disabled"
								class="btn-prev">prev</button>
							<ul data-v-650d6904="">
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">1</a></li>
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">2</a></li>
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">3</a></li>
							</ul>
<!-- 							 <button data-v-650d6904="" type="button" class="btn-next">
								next</button>
							<button data-v-650d6904="" type="button" class="btn-last">
								last</button> -->
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
	<div class = "background_reservation">
		<div class = "window_reservation">
			<div class = "popup_reservation">
				<p class = "popup_title">티켓 정보</p>
				<div class="popup_detail">
								<table class="popup_detail_table">
										<thead>
											<tr>
												<th>분류</th>
												<td class="dcode">${vo.dcode}</td>
											</tr>
											<tr>
												<th>예매번호</th>
												<td class="rid">${vo.rid}</td>
											</tr>
											<tr>
												<th>티켓번호</th>
												<td class="tid">${vo.rid}</td>
											</tr>
											<tr>
												<th>전시/이벤트 명</th>
												<td class="dtitle">${vo.dtitle}</td>
											</tr>
											<tr>
												<th>예약자명</th>
												<td class="mid">${vo.mname}</td>
											</tr>
											<tr>	
												<th>티켓금액</th>
												<td class="dprice">${vo.dpricech}</td>
											</tr>
											<tr>
												<th>티켓매수</th>
												<td class="rtotal">${vo.rtotal}</td>
											</tr>
											<tr>
												<th>총 금액</th>
												<td class="rallprice">${vo.rallpricech}</td>
											</tr>
											<tr>
												<th>관람일</th>
												<td class="rdate">${vo.rdateda}</td>
											</tr>
											<tr>	
												<th>예약일</th>
												<td class="rokdate">${vo.rokdatech}</td>
											</tr>
											<tr>	
												<th>결제번호</th>
												<td class="unregister"> </td>
											</tr>
											<tr>	
												<th>결제일</th>
												<td class="pdate">${vo.pdate}</td>
											</tr>
											<tr>	
												<th>결제수단</th>
												<td class="pcoin">${vo.pcoin}</td>
											</tr>
											<tr>	
												<th>상태</th>
												<td class="tcheck">${vo.tcheck}</td>
											</tr>
										</thead>
									</table>
				
				</div>
				<div class = "popup_button">
					<button type = "button" class = "popup_close">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
>>>>>>> branch 'main' of https://github.com/jaehyeongAhn/dmu.git
</html>