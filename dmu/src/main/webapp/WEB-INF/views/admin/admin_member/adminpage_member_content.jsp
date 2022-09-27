<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/mypage.css">
<link rel="stylesheet" href = "http://localhost:9000/dmu/resources/css/am-pagination_dmu.css">
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/mypage.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
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
           $(location).attr('href', "http://localhost:9000/dmu/adminpage_member.do?rpage="+e.page);         
    });
	
	});

</script>
<style>
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
div .info-list table:last-child {
    margin-bottom: 0;
}
div .info-list table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 2.5rem;
    border-top: 2px solid #111;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
	
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
div .info-list table tbody td:first-child {
    border-left: 0;
}
div .info-list table tbody td {
    padding: 1.25rem 0.625rem;
    line-height: 1.6;
    color: #666;
    border: 1px solid #e0e0e0;
    text-align: center;
	
}
div .info-list table thead th {
    padding: 1.25rem 0.625rem;
    border: 1px solid #e0e0e0;
    font-weight: 500;
    font-size: 1rem;
    line-height: 1.6;
    color: #111;
    text-align: center;
    background: #f7f7f7;
}
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>
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
												<a class="" href="adminpage_member.do">회원관리</a>
											</li>
											<li class="">
												<a class="" href="#">예매관리</a>
											</li>
											<li class="">
												<a class="" href="#">1대1 문의</a>
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
					<div class="page-title">
						<h2>회원관리</h2>
					</div>
					<div class="myinfo">
						<div class="myinfo-box">
						<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
							총 <strong>${dbCount}</strong>건
						</div>
								<div class="info-list">
									<table>
										<thead>
											<tr>
												<th>아이디</th>
												<th>회원명</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>생년월일</th>
												<th>주소</th>
												<th>성별</th>
												<th>회원유형</th>
												<th>가입일자</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="vo" items="${list}">
											<tr>
												<td>${vo.mid}</td>
												<td>${vo.mname}</td>
												<td>${vo.pnumber}</td>
												<td>${vo.email}</td>
												<td>${vo.birth}</td>
												<td>${address}</td>
												<td>${vo.gender}</td>
												<td>${vo.nationality}</td>
												<td>${vo.ddate}</td>
												<td>${vo.unregister}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
				<div data-v-650d6904="" data-v-1b9c8af9="" class="pagination-area"
							data-v-080a389a="" id="ampaginationsm">
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
							<button data-v-650d6904="" type="button" class="btn-next">
								next</button>
							<button data-v-650d6904="" type="button" class="btn-last">
								last</button>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="500px" scrolling="no" frameborder=0 class = "footer" ></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
				<p id = "popup_joinGuide"></p>
				<div class = "popup_button">
					<button type = "button" id = "popup_joinNo">취소</button>
					<button type = "button" id = "popup_joinOk">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>