<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/tiket.css">
<link rel="stylesheet" href="http://localhost:9000/mycgv/resources/css/am-pagination.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){
	$('.orderby').click(function(){
		var day = $(this).attr("id");
		$(".orderby").removeClass("on");
		$(this).addClass("on");
		$.ajax({
			url : 'orderby_event_ajaxlist.do?day='+day, 
			type : "get" ,
			cache : false,
			headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
			success : function(data){
				let dataset = JSON.parse(data);
			  	
					if(dataset.list.length !=0){	
					var	output = "<div data-v-1e8092ec='' class='ticket-list event' id='ticket_list_event'>";
					for(aj of dataset.list){
						output +=	"<ul data-v-1e8092ec='' class='list_move'>"
						output +=	"<li data-v-1e8092ec=''>"
						output +=	"<a data-v-1e8092ec='' href='http://localhost:9000/dmu/adminticketlist_content.do?did'"+aj.did+"' class='thumb'>"
						output +=	"<img data-v-2fed1a9a='' data-v-1e8092ec='' src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+"'>"
						output +=	"</a>"
						output +=	"<a data-v-1e8092ec='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"' class='title'>"+aj.dtitle+"</a>" 
						output +=	"<ul data-v-1e8092ec='' class='info'>"
						output +=	"<li data-v-1e8092ec=''><span data-v-1e8092ec=''class='tit'>기간</span>"
						output +=	"<p data-v-1e8092ec='' class='date'>"+aj.dstart+" ~ "+aj.dend+"</p></li>"
						output +=	"<li data-v-1e8092ec=''><span data-v-1e8092ec=''class='tit'>장소</span>"
						output +=	"<p data-v-1e8092ec='' class='date'>"+aj.dplace+"</p></li>"
						output +=	"<li data-v-1e8092ec=''><span data-v-1e8092ec=''class='tit'>참가비</span>"
						output +=	"<p data-v-1e8092ec='' class='date'>"+aj.dprice+ "원" +"</p></li>"
						output +=	"<li data-v-1e8092ec=''><span data-v-1e8092ec=''class='tit'>대상</span>"
						output +=	"<p data-v-1e8092ec='' class='date'>"+aj.dtarget+"</p></li>"
						output +=	"</ul></li>"
						output +=	"</ul>"
				}//for
					output +="</div>" 
				}else{
				var output ="<div data-v-e20ce500='' data-v-080a389a='' class='previous-list' id='ticket_list_event'>"
					output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";	
			 		output +="<p data-v-e20ce500='' data-v-080a389a=''>프로그램 준비중입니다.</p></div></div>"
				}//else
					
					$("#ticket_list_event").remove();
					$(".list-top-area").after(output);
				
			},
		 		error : function(data){
		 		alert('error');
		 		}
			})
		});
		$('#more_button').click(function(){
			
			$(location).attr('href', "http://localhost:9000/dmu/event_list.do?rpage="+${rpage+1});
			});
			 var rpage = "${rpage}";
			if(rpage != 1){
				
			var offset = $(".list_move:nth-child(" + ((rpage-1) * 3 + 1) + ")").offset(); 
			$("html, body").scrollTop(offset.top); 
		} 
	});  				    
