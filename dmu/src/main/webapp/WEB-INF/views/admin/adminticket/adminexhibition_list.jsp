<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/tiket.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
$(document).ready(function(){
	$('.orderby').click(function(){
		$(".orderby").removeClass("on");
		$(this).addClass("on");
		var day = $(".orderby.on").attr("id");
		ajax_orderby_list(day,1);
	});
		ajax_orderby_list(0,1);
			function ajax_orderby_list(day,rpage){
			$.ajax({
				url : 'orderby_exhibition_ajaxlist.do?day='+day+"&rpage="+rpage, 
				type : "get" ,
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					let dataset = JSON.parse(data);
				  	
						if(dataset.list.length !=0){	
						var	output = "<div data-v-3c1f59cb='' class='ticket-list exhibition' id='ticket_list_exhibition'>";
						for(aj of dataset.list){
							output +=	"<ul data-v-3c1f59cb=''>"
							output +=	"<li data-v-3c1f59cb=''>"
							output +=	"<a data-v-3c1f59cb='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"' target='_parent' class='thumb'>"
							output +=	"<img data-v-2fed1a9a='' data-v-1e8092ec='' src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+"'>"
							output +=	"</a> <span data-v-3c1f59cb='' class='place'>"+aj.dplace+"</span>"
							output +=	"<a data-v-3c1f59cb='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"' target='_parent' class='title'>"+aj.dtitle+"</a>"  
							output +=	"<p data-v-3c1f59cb='' class='explan'></p>" 
							output +=	"<span	data-v-3c1f59cb='' class='term'>" +aj.dstart+" ~ "+aj.dend+"</span></li>"
							output +=	"</ul>"
					}//for
						
						output +="</div>" 
					
						var more_list = "<div data-v-41f56098='' class='btn-more-area' id='btn_learn'>";
	                    more_list += "<div data-v-26e42198='' data-v-41f56098='' class='btn-area'>"
	                    more_list += "<button data-v-26e42198='' id='more_button'class='secondary more'>더보기</button>";
	                    more_list += "</div></div>";
					}else{
					var output ="<div data-v-e20ce500='' data-v-080a389a='' class='previous-list' id='ticket_list_exhibition'>"
						output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";	
				 		output +="<p data-v-e20ce500='' data-v-080a389a=''>프로그램이 준비중입니다.</p></div></div>"
					}//else
						
						$("#ticket_list_exhibition").remove();
						$("#btn_learn").remove();
						$(".list-top-area").after(output);
						
						if(dataset.dbCount > dataset.endCount){
							$("#ticket_list_exhibition").after(more_list);
							$("#btn_learn").off("click").click(function(){
								 ajax_orderby_list(day, rpage+1);
							});
						}
					
				},
			 		error : function(data){
			 		alert('error');
			 		}
				})
		}
		$('#more_button').click(function(){
			
			$(location).attr('href', "http://localhost:9000/dmu/adminexhibition_list.do?rpage="+${rpage+1});
			});
			 var rpage = "${rpage}";
			if(rpage != 1){
				
			var offset = $(".list_move:nth-child(" + ((rpage-1) * 3 + 1) + ")").offset(); 
			$("html, body").scrollTop(offset.top); 
		} 
	});  				    
</script>

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
									<li data-v-6d324aa0="" class="on"><span
										data-v-6d324aa0="" class="no">01</span> <span
										data-v-6d324aa0="" class="txt">exhibition list</span></li>
									<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
										class="no">02</span> <span data-v-6d324aa0="" class="txt">ticket
											content</span></li>
									<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
										class="no">03</span> <span data-v-6d324aa0="" class="txt">write/update/delete</span>
									</li>
								</ul>
							</div>
							<div data-v-7b1f57c8="" class="container">
								<div data-v-7b1f57c8="" class="ticket-list-area">
									<div data-v-7b1f57c8="">
										<div data-v-7b1f57c8="" class="snb-area">
											<ul data-v-7b1f57c8="" class="snb">
												<li data-v-7b1f57c8="" class="on"><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminexhibition_list.do"
													role="button">EXHIBITION </a></li>

												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminlearn_list.do"
													role="button">LEARN </a></li>

												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminevent_list.do"
													role="button">EVENT </a></li>

											</ul>
										</div>
										<div data-v-7b1f57c8="" class="sub-contents-area">
											<div data-v-3c1f59cb="" data-v-7b1f57c8="" class="container">
												<div data-v-3c1f59cb="" class="list-top-area">


													<span data-v-3c1f59cb="" class="total">총 <strong>${dbCount }</strong>건
													</span>

													<ul data-v-3c1f59cb="" class="order">
														<li data-v-3c1f59cb="" class=""><a data-v-3c1f59cb=""
															href="adminticketlist_write.do">
																<button type="button" class="btn_style">글쓰기</button>
														</a></li>
														<li data-v-41f56098="" class="orderby" id="0"><a
															data-v-41f56098="">시작일 순</a></li>

														<li data-v-41f56098="" class="orderby" id="1"><a
															data-v-41f56098="">종료일 순</a></li>

													</ul>
												</div>
												<div data-v-3c1f59cb="" class="ticket-list exhibition"
													id="ticket_list_exhibition">
													<c:if test="${not empty list}">
														<c:forEach var="vo" items="${list}">
															<ul data-v-3c1f59cb="" class="list_move">
																<li data-v-3c1f59cb=""><a data-v-3c1f59cb=""
																	href="http://localhost:9000/dmu/adminticketlist_content.do?did=${vo.did}"
																	target="_parent" class="thumb"> <c:if
																			test="${vo.dsfile != null }">
																			<img data-v-2fed1a9a="" data-v-1e8092ec=""
																				src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }">
																		</c:if>
																</a> <span data-v-3c1f59cb="" class="place">
																		${vo.dplace } </span> <a data-v-3c1f59cb=""
																	href="http://localhost:9000/dmu/adminticketlist_content.do?did=${vo.did}"
																	target="_parent" class="title"> ${vo.dtitle } </a>

																	<p data-v-3c1f59cb="" class="explan"></p> <span
																	data-v-3c1f59cb="" class="term"> ${vo.dstart } ~ ${vo.dend } </span></li>

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
													<div data-v-41f56098="" class="btn-more-area" id="btn_learn">
														<div data-v-26e42198="" data-v-41f56098=""
															class="btn-area" id="btn_learn">
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