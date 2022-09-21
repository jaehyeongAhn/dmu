$(document).ready(function(){

					//exhibition 단체예매 신청 --> login 페이지 이동
					$("#btn25").click(function(){
						// alert("bb");
						$(location).attr("href","http://localhost:9000/dmu/login.do");
					/*	const id = document.getElementById("did");
						
						if(did.value == ""){
							$(location).attr("href","http://localhost:9000/dmu/login.do");
						}else{
							$(location).attr("href","http://https://www.daelimmuseum.org/ticket/reservation/group?prgIdx=PRG202202230001&prgTypeCd=PG00101");
						} */
					});
					
	
				 
					
					
				 
					/*********************
						관람일및 회차,관람인원 및 권종 버튼 토글
					**********************/
					  $("#data-v-8ed31374_btn").click(function() {						
   							 
   							 $("#calendar").toggle();  
   							 
  						});
 
		
					 $("#btn_toggle").click(function() {						
   							 
   							 $("#content").toggle();  
  						});
  						
  						
					$("#btb_toggle_hide").click(function() {						
						 
						 $("#content_hide").toggle();  
					});
		
		
		
					/*********************
						전시 등록폼 유효성 체크
					**********************/
					$("#btn_exhibition_Write").click(function(){
						 
					
				 		if($("#dtitle").val() == ""){
							alert("제목을 입력해주세요");
						 
							return false;
						}else{
							//서버전송
							ticketlistform.submit();
						} 
					});
		
		}); 
		