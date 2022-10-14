	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dmu</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/tiket.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script> 
	$(document).ready(function(){
	     
		$(".learn_target").click(function(){
			var test = $(this).attr("id"); 
			$(".learn_target").css("color","#9999").css("font-weight","400");
			$("#"+test).css("font-weight","bold").css("color","black");
			
			//.css("font-weight","bold");
			var dtarget = $(this).attr("id");
			
			$.ajax({
				url : 'adminlearn_ajaxlist.do?dtarget='+dtarget, // 이주소로 보낼건데 
				type : "get" , //어떤 방식으로 보낼거야?
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					//1. 서버에서 전송된 콜백함수의 파라미터값을 JSON 객체 변환 
					let dataset = JSON.parse(data);
					//2. JSON 객체를 Dynamic HTML를 이용하여 화면에 결과 출력
						var output2 ="<div data-v-7b1f57c8='' class='sub-contents-area'>"
							output2 +="<div data-v-41f56098='' data-v-7b1f57c8='' class='container'>"
						var output1 = "<div class='list-top-area'  id='list-top-area1' style='display:flex'>"
							output1 +="<span data-v-41f56098='' class='total'>총 <strong>"+dataset.dbCount+"</strong>건</span>"
							output1 +="<ul data-v-41f56098='' class='order' >"
							
							output1 +="<li data-v-41f56098='' class='on'>"
							output1 +="<a data-v-41f56098='' href='javascript:void(0);'>시작일 순</a></li>"
							output1 +="<li data-v-41f56098='' class=''>"
							output1 +="<a data-v-41f56098='' href='javascript:void(0);'>종료일 순</a></li></ul>"
							output1 +="</div>"
							
						var	output = "<div class='ticket-list learn' id='ticket_list_learn'>";
						for(aj of dataset.list){
					   	output += "<ul data-v-41f56098=''>";
						output +="<li data-v-41f56098=''>";
						output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/ticketlist_content.do?did= "+ aj.did+" '  class='thumb'>"
						output +="<img data-v-2fed1a9a='' data-v-1e8092ec=''src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+" '>"
						output +="</a>"
						output +="<ul data-v-41f56098='' class='flag'>"
						output +="<li data-v-41f56098=''>"+ aj.dnum + "회성 교육</li>"
						output +="<li data-v-41f56098=''>"+ aj.dplace + "</li>"
						output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/learn_list.do?did="+aj.did+"' class='title'>" +aj.dtitle +"</a>"
						
						output +="<p data-v-41f56098='' class='explan'>" + aj.dtitle2 +"</p>"
						output +="</ul>"
						
						output +="<ul data-v-41f56098='' class='info'>"
						
						output +="<li data-v-41f56098=''>"
						output +="<span data-v-41f56098='' class='tit'> 교육진행 </span>"
						output +="<span data-v-41f56098='' class='txt'>"+aj.dstart+ "~" +aj.dend+"</span>"
						output +="</li>"
						
						output +="<li data-v-41f56098=''>"
						output +="<span data-v-41f56098='' class='tit'> 장소  </span>"
						output +="<span data-v-41f56098='' class='txt'>"+ aj.dplace +"</span>"
						output +="</li>"
						
						output +="<li data-v-41f56098=''>"
						output +="<span data-v-41f56098='' class='tit'> 대상 </span>"
						output +="<span data-v-41f56098='' class='txt'>"+ aj.dtarget +"</span>"
						output +="</li>"
						
						output +="<li data-v-41f56098=''>"
						output +="<span data-v-41f56098='' class='tit'> 교육시 </span>"
						output +="<span data-v-41f56098='' class='txt'>"+ aj.dtime +"</span>"
						output +="</li>"
						
						output +="<li data-v-41f56098=''>"
						output +="<span data-v-41f56098='' class='tit'> 참가비 </span>"
						output +="<span data-v-41f56098='' class='txt'>"+ aj.dprice +"</span>"
						output +="</li>"
						output +="</ul>"
						output +="</li>"
						output +="</ul>" 
					}//for
						output +="</div>" 
						output +="</div>" 
						output +="</div>" 
						//alert(output);
					//3. 출력 
					$("#list-top-area1").remove();
					$("#ticket_list_learn").remove();
					$(".division-list").after(output1); 
					$(".list-top-area").after(output); 
					
				},
			 	error : function(data){
			 		alert('error');
			 	}//error 출력 
			})//ajax
		});//click

			
	$('#more_button').click(function(){
								
	$(location).attr('href', "http://localhost:9000/dmu/learn_list.do?rpage="+${rpage+1});         
							    
			});  
});  
</script>
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
					<span data-v-6d324aa0="" class="no">01</span>.
					<span data-v-6d324aa0="" class="txt">티켓 선택</span>
				</li>
				
				<li data-v-6d324aa0="" class="">
					<span data-v-6d324aa0="" class="no">02</span>.
					<span data-v-6d324aa0="" class="txt">관람일/인원 선택</span>
				</li>
				
				<li data-v-6d324aa0="" class="">
					<span data-v-6d324aa0="" class="no">03</span>.
					<span data-v-6d324aa0="" class="txt">결제</span>
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
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_targetall"  href="http://localhost:9000/dmu/adminlearn_list.do"  >전체</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="유아">유아</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="어린이" >어린이</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="청소년" >청소년</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="대학생" >대학생</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="성인" >성인</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="교사" >교사</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" class="learn_target" id="전시해설">전시해설</a>
				</li>
			</ul>
		</div>
		
<div data-v-41f56098="" class="list-top-area" id="list-top-area1">

		<span data-v-41f56098="" class="total">총 <strong>${dbCount}</strong>건</span>
			<ul data-v-41f56098="" class="order">
				
				<li data-v-41f56098="" class="on">
					<a data-v-41f56098="" href="javascript:void(0);">시작일 순</a>
				</li>
				
				<li data-v-41f56098="" class="">
					<a data-v-41f56098="" href="javascript:void(0);">종료일 순</a>
				</li>
			</ul>
		</div>
	<div data-v-41f56098="" class="ticket-list learn" id="ticket_list_learn">
			<c:forEach var="vo" items="${list}">
			
			<ul data-v-41f56098="">
				<li data-v-41f56098="">
						<c:if test="${vo.dsfile != null }">
					<a data-v-41f56098="" href="http://localhost:9000/dmu/learn.do?did=${vo.did}" class="thumb">
						<img data-v-2fed1a9a="" data-v-1e8092ec=""src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"></a>
						</c:if>
				
			<ul data-v-41f56098="" class="flag">
				<li data-v-41f56098="">${vo.dnum}회성 교육</li>
				<li data-v-41f56098="">${vo.dplace}</li>
				<li data-v-41f56098="">${vo.dplace}</li>
				
			<!---->
			<!---->
			</ul>
				
					<a data-v-41f56098="" href="http://localhost:9000/dmu/learn.do?did=${vo.did}"
					class="title">${vo.dtitle}</a>
					
					<p data-v-41f56098="" class="explan">${vo.dtitle2 }</p>
					
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
				</li>
			</ul>
			
			</c:forEach>								
				
			
		
	</div>
	
			 <c:if test= "${ rpage lt pageCount }"> 
				<div data-v-41f56098="" class="btn-more-area">
				<div data-v-26e42198="" data-v-41f56098="" class="btn-area" >
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

		<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer" style="margin-bottom:-5px" ></iframe>
	</body>

</html>