</script>
<style>
.no-result {
    padding: 9.375rem 0;
}
.no-result p[data-v-41f56098] {
    font-size: 1.5rem;
    line-height: 2.125rem;
    color: #999;
    text-align: center;
    letter-spacing: -0.0375rem;
    font-weight: 200;
}
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<main>
		<div data-v-ec5a0c2c="" class="root-container">
			<div data-v-ec5a0c2c="" class="content-wrapper">
				<div data-v-ec5a0c2c="" class="body-wrapper">
					<div data-v-7b1f57c8="" data-v-ec5a0c2c="">
						<div data-v-7b1f57c8="" class="sub-contents-area">
							<div data-v-6d324aa0="" data-v-7b1f57c8=""
								class="step-process-area">
								<ul data-v-6d324aa0="">
									<li data-v-6d324aa0="" class="on"><span data-v-6d324aa0=""
										class="no">01</span><span data-v-6d324aa0="" class="txt">.
											티켓 선택</span></li>
									<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
										class="no">02</span><span data-v-6d324aa0="" class="txt">.
											관람일/인원 선택</span></li>
									<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
										class="no">03</span><span data-v-6d324aa0="" class="txt">.
											결제</span></li>
								</ul>
							</div>
							<div data-v-7b1f57c8="" class="container">
								<div data-v-7b1f57c8="" class="ticket-list-area">
									<div data-v-7b1f57c8="">
										<div data-v-7b1f57c8="" class="snb-area">
											<ul data-v-7b1f57c8="" class="snb">
												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/exhibition_list.do"
													role="button">EXHIBITION </a></li>
												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/learn_list.do"
													role="button">LEARN </a></li>
												<li data-v-7b1f57c8="" class="on"><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/event_list.do"
													role="button">EVENT </a></li>
											</ul>
										</div>
										<div data-v-7b1f57c8="" class="sub-contents-area">
											<div data-v-1e8092ec="" data-v-7b1f57c8="" class="container">
												<div data-v-1e8092ec="" class="list-top-area">
													<span data-v-1e8092ec="" class="total">총 <strong>${dbCount}</strong>건
													</span>
													<ul data-v-1e8092ec="" class="order">

														<li data-v-41f56098="" class="orderby" id="0"><a
															data-v-41f56098="">시작일 순</a></li>

														<li data-v-41f56098="" class="orderby" id="1"><a
															data-v-41f56098="">종료일 순</a></li>

													</ul>
												</div>
												<div data-v-1e8092ec="" class="ticket-list event"
													id="ticket_list_event">
													<c:if test="${not empty list}">
														<c:forEach var="vo" items="${list}">
															<ul data-v-1e8092ec="" class="list_move">
																<li data-v-1e8092ec=""><c:if
																		test="${vo.dsfile != null }">
																		<a data-v-1e8092ec=""
																			href="http://localhost:9000/dmu/event.do?did=${ vo.getDid()}"
																			class="thumb"> <img data-v-2fed1a9a=""
																			data-v-1e8092ec=""
																			src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"></a>
																	</c:if> <a data-v-1e8092ec=""
																	href="http://localhost:9000/dmu/event.do?did=${ vo.getDid()}"
																	class="title"> ${vo.dtitle } </a>
																	<ul data-v-1e8092ec="" class="info">
																		<li data-v-1e8092ec=""><span data-v-1e8092ec="" class="tit">기간</span>
																		<p data-v-1e8092ec="" class="date">${vo.dstart } ~ ${vo.dend }</p></li>
																		<li data-v-1e8092ec=""><span data-v-1e8092ec="" class="tit">장소</span>
																		<p data-v-1e8092ec="" class="date">${vo.dplace }</p></li>
																		<li data-v-1e8092ec=""><span data-v-1e8092ec="" class="tit">참가비</span>
																		<p data-v-1e8092ec="" class="date">${vo.dprice }원</p></li>
																		<li data-v-1e8092ec=""><span data-v-1e8092ec="" class="tit">대상</span>
																		<p data-v-1e8092ec="" class="date">${vo.dtarget }</p></li>
																	</ul>
																	</li>


															</ul>
														</c:forEach>
													</c:if>
													<c:if test="${empty list }">
														<div data-v-97ddc3ec="" class="no-data">
															<div data-v-e20ce500="" data-v-080a389a=""
																class="no-result" id="ticket_list_exhibition">
																<p data-v-e20ce500="" data-v-080a389a="">지금은 프로그램을
																	준비중입니다.</p>
															</div>
														</div>
													</c:if>
													
												</div>
												<!---->
												<c:if test="${ rpage lt pageCount }">
													<div data-v-41f56098="" class="btn-more-area">
														<div data-v-26e42198="" data-v-41f56098=""
															class="btn-area">
															<button data-v-26e42198="" id="more_button"
																class="secondary more">더보기</button>

														</div>
													</div>
												</c:if>
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
	<iframe src="footer.do" width="100%" height="490px" scrolling="no"
		frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>
</body>
</html>