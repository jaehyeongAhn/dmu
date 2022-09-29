<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<a href="#" class="mypage-main">
							<strong class="menu-title">ADMIN PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on">
									<a class="menu-title" href="#">ADMIN</a>
									<div class="sub-menu-list">
										<ul>
											<li class="">
												<a class="" href="#">회원관리</a>
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
							<div class="top-title">
								<strong>기본 회원 정보</strong>
							</div>
							<form name = "updateMemberForm" action = "update_info.do" method = "post">
								<div class="info-list">
									<table>
										<thead>
											<tr>
												<th>id</th>
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
											<tr>
												<td>test</td>
												<td>테스트</td>
												<td>010-1111-2222</td>
												<td>test@naver.com</td>
												<td>1990.02.27</td>
												<td>서울특별시 강동구 상암로 251 명일주공아파트 000동 000호</td>
												<td>남</td>
												<td>내국인</td>
												<td>2022-03-16</td>
												<td>가입완료</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
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