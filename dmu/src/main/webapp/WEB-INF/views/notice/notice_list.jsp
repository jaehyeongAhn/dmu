<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="icon" href="/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">

<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src = "http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script> -->
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/main_css.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/am-pagination_dmu.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/admin.js"></script>
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
           $(location).attr('href', "http://localhost:9000/dmu/notice_list.do?rpage="+e.page);         
    });
	

	
	$(".snb-area .snb li a.tabbox").click(function(){
		
		//alert($(this).attr("id"));
		var kind = $(this).attr("id");
		
		$.ajax({
			url : '/notice_list_json.do',
			type: 'post',
			cache : false,
			headers : {"cache-control":"no-cache", "pragma": "no-cache"},
			data : {"category" : kind},
			success : function(data){
				console.log(data);
				let dataset = JSON.parse(data);
		
				$('.notice-list').html(data);
			},
			error : function(data){
				alert('error');
			}
		});
		
	});
	
	
/* 	initAjax(1);
	
	$.ajax({
		type: "get",
		data:{
			nid:nid
		}
		url : "notice_list_json.do?nid="+nid+"&category="+ncategory
		success:function(result){
			console.log(result);
			$('body').html(result);
		}
	
		
		
	}); */
	
	
	
});//ready

</script>

<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>
	<main>
		<section data-v-1b9c8af9="" class="sub-contents-wrap">
			<div data-v-0d03d759="" data-v-1b9c8af9=""
				class="sub-top-area notice">
				<div data-v-0d03d759="" class="container">
					<h2 data-v-0d03d759="">공지사항</h2>
					<nav data-v-0d03d759="">
						<ul data-v-0d03d759="">
							<li data-v-0d03d759="" style="cursor: pointer;">HOME</li>
							<!---->
							<li data-v-0d03d759="">공지사항</li>
							<!---->
						</ul>
					</nav>
				</div>
			</div>
			<div data-v-1b9c8af9="" class="top-area">
				<div data-v-1b9c8af9="" class="right-area">
					<div data-v-e4bbf8ae="" data-v-1b9c8af9="" class="search-area">
						<div data-v-0f105554="" data-v-e4bbf8ae="" class="select-area"
							style="width: 11.875rem;">
							<div data-v-0f105554="" id="select21" class=""
								style="width: 11.875rem;">
								<button data-v-0f105554="" type="button" data-value="title"
									class="">제목</button>
								<ul data-v-0f105554="" class="select-list"
									style="display: none;">
									<li data-v-0f105554="" class="on"><button
											data-v-0f105554="" type="button">제목</button></li>
									<li data-v-0f105554="" class=""><button data-v-0f105554=""
											type="button">내용</button></li>
								</ul>
							</div>
						</div>
						<div data-v-e4bbf8ae="" class="search-form">
							<div data-v-67ca82d2="" data-v-e4bbf8ae="" class="input-area"
								style="width: 25.5rem;">
								<input data-v-67ca82d2="" id="field22" autocomplete="on"
									placeholder="검색어를 입력하세요." maxlength="-1" type="text" class="">
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<a data-v-67ca82d2="" href="javascript:void(0);" class=""></a>
								<!---->
							</div>
							<div data-v-26e42198="" data-v-e4bbf8ae="" class="btn-area">
								<button data-v-26e42198="" id="btn23" type="button"
									class="btn-search">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div data-v-080a389a="" data-v-1b9c8af9="">
				<div data-v-080a389a="" class="snb-area">
					<ul data-v-080a389a="" class="snb categoryList">
						<li data-v-080a389a="" class="on"><a data-v-080a389a=""
							role="button" style="cursor: pointer;" data-tab="tab_1" class="tabbox" id="all">전체</a></li>
						<li data-v-080a389a="" class=""><a data-v-080a389a=""
							role="button" style="cursor: pointer;" data-tab="tab_2" class="tabbox" id="dmuseum">디뮤지엄</a></li>
						<li data-v-080a389a="" class=""><a data-v-080a389a=""
							role="button" style="cursor: pointer;" data-tab="tab_3" class="tabbox" id="daelim">대림미술관</a></li>
						<li data-v-080a389a="" class=""><a data-v-080a389a=""
							role="button" style="cursor: pointer;" data-tab="tab_4" class="tabbox" id="projectSpace">구슬모아당구장</a></li>
					</ul>
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<div data-v-1b9c8af9="" data-v-080a389a="" slot=""
						class="container">
						<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
							총 <strong>${dbCount}</strong>건
						</div>
				
						<div data-v-1b9c8af9="" data-v-080a389a="" class="notice-list">
							<ul data-v-1b9c8af9="" data-v-080a389a="">
							<c:forEach var="vo" items="${list}">
								<li data-v-1b9c8af9="" data-v-080a389a=""><a href="notice_content.do?nid=${vo.nid}"
									data-v-1b9c8af9="" data-v-080a389a="" href="javascript:void(0)"><span
										data-v-1b9c8af9="" data-v-080a389a="" class="number">${vo.rno}</span>
										<span data-v-1b9c8af9="" data-v-080a389a="" class="category">${vo.ncategory}</span>
										<div data-v-1b9c8af9="" data-v-080a389a="" class="title-area">
											<strong data-v-1b9c8af9="" data-v-080a389a="" class="title">${vo.ntitle}</strong>
											<span data-v-1b9c8af9=""
												data-v-080a389a="" class="date">${vo.ndate}</span>
										</div>
										</a>
										</li>
							</c:forEach>
<!-- 								<li data-v-1b9c8af9="" data-v-080a389a=""><a
									data-v-1b9c8af9="" data-v-080a389a="" href="javascript:void(0)"><span
										data-v-1b9c8af9="" data-v-080a389a="" class="number">9</span><span
										data-v-1b9c8af9="" data-v-080a389a="" class="category">공통</span>
										<div data-v-1b9c8af9="" data-v-080a389a="" class="title-area">
											<strong data-v-1b9c8af9="" data-v-080a389a="" class="title">대림문화재단
												개인정보처리방침 개정 안내</strong><span data-v-1b9c8af9="" data-v-080a389a=""
												class="date">2022.08.22</span>
										</div></a></li>
								<li data-v-1b9c8af9="" data-v-080a389a=""><a
									data-v-1b9c8af9="" data-v-080a389a="" href="javascript:void(0)"><span
										data-v-1b9c8af9="" data-v-080a389a="" class="number">8</span><span
										data-v-1b9c8af9="" data-v-080a389a="" class="category">공통</span>
										<div data-v-1b9c8af9="" data-v-080a389a="" class="title-area">
											<strong data-v-1b9c8af9="" data-v-080a389a="" class="title">대림문화재단
												영상정보처리기기 운영·관리방침 개정 안내</strong><span data-v-1b9c8af9=""
												data-v-080a389a="" class="date">2022.08.01</span>
										</div></a></li>
								<li data-v-1b9c8af9="" data-v-080a389a=""><a
									data-v-1b9c8af9="" data-v-080a389a="" href="javascript:void(0)"><span
										data-v-1b9c8af9="" data-v-080a389a="" class="number">7</span><span
										data-v-1b9c8af9="" data-v-080a389a="" class="category">디뮤지엄</span>
										<div data-v-1b9c8af9="" data-v-080a389a="" class="title-area">
											<strong data-v-1b9c8af9="" data-v-080a389a="" class="title">성동·광진구
												관내 교사 대상, 디뮤지엄 교사 워크숍 개최 안내</strong><span data-v-1b9c8af9=""
												data-v-080a389a="" class="date">2022.05.13</span>
										</div></a></li> -->
							</ul>
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
								<li data-v-650d6904="" class=""><a data-v-650d6904=""
									href="javascript:void(0);" role="button">2</a></li>
								<li data-v-650d6904="" class=""><a data-v-650d6904=""
									href="javascript:void(0);" role="button">3</a></li>
							</ul>
							<button data-v-650d6904="" type="button" class="btn-next">
								next</button>
							<button data-v-650d6904="" type="button" class="btn-last">
								last</button>
						</div>
					</div>
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
			</div>
			<iframe src="footer.do" width="100%" height="500px" scrolling="no" frameborder=0></iframe>
			<!-- built files will be auto injected -->
			<footer>
				<!-- 0510 네이버 공통 js 추가 -->
				<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
			</footer>
		</section>
	</main>
</body>
</html>