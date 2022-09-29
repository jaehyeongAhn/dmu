$(document).ready(function(){

					
	
				 
					
					
				 
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
					
					
					
					/*********************
						카운트 체크
					**********************/
			 	 
	 
					 
							  $('#decreaseQuantity').click(function(e) {
							    e.preventDefault();
							    var stat = $('#field40').text();
							    var num = parseInt(stat, 10);
							    num--;
							    if (num <= 0) {
							      alert('더이상 줄일수 없습니다.');
							      num = 1;
							    }
							    $('#numberUpDown').text(num);
							  });
							  $('#increaseQuantity').click(function(e) {
							    e.preventDefault();
							    var stat = $('#field40').text();
							    var num = parseInt(stat, 10);
							    num++;
							
							    if (num > 5) {
							      alert('더이상 늘릴수 없습니다.');
							      num = 5;
							    }
							    $('#field40').text(num);
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
					});
					
					
					
					/*********************
					 예매하기 클릭 시 관람일,회차,관람인원
					**********************/
					$("#btn32").click(function(){
			 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					ticket_reservationFrom.submit();
					});
					
		
		}); 
		