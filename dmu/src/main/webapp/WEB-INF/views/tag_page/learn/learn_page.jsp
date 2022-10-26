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
<!-- <meta name="twitter:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg">
    <meta property="og:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg"> -->
<link rel="icon" href="/favicon.ico">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/learn_page.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/tag_page.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script> 
	$(document).ready(function(){
	     
		$(".daydesc").click(function(){
			var test = $(this).attr("id"); 
			$(".daydesc").css("color","#9999").css("font-weight","400");
			$("#"+test).css("font-weight","bold").css("color","black");
			
			//.css("font-weight","bold");
			var day = $(this).attr("id");
			var dtarget ="${dtarget}";
			
			$.ajax({
				url : 'learn_page_ajaxlist.do?day='+day+'&dtarget='+dtarget, // 이주소로 보낼건데 
				type : "get" , //어떤 방식으로 보낼거야?
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					let dataset = JSON.parse(data);
					var output =  "<ul data-v-e20ce500='' data-v-080a389a='' class='img-list education-list ink' id='learnpast'>"
						for(aj of dataset.list){
						output += "<li data-v-e20ce500='' data-v-080a389a='' class='learn-previous'>"
						output += "<a data-v-e20ce500='' data-v-080a389a='' href='learn.do?did="+aj.did+"'>"
						output += "<div data-v-e20ce500='' data-v-080a389a='' class='img-area'>"
						output += "<img data-v-2fed1a9a='' data-v-e20ce500='' src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile +"' data-v-080a389a='' style=''>"
						output += "</div>"
						output += "<div data-v-e20ce500='' data-v-080a389a='' class='info-area'>"
						output += "<ul data-v-e20ce500='' data-v-080a389a='' class='flag-list'>"
						output += "<li data-v-e20ce500='' data-v-080a389a='' class='skyblue'>"+aj.dnum +"'</li>"
						output += "	<li data-v-e20ce500='' data-v-080a389a='' class='orange'>"+aj.dplace+"</li>"
						output += "</ul>"
						output += "<strong data-v-e20ce500='' data-v-080a389a='' class='sub-title'>"+aj.dtitle+"</strong>"
						output += "<p data-v-e20ce500='' data-v-080a389a='' class='sub-title-text'>"+ aj.dtitle2+"</p>"
						output += "<ul data-v-e20ce500='' data-v-080a389a='' class='info-list'>"
						output += "<li data-v-e20ce500='' data-v-080a389a=''>"
						output += "<strong data-v-e20ce500='' data-v-080a389a=''>교육 진행</strong><span data-v-e20ce500='' data-v-080a389a=''>"+aj.dstart +"~"+ aj.dend +"</span>"
						output += "</li>"
						output += "<li data-v-e20ce500='' data-v-080a389a=''>"
						output += "<strong data-v-e20ce500='' data-v-080a389a=''>장소</strong>"
						output += "<span data-v-e20ce500='' data-v-080a389a=''>"+aj.dplace +"</span>"
						output += "</li>"
						output += "<li data-v-e20ce500='' data-v-080a389a=''>"
						output += "<strong data-v-e20ce500='' data-v-080a389a=''>정원</strong>"
						output += "<span data-v-e20ce500='' data-v-080a389a=''>"+aj.dpersonnel +"</span>"
						output += "</li>"
						output += "<li data-v-e20ce500='' data-v-080a389a=''>"
						output += "<strong data-v-e20ce500='' data-v-080a389a=''>교육시간</strong>"
						output += "<span data-v-e20ce500='' data-v-080a389a=''>"+aj.dtime +"</span>"
						output += "</li>"
						output += "<li data-v-e20ce500='' data-v-080a389a=''>"
						output += "<strong data-v-e20ce500='' data-v-080a389a=''>참가비</strong>"
						output += "<span data-v-e20ce500='' data-v-080a389a=''>"+aj.dprice +"</span>"
						output += "</li></ul></div></a></li>"
						}
						output += "</ul>"

					//3. 출력 
					$("#learnpast").remove();
					//$(".learn-previous").remove();
					$("#learnarea").after(output);
					
				},
			 	error : function(data){
			 		alert('error');
			 	}//error 출력 
			})//ajax
		});//click
		
		$(".laern_target1").click(function(){
			var test = $(this).attr("id"); 
			$(".laern_target1").css("color","#9999").css("font-weight","400");
			$("#"+test).css("font-weight","bold").css("color","black");
			
				
			
			var day = $(this).attr("id");
			var dtarget ="${dtarget}";
			$.ajax({
				url : 'learn_past_ajax.do?day='+day+'&dtarget='+dtarget,
				type : "get" ,
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					let dataset = JSON.parse(data);
					if(dataset.list.length !=0){
					var output =	"<div data-v-e20ce500='' data-v-080a389a='' class='previous-list' id='learn_list1'>"
						output +=	"<ul data-v-e20ce500='' data-v-080a389a='' id='learnpastday'>"
						for(vo2 of dataset.list){
						output +=	"<li data-v-e20ce500='' data-v-080a389a=''>"
						output +=	"<a data-v-e20ce500='' data-v-080a389a='' style='cursor: auto;'>"
						output +=	"<div data-v-e20ce500='' data-v-080a389a='' class='thumb'>"
						output +=	"<img data-v-2fed1a9a='' data-v-e20ce500='' src='http://localhost:9000/dmu/resources/upload/"+vo2.dsfile +"' data-v-080a389a='' style=''>"
						output +=	"<ul data-v-e20ce500='' data-v-080a389a='' class='flag-list'>"
						output +=	"<li data-v-e20ce500='' data-v-080a389a='' class='skyblue'>"+vo2.dplace +"</li>"
						output +=	"</ul> </div>"
						output +=	"<div data-v-e20ce500='' data-v-080a389a='' class='info'>"
						output +=	"<strong data-v-e20ce500='' data-v-080a389a='' class='title'>"+vo2.dtitle +"</strong>"
						output +=	"<p data-v-e20ce500='' data-v-080a389a='' class='text'>"+vo2.dinformation +"</p>"
						output +=	"<span data-v-e20ce500='' data-v-080a389a='' class='period'>"+vo2.dstart +" ~ "+vo2.dend +"</span>"
						output +=	"</div></a></li>"
						}
						output +=	"</ul></div>"		
					}else{
						var output =	"<div data-v-e20ce500='' data-v-080a389a='' class='previous-list' id='learn_list1'>"
						 output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";
						 output +="<p data-v-e20ce500='' data-v-080a389a=''>해당 연도의 지난 프로그램이 없습니다.</p></div></div>"
					}
					 
					
					
					
					
					
					
					$("#learn_list1").remove();
					$("#learn_list").after(output);
				},
			 	error : function(data){
			 		alert('error');
			 	}//error 출력 
			})//ajax
		});//click

	 
});  
</script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>

