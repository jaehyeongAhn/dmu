<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dmu</title>
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/tiket.css">
<link rel="stylesheet"  href="http://localhost:9000/mycgv/resources/css/am-pagination.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
</head>
<body>
<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
<div style="width:100%; height:17vh; color:transparent">헤더</div>
<main>
<div data-v-ec5a0c2c="" class="root-container">
<div data-v-ec5a0c2c="" class="content-wrapper">
<div data-v-ec5a0c2c="" class="body-wrapper">
<div data-v-7b1f57c8="" data-v-ec5a0c2c="">
<div data-v-7b1f57c8="" class="sub-contents-area">
<div data-v-6d324aa0="" data-v-7b1f57c8="" class="step-process-area">
			<ul data-v-6d324aa0="">
				<li data-v-6d324aa0="" class="on">
					<span data-v-6d324aa0="" class="no">01</span>
					<span data-v-6d324aa0="" class="txt">.티켓 선택</span>
				</li>
				
				<li data-v-6d324aa0="" class="">
					<span data-v-6d324aa0="" class="no">02</span>
					<span data-v-6d324aa0="" class="txt">.관람일/인원 선택</span>
				</li>
				
				<li data-v-6d324aa0="" class="">
					<span data-v-6d324aa0="" class="no">03</span>
					<span data-v-6d324aa0="" class="txt">.결제</span>
				</li>
			</ul>
		</div>
<div data-v-7b1f57c8="" class="container">
<div data-v-7b1f57c8="" class="ticket-list-area">
<div data-v-7b1f57c8="">
<div data-v-7b1f57c8="" class="snb-area">

			<ul data-v-7b1f57c8="" class="snb">
				<li data-v-7b1f57c8="" class="">
					<a data-v-7b1f57c8="" href="http://localhost:9000/dmu/exhibition_list.do" role="button">EXHIBITION </a>
				</li>
				
				<li data-v-7b1f57c8="" class="on">
					<a data-v-7b1f57c8="" href="http://localhost:9000/dmu/learn_list.do" role="button">LEARN </a>
				</li>
				<li data-v-7b1f57c8="" class="">
					<a data-v-7b1f57c8="" href="http://localhost:9000/dmu/event_list.do" role="button">EVENT </a>
				</li>
			</ul>
		</div>
		
<div data-v-7b1f57c8="" class="sub-contents-area">
<div data-v-41f56098="" data-v-7b1f57c8="" class="container">
<div data-v-41f56098="" class="division-list">
			<ul data-v-41f56098="">
				<li data-v-41f56098="" class="on">
					<a data-v-41f56098="" href="javascript:void(0);">전체</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">유아</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">어린이</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">청소년</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">대학생</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">성인</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">교사</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">전시해설</a>
				</li>
			</ul>
		</div>
		
<div data-v-41f56098="" class="list-top-area">

		<span data-v-41f56098="" class="total">총 <strong>9</strong>건</span>
			<ul data-v-41f56098="" class="order">
				
				<li data-v-41f56098="" class="on">
					<a data-v-41f56098="" href="javascript:void(0);">시작일 순</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">종료일 순</a>
				</li>
			</ul>
		</div>
<div data-v-41f56098="" class="ticket-list education">
			<c:forEach var="vo" items="${list}">
			<c:if test="${vo.dcode eq'learn'}">
			<ul data-v-41f56098="">
				<li data-v-41f56098="">
						<c:if test="${vo.dsfile != null }">
					<a data-v-41f56098="" href="http://localhost:9000/dmu/learn.do?did=${ vo.getDid()}" class="thumb">
						<img data-v-2fed1a9a="" data-v-1e8092ec=""src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"></a>
						</c:if>
			<ul data-v-41f56098="" class="flag">
				<li data-v-41f56098="">${vo.dnum}회성 교육</li>
				<li data-v-41f56098="">${vo.dplace}</li>
			<!---->
			<!---->
			</ul>
					<a data-v-41f56098="" href="http://localhost:9000/dmu/learn.do?did=${ vo.getDid()}"
					class="title">${vo.dtitle}</a>
					
					<!-- <p data-v-41f56098="" class="explan">Culture Lover들의 문화·예술로 익히는 영어습관</p> -->
			<ul data-v-41f56098="" class="info">
					<li data-v-41f56098="">
						<span data-v-41f56098="" class="tit">교육진행</span>
						<span data-v-41f56098="" class="txt">${vo.dstart}~ ${vo.dend}</span>
					</li>
					<li data-v-41f56098="">
						<span data-v-41f56098="" class="tit">장소</span>
						<span data-v-41f56098="" class="txt">${vo.dplace}</span>
					</li>
					<li data-v-41f56098="">
						<span data-v-41f56098="" class="tit">대상</span>
						<span data-v-41f56098="" class="txt">${vo.dtarget}</span></li>
					<li data-v-41f56098="">
						<span data-v-41f56098=""class="tit">교육시간</span>
						<span data-v-41f56098="" class="txt">${vo.dtime}</span>
					</li>
					<li data-v-41f56098="">
						<span data-v-41f56098="" class="tit">참가비</span>
						<span data-v-41f56098="" class="txt">${vo.dprice} 원</span>
					</li>
				</ul>
			</ul>
			</c:if>
			</c:forEach>								
				
			
		
	</div>
<div data-v-41f56098="" class="btn-more-area">
<div data-v-26e42198="" data-v-41f56098="" class="btn-area">
					<button data-v-26e42198="" id="btn144" type="button"
					class="secondary more">더보기</button>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</main>

		<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	</body>

</html>