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
      	var start = $("#dstart").val().split("-");
      	var end = $("#dend").val().split("-");
      
      
         if($("#dtitle").val() == ""){
            alert("제목을 입력해주세요");
            $("#dtitle").focus();
            return false;
         }else if($("#dcode").val() =="default"){
            alert("코드를 선택해주세요")
            $("#dcode").focus();
            return false;
         }else if($("#dplace").val() =="default"){
            alert("장소를 선택해주세요")
            $("#dplace").focus();
            return false;
         }else if($("#dcode").val() =="learn"&& $("#dtarget").val() =="default"){
            alert("대상을 선택해주세요")
            $("#dtarget").focus();
            return false;
         }else if($("#dcode").val() !="learn"&& $("#dtarget").val() !="default"){
            alert("learn일때만 대상을 선택할수 있습니다.")
            $("#dtarget").focus();
            return false;
         }else if($("#dprice").val() == ""){
            alert("가격을 입력해주세요.");
            $("#dprice").focus();
            return false;
         }else if($("#dpersonnel").val() == ""){
            alert("정원을 입력해주세요.");
            $("#dpersonnel").focus();
            return false;
         }else if($("#dnum").val() == ""){
            alert("교육횟수를 입력해주세요.");
            $("#dnum").focus();
            return false;
         }else if($("#file_list").val() == ""){
            alert("파일을 선택해주세요.");
            return false;
         }else if(start > end){
         	alert("유효하지 않은 날짜입니다.")
         	$("#dstart").focus();
         	return false;
         }else if(start == "" || end == ""){
         	alert("날짜를 선택해주세요");
         	$("#dstart").focus();
         	return false;
         	
         }else{
               //서버전송
               ticketlistform.submit();
         
         } 
      });

					
					
		/*********************
		티켓리스트 수정폼 유효성 체크
		**********************/
		$("#btnTicketUpdate").click(function(){
			
			if($("#dtitle").val() == ""){
				alert("제목을 입력해주세요");
				$("#dtitle").focus();
				return false;
			}else{
				//서버전송
			ticketUpdateForm.submit();
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

		