</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<main>
		<div class="root-container">
			<div class="content-wrapper">
				<section data-v-e20ce500="" class="sub-contents-wrap">
					<div data-v-e20ce500="">
						<div data-v-0d03d759="" data-v-e20ce500=""
							class="sub-top-area learn">
							<div data-v-0d03d759="" class="container">
								<h2 data-v-0d03d759="">${dtarget }</h2>
								<nav data-v-0d03d759="">
									<ul data-v-0d03d759="">
										<li data-v-0d03d759="" style="cursor: pointer;"><a href="index.do" style="opacity:0;">HOME</a></li>
										<li data-v-0d03d759="">LEARN</li>
										<li data-v-0d03d759="">${dtarget }</li>
										<!---->
									</ul>
								</nav>
							</div>
						</div>
						<div data-v-080a389a="" data-v-e20ce500="">
							<div data-v-080a389a="" class="snb-area">
								<ul data-v-080a389a="" class="snb">
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=유아">유아</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=어린이">어린이</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=청소년">청소년</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=대학생">대학생</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=성인">성인</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=교사">교사</a></li>
									<li data-v-080a389a="" class=""><a data-v-080a389a=""
										role="button" style="cursor: pointer;"
										href="learn_page.do?dtarget=전시해설">전시해설</a></li>
								</ul>
							</div>

							<div data-v-080a389a="" class="sub-contents-area">
								<div data-v-e20ce500="" data-v-080a389a="" class="container">
									<div data-v-e20ce500="" data-v-080a389a=""
										class="education-wrap">
										<div data-v-e20ce500="" data-v-080a389a=""
											class="education-area">
											<div data-v-e20ce500="" data-v-080a389a="" class="title-area">
												<h2 data-v-e20ce500="" data-v-080a389a="">NOW</h2>
											</div>

											<div data-v-e20ce500="" data-v-080a389a="" class="top-area"
												id="learnarea">
												<p data-v-e20ce500="" data-v-080a389a="" class="total">
													전체 <strong data-v-e20ce500="" data-v-080a389a="">${count}
													</strong>건
												</p>
												<div data-v-47432960="" data-v-e20ce500=""
													class="sorting-area" data-v-080a389a="">
													<ul data-v-47432960="">
														<li data-v-47432960="" class="daydesc" id="1"><a
															data-v-47432960="" style="cursor: pointer;">최신순</a></li>
														<li data-v-47432960="" class="daydesc" id="0"><a
															data-v-47432960="" style="cursor: pointer;">오래된순</a></li>
													</ul>
												</div>

											</div>
											<c:if test="${not empty list}">
												<ul data-v-e20ce500="" data-v-080a389a=""
													class="img-list education-list ink" id="learnpast">
													<c:forEach var="vo" items="${list}">
														<li data-v-e20ce500="" data-v-080a389a="">
														<a data-v-e20ce500="" data-v-080a389a="" href="learn.do?did=${vo.did }">
																<div data-v-e20ce500="" data-v-080a389a=""
																	class="img-area">
																	<img data-v-2fed1a9a="" data-v-e20ce500=""
																		src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"
																		data-v-080a389a="" style="">
																</div>

																<div data-v-e20ce500="" data-v-080a389a=""
																	class="info-area">
																	<ul data-v-e20ce500="" data-v-080a389a=""
																		class="flag-list" id=".learnpast">
																		<li data-v-e20ce500="" data-v-080a389a=""
																			class="skyblue" id="learn-previous">${vo.dnum }</li>
																		<li data-v-e20ce500="" data-v-080a389a=""
																			class="orange">${vo.dplace}</li>
																		<!---->
																		<!---->
																	</ul>

																	<strong data-v-e20ce500="" data-v-080a389a=""
																		class="sub-title">${vo.dtitle }</strong>
																	<p data-v-e20ce500="" data-v-080a389a=""
																		class="sub-title-text">${vo.dtitle2 }</p>

																	<ul data-v-e20ce500="" data-v-080a389a=""
																		class="info-list">
																		<li data-v-e20ce500="" data-v-080a389a=""><strong
																			data-v-e20ce500="" data-v-080a389a="">교육 진행</strong>
																			<span data-v-e20ce500="" data-v-080a389a="">${vo.dstart }~${vo.dend }</span></li>
																		<li data-v-e20ce500="" data-v-080a389a=""><strong
																			data-v-e20ce500="" data-v-080a389a="">장소</strong> <span
																			data-v-e20ce500="" data-v-080a389a="">${vo.dplace }</span>
																		</li>
																		<li data-v-e20ce500="" data-v-080a389a=""><strong
																			data-v-e20ce500="" data-v-080a389a="">정원</strong> <span
																			data-v-e20ce500="" data-v-080a389a="">${vo.dpersonnel }</span>
																		</li>
																		<li data-v-e20ce500="" data-v-080a389a=""><strong
																			data-v-e20ce500="" data-v-080a389a="">교육시간</strong> <span
																			data-v-e20ce500="" data-v-080a389a="">${vo.dtime }</span>
																		</li>
																		<li data-v-e20ce500="" data-v-080a389a=""><strong
																			data-v-e20ce500="" data-v-080a389a="">참가비</strong> <span
																			data-v-e20ce500="" data-v-080a389a="">${vo.dprice }</span>
																		</li>
																	</ul>
																</div>
														</a></li>
													</c:forEach>
												</ul>
												<!---->
											</c:if>
											<c:if test="${empty list }">
												<div data-v-97ddc3ec="" class="no-data">
													<div data-v-e20ce500="" data-v-080a389a=""
														class="no-result">
														<p data-v-e20ce500="" data-v-080a389a="">지금은 프로그램을
															준비중입니다.</p>
													</div>
												</div>
											</c:if>
										</div>
									</div>
									<div data-v-e20ce500="" data-v-080a389a=""
										class="education-area">
										<div data-v-e20ce500="" data-v-080a389a="" class="title-area">
											<h2 data-v-e20ce500="" data-v-080a389a="">지난 프로그램</h2>
										</div>
										<div data-v-bc272086="" data-v-e20ce500=""
											class="select-year-area" data-v-080a389a="" id="learn_list">
											<div data-v-bc272086="" class="select-slide">
												<div data-v-bc272086="" class="year-list-box">
													<ul data-v-bc272086="" class="year-list"
														style="width: 704px; margin-left: 0px;">
														<li data-v-bc272086="" class=""><a
															data-v-bc272086="" id="" href="learn_page.do?dtarget=${dtarget }"
															role="button">전체</a></li>
														<li data-v-bc272086="" class="laern_target1" id="2022-01-01"><a
															data-v-bc272086=""  role="button">2022</a></li>
														<li data-v-bc272086="" class="laern_target1" id="2021-01-01"><a
															data-v-bc272086=""  role="button">2021</a></li>
														<li data-v-bc272086="" class="laern_target1" id="2020-01-01"><a
															data-v-bc272086=""  role="button">2020</a></li>
														<li data-v-bc272086="" class="laern_target1" id="2019-01-01"><a
															data-v-bc272086=""  role="button">2019</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div data-v-e20ce500="" data-v-080a389a=""
											class="previous-list" id="learn_list1">
											<c:if test="${not empty list2}">
											<ul data-v-e20ce500="" data-v-080a389a="" id="learnpastday">
											<c:forEach var="vo2" items="${list2}">
												<li data-v-e20ce500="" data-v-080a389a=""><a
													data-v-e20ce500="" data-v-080a389a=""
													href="javascript:void(0);" style="cursor: auto;"><div
															data-v-e20ce500="" data-v-080a389a="" class="thumb">
															<img data-v-2fed1a9a="" data-v-e20ce500=""
																src="http://localhost:9000/dmu/resources/upload/${vo2.dsfile }"
																 data-v-080a389a="" style="">
															<ul data-v-e20ce500="" data-v-080a389a=""
																class="flag-list">
																<li data-v-e20ce500="" data-v-080a389a=""
																	class="skyblue">${vo2.dplace }</li>
															</ul>
														</div>
														<div data-v-e20ce500="" data-v-080a389a="" class="info">
															<strong data-v-e20ce500="" data-v-080a389a=""
																class="title">${vo2.dtitle }</strong>
															<p data-v-e20ce500="" data-v-080a389a="" class="text">${vo2.dinformation }</p>
															<span data-v-e20ce500="" data-v-080a389a=""
																class="period">${vo2.dstart } ~ ${vo2.dend } </span>
														</div></a></li>
														</c:forEach>
											</ul>
											</c:if>
											<c:if test="${empty list2 }">
												 <div data-v-e20ce500="" data-v-080a389a="" class="no-result">
											<p data-v-e20ce500="" data-v-080a389a="">해당 연도의 지난 프로그램이
												없습니다.</p>
											</div> 
											</c:if>
											<div data-v-e3917d8a="" class="btn-program-more" >
								<div data-v-26e42198="" data-v-e3917d8a="" class="btn-area" id="js-btn-wrap" class="btn-wrap">
									<button data-v-26e42198="" id="btn50" name="btn50" type="button" class="secondary more"  >더보기</button>
								</div>
							</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>

					</div>
					<!---->
					<!---->
			</div>
			</section>
		</div>
		</div>
	</main>
	<script type="text/javascript"
		src="/js/chunk-vendors.85a954b2b4f1348cc700.js"></script>
	<script type="text/javascript" src="/js/index.85a954b2b4f1348cc700.js"></script>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no"
		frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>
</body>
</html>