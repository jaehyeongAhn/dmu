<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<meta name="format-detection" content="telephone=no">
<link rel="icon" href="/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/exhibition_past_page.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/tag_page2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script> 
	$(document).ready(function(){
	     
		$(".day_target").click(function(){
			var test = $(this).attr("id"); 
			$(".day_target").css("color","#9999").css("font-weight","400");
			$("#"+test).css("font-weight","bold").css("color","black");
			
			//.css("font-weight","bold");
			var day = $(this).attr("id");
			
			$.ajax({
				url : 'exhibition_past_ajaxlist2.do?day='+day, // 이주소로 보낼건데 
				type : "get" , //어떤 방식으로 보낼거야?
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					//1. 서버에서 전송된 콜백함수의 파라미터값을 JSON 객체 변환 
					let dataset = JSON.parse(data);
					
					//2. JSON 객체를 Dynamic HTML를 이용하여 화면에 결과 출력
							if(dataset.list.length !=0){
							var output ="<ul data-v-0157d8cb=''id='exhibitionpast'>";
							for(aj of dataset.list){
							output +="<div data-v-0157d8cb='' class='item-previous' id='itemprevious' >"
							output +="<a data-v-0157d8cb='' class='thumb'style='cursor: pointer;''>"
							output +="<img data-v-2fed1a9a='' data-v-0157d8cb=''src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+"' alt='TONG’s VINTAGE : 기묘한 통의 만물상'class='pc' style='width:100%;'></a>"
							output +="<div data-v-0157d8cb='' class='info'>"
							output += "<span data-v-0157d8cb='' class='place'>"+aj.dplace+"</span>"
							output += "<div data-v-0157d8cb='' style='cursor: pointer;'>"
							output +="<span data-v-0157d8cb='' class='title'>"+aj.dtitle+"</span>"
							output +="<span data-v-0157d8cb='' class='subtitle'>"+aj.dtitle2+"</span>"
							output +="</div>"
							output +="<span data-v-0157d8cb='' class='term'>"+  aj.dstart+ "~"+aj.dend+ "</span>"
							output +="</div>"
							output +="</div>"
							}
							output +="</ul>"
							}else{
							var output =	"<div data-v-e20ce500='' data-v-080a389a='' class='previous-list' id='learn_list1'>"
							 output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";
							 output +="<p data-v-e20ce500='' data-v-080a389a=''>지금은 전시를 준비 중입니다.</p></div></div>"
							}
					//3. 출력 
					$(".item-previous").remove();
					$("#exhibitionpast").remove();
					$("#learn_list1").remove();
					$("#previous-list").append(output);
					
				},
			 	error : function(data){
			 		alert('error');
			 	}//error 출력 
			})//ajax
		});//click

			
	$('#more_button').click(function(){
								
	//$(location).attr('href', "http://localhost:9000/dmu/adminlearn_list.do?rpage="+${rpage+1});         
							    
			});  
});  
</script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body class="">
	<!-- header  -->
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<main>
		<section data-v-0157d8cb="" class="sub-contents-wrap">
			<div data-v-0d03d759="" data-v-0157d8cb=""
				class="sub-top-area previous">
				<div data-v-0d03d759="" class="container">
					<h2 data-v-0d03d759="">지난 전시</h2>
					<nav data-v-0d03d759="">
						<ul data-v-0d03d759="">
							<li data-v-0d03d759="" style="cursor: pointer;">HOME</li>
							<li data-v-0d03d759="">EXHIBITION</li>
							<li data-v-0d03d759="">지난 전시</li>
							<!---->
						</ul>
					</nav>
				</div>
			</div>
			<div data-v-080a389a="" data-v-0157d8cb="">
				<div data-v-080a389a="" class="snb-area">
					<ul data-v-080a389a="" class="snb">
						<li data-v-080a389a="" class=""><a data-v-080a389a=""
							href="exhibition_past_page.do" role="button"
							style="cursor: pointer;">전체</a></li>
						<li data-v-080a389a="" class=""><a data-v-080a389a=""
							href="exhibition_past_page1.do" role="button"
							style="cursor: pointer;">대림미술관 &amp; 디뮤지엄</a></li>
						<li data-v-080a389a="" class="on"><a data-v-080a389a=""
							href="exhibition_past_page2.do" role="button"
							style="cursor: pointer;">구슬모아당구장</a></li>
					</ul>
				</div>
				<div data-v-080a389a="" class="sub-contents-area"></div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
				<div data-v-080a389a="" class="sub-contents-area">
					<!---->
				</div>
			</div>
			<div data-v-0157d8cb="" class="sub-contents-area"
				style="min-height: 400px;">
				<div data-v-0157d8cb="">
					<div data-v-0157d8cb="" class="previous-list" id="previous-list">
						<div data-v-bc272086="" data-v-0157d8cb=""
							class="select-year-area" id="select-year-area">
							<div data-v-bc272086="" class="select-slide">

								<div data-v-bc272086="" class="year-list-box">
									<ul data-v-bc272086="" class="year-list"
										style="width: 832px; margin-left: 0px;">
										<li data-v-bc272086="" class=""><a data-v-bc272086=""
											id="" href="exhibition_past_page2.do" role="button">전체</a></li>
										<li data-v-bc272086="" class=""><a data-v-bc272086=""
											id="2022-01-01" class="day_target" role="button">2022</a></li>
										<li data-v-bc272086="" class=""><a data-v-bc272086=""
											id="2021-01-01" class="day_target" role="button">2021</a></li>
										<li data-v-bc272086="" class=""><a data-v-bc272086=""
											id="2020-01-01" class="day_target" role="button">2020</a></li>
										<li data-v-bc272086="" class=""><a data-v-bc272086=""
											id="2019-01-01" class="day_target" role="button">2019</a></li>
									</ul>
								</div>

							</div>
						</div>
						<c:if test="${not empty list}">
						<ul data-v-0157d8cb="" id="exhibitionpast">
							<c:forEach var="vo" items="${list}">
								<div data-v-0157d8cb="" class="item-previous">
									<c:if test="${vo.dsfile != null }">
										<a data-v-0157d8cb="" href="javascript:;" class="thumb"
											style="cursor: pointer;"><img data-v-2fed1a9a=""
											data-v-0157d8cb=""
											src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"
											alt="TONG’s VINTAGE : 기묘한 통의 만물상" class="pc" style=""><img
											data-v-2fed1a9a="" data-v-0157d8cb=""
											src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"
											alt="TONG’s VINTAGE : 기묘한 통의 만물상" class="mo" style=""></a>
									</c:if>
									<div data-v-0157d8cb="" class="info">
										<span data-v-0157d8cb="" class="place">${vo.dplace }</span>
										<div data-v-0157d8cb="" style="cursor: pointer;">
											<span data-v-0157d8cb="" class="title">${vo.dtitle }</span><span
												data-v-0157d8cb="" class="subtitle">${vo.dtitle2 }</span>
										</div>
										<span data-v-0157d8cb="" class="term"> ${vo.dstart } ~
											${vo.dend } </span>
									</div>
								</div>
							</c:forEach>
						</ul>
						</c:if>
							<c:if test="${empty list }">
										<div data-v-97ddc3ec="" class="item-previous">
											<div data-v-e20ce500="" data-v-080a389a=""
														class="item-previous">
														<p data-v-e20ce500="" data-v-080a389a="">지금은 전시를 준비 중입니다.
														</p>
										</div>
								</div>
							</c:if>
					</div>

					<div data-v-e3917d8a="" class="btn-program-more">
						<div data-v-26e42198="" data-v-e3917d8a="" class="btn-area"
							id="js-btn-wrap" class="btn-wrap">
							<button data-v-26e42198="" id="btn50" name="btn50" type="button"
								class="secondary more">더보기</button>
						</div>
					</div>

				</div>
			</div>
			
		</section>
	</main>


	<!-- footer -->
<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
</body>
</html>