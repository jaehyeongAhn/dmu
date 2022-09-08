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
					
	
					$("#data-v-8ed31374_btn").click(function(){
					 	
						
						
					});
					
					
					
					/*********************
						전시 등록폼 유효성 체크
					**********************/
					$("#btn_exhibition_Write").click(function(){
						 
					
				 		if($("#dexhibtion").val() == ""){
							alert("제목을 입력해주세요");
						 
							return false;
						}else{
							//서버전송
							ticketlistform.submit();
						} 
					});
	
		
		
		}); 
		