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
						관람시 유의사항 동의 체크 후 예매하기 클릭 이벤트
					**********************/
					$("#check30").click(function(){
						/*$( '.check30' ).prop( 'checked', this.checked );*/
						
						$( '.check30' ).prop( 'checked', function(){
						/*	if($(this).checked){*/
							
								alert("aaa");
							/*}*/
						
						});
						$("#btn32").prop("disabled", !this.checked);
						
						$("#rallprice").val($("#rprice").val()*$("#rtotal").val());
						
						
						
					});
					
					
					/*********************
					예약 티켓 정보에 대한 동의 후 결제하기 클릭 이벤트
					**********************/
					$("#check287").click(function(){
						$( '.check287' ).prop( 'checked', this.checked );
						$("#btn289").prop("disabled", !this.checked);
					});
					
					
					
					/*********************
					 달력 일자 클릭시 회차 버튼 활성화
					**********************/
					$("#content").click(function(){
 
						$( '.entertime' ).prop( 'selection', this.selection );
						$("#entertime").prop("disabled", !this.checked);
						
						$("#rtime").val($("#content").text());
						
					});
					
				 
					
					
					
					/*********************
					 예매하기 클릭 시 관람일,회차,관람인원
					**********************/
					$("#btn32").click(function(){
 
					 
					ticket_reservationFrom.submit();
					});
					
					
					/*********************
					 전문 보기
					**********************/
				
								
				
		
		}); //ready
