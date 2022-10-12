<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/search.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/search.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
</head>
<body>
<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0 class="header" style="position:absolute; overflow:hidden;"></iframe>
<div style="width:100%; height:17vh; color:transparent">헤더</div>
	<section class="sub-contents-wrap">
		<div class="sub-top-area search">
			<div class="container">
				<h2>Search</h2>
				<nav>
					<ul class = "menuBar">
						<li style="cursor: pointer;" class = "home" href = "index.do"><a href = "index.do">HOME</a></li>
						<!---->
						<li>Search</li>
						<!---->
					</ul>
				</nav>
			</div>
		</div>

		<div class="top-search-area">
			<div>
				<input type="text" name="search" placeholder="검색어를 입력하세요." class="search-bar">
				<button class="search-btn">검색</button>
			</div>
			<div style = "width : 844px; margin : 0 auto;">			
				<span class="alert" style="display: none;">2글자 이상의 검색어를 입력하세요.</span>
			</div>
		</div>
		<div>
			<div class="snb-area">
				<ul class="snb en">
					<li class="category all on">
						<a role="button" alt = "all"
						style="cursor: pointer;">전체 <span class="count">0</span></a>
					</li>
					<li class="category exhibition_list">
						<a role="button" alt = "exhibition"
						style="cursor: pointer;">EXHIBITION <span class="count">0</span></a>
					</li>
					<li class="category learn_list">
						<a role="button" alt = "learn"
						style="cursor: pointer;">LEARN <span class="count">0</span></a>
					</li>
					<li class="category event_list">
						<a role="button" alt = "event"
						style="cursor: pointer;">EVENT <span class="count">0</span></a>
					</li>
				</ul>
			</div>

			<div class="sub-contents-area">
				<div class="container search">
					<div style = "padding : 0 60px;">
						<dl class="ex-list exhibition">
							<dt>EXHIBITION</dt>
						</dl>
						<dl class="ex-list learn">
							<dt>LEARN</dt>
						</dl>
						<dl class="ex-list event">
							<dt>EVENT</dt>
							<!-- <dd>
								<div class = "introduce-menu">
									<div class="img-area">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZgAAADmCAIAAABnBgQHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo5QTRERURGMUQ4MUUxMUVDQUQ5OEZEOEFENEQ3REQ4NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo5QTRERURGMkQ4MUUxMUVDQUQ5OEZEOEFENEQ3REQ4NSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjlBNERFREVGRDgxRTExRUNBRDk4RkQ4QUQ0RDdERDg1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjlBNERFREYwRDgxRTExRUNBRDk4RkQ4QUQ0RDdERDg1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+8WMMTAAABEVJREFUeNrs3U1u4kAQgNEQ5Qjc/4Ss+gRBYRGkCMfun+pq895iVsRYHs2nKuMhl1LKB8DKPl0CQMgAhAxAyAAhAxAyACEDEDJAyACEDEDIAIQMEDIAIQMQMgAhA4QMQMgAhAxAyAAhAxAyACEDEDJAyACEDEDIAIQMEDIAIQMQMgAhA4QMQMgAhAxAyAAhAxAyACEDEDJAyACEDEDIAIQMEDIAIQMQMgAhA4QMQMgAhAxAyAAhAxAyACEDEDJAyACEDEDIAIQMEDIAIQMQMgAhA4QMQMgAhAxAyAAhAxAyACEDEDJAyACEDEDIAIQMEDIAIQMY5ssloK/b7bb9guv1en/N/U/Xil4upRRXgdHx2u6aC4iQsWS/FA0h4zz9UjTaudlProrFvAUmMiQsiNEMIeMkI5KcYbVk+UXPpomQMScijzHq+qRlttIyrJYEVexop0YfHyFDxfZWpr0vh4omZ/zlvygxM2HPx7E/YiIjNGTjxqK5786i3OwnV0f2HNzshomM+kBEjkKpTgYTGSo2ZDQzlyFk9N/4zvGmWC055zi2EZSAbyKrPjdMZDC2Yo8f9xklQkbEOBbw7i0n4E4ZQkbT4tZxVmo5DS1DyKjvVN+CuBeGkGHJRcgQjuMTUJ4nyxRQyCDRACVJVPDtFzI0atR6dZDGR89e/bhf+msig867Xp6FFCFDnqyBCBnkGAMRMk6oyzBV3RQxQsjIMtdU13DQTmrVFTJMZCBkvN+kNmu1tJkiZMwf68yDCBmAkDFjD7UbImRYLUHIACEDqyVChtWy22ppM0XI6NaIWYOVgQ4hY/5E1lgiExlCxvyhZlCJTGpCBsKBkGG1VECEjNXzFPMWbpAhZPQci+qOoEQIGYmGsqNJuv0YdGLW1Xfm18GRa3/UI0xkhGYoODrGMYSM/v/+3e1CyDjnbjgorKKJkFE5lG3no+9CV10xeyVu9jN/ZFMiGl1KKa4C1SNPY8v2JMw4hpCRqGX3g9xffCg9KoaQ0XNPjK9GwlMiJzf72RuF4M8NVQwTGaPyEVCQhM/iYiLjVHPZ6NFMxajg8Qvqc9M3KB55xWpJ9FjUcT469Lmnvx2EjFw5OzqFCRlCRsS69+/DYr7eByFjgZZ1p2Js86kl2SOiYpjIWHg0kzBMZKydFRXDRMbCo5mEIWQsnDMJQ8hYtWj6hZCxZNfECyED+OVTS0DIAIQMQMgAIQMQMgAhAxAyQMgAhAxAyACEDBAyACEDEDIAIQOEDEDIAIQMQMgAIQMQMgAhAxAyQMgAhAxAyACEDBAyACEDEDIAIQOEDEDIAIQMQMgAIQMQMgAhAxAyQMgAhAxAyACEDBAyACEDEDIAIQOEDEDIAIQMQMgAIQMQMgAhAxAyQMgAhAxAyACEDBAyACEDEDIAIQOEDEDIAIQMQMgAIQMQMgAhAxAyQMgAhAxAyACEDBAyACEDGOdbgAEAuXmnAfRjsBEAAAAASUVORK5CYII="
											alt="[한남살롱] CINEMA 바르다가 사랑한 얼굴들" style="">
									</div>
									<div class="info-area">
										<p class="tag">공연</p>
										<p class="title">[한남살롱] CINEMA 바르다가 사랑한 얼굴들</p>
										<ul>
											<li><em>장소: </em><span>디뮤지엄</span></li>
											<li><em>일시: </em> 2022.03.01 ~ 2022.03.31</li>
										</ul>
									</div>
								</div>
								<div class="btn-group">
									<div class="btn-area search-hidden-btn">
										<button id="btn104" type="button" class="secondary small">자세히
											보기</button>
									</div>
									<div class="btn-area search-hidden-btn">
										<button id="btn105" type="button" class="primary small">예매하기</button>
									</div>
								</div>
							</dd>
							<dd>
								<div class = "introduce-menu">
									<div class="img-area">
										<img
											src="https://cdn.daelimmuseum.org/Program/Event/List/B/Big/202205/20220506172622618001.png"
											alt="로맨틱 로드 : 성수동&amp;서울숲의 로맨틱한 플레이스" style="">
									</div>
									<div class="info-area">
										<p class="tag">행사</p>
										<p class="title">로맨틱 로드 : 성수동&amp;서울숲의 로맨틱한 플레이스</p>
										<ul>
											<li><em>장소: </em><span>디뮤지엄</span></li>
											<li><em>일시: </em> 2022.07.31 ~ 2022.10.30</li>
										</ul>
									</div>
								</div>
								<div class="btn-group">
									<div class="btn-area">
										<button id="btn107" type="button" class="secondary small">자세히
											보기</button>
									</div>
									<div class="btn-area search-hidden-btn">
										<button id="btn108" type="button" class="primary small">예매하기</button>
									</div>
								</div>
							</dd> -->
						</dl>
					</div>
					<ul class="guidance-area" style="display: block;">
						<li>
							<p>
								<span>검색 결과가 없습니다.</span>
							</p>
						</li>
					</ul>
				</div>
			</div>
			<div  class="sub-contents-area">
				<!---->
			</div>
			<div  class="sub-contents-area">
				<!---->
			</div>
			<div  class="sub-contents-area">
				<!---->
			</div>
		</div>
	</section>
	
	<!-- footer Include -->
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	
</body>
</html>