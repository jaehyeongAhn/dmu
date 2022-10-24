
$(document).ready(function(){
 
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
	
	
/***********02.관람일/인원선택 페이지***********/
	/*********************
	관람일및 회차,관람인원 및 권종 버튼 토글
	**********************/
		$("#data-v-8ed31374_btn").click(function() {												 
			$("#calendar").toggle();  							 
  		});

		$("#btn_toggle1").click(function() {									 	 
   			$("#content1").toggle(); 			
  		});
  		
		 
	/*********************
	 달력 일자 클릭시 회차 버튼 활성화
	**********************/
		$("#entertime").click(function(){
 
			$( '.entertime' ).prop( 'selection', this.selection );
			$("#entertime").prop("disabled", !this.checked);
						
			$("#rtime").val($("#content").text());
						
		});	
		
	/*********************
	회차 클릭시 관람인원 버튼 활성화
	**********************/
	$("#content").click(function(){
		$("#content_hide").show();				
	});	
		
	 
	/*********************
	카운트 체크
	**********************/
		 	 
	$('#decreaseQuantity').click(function(e) {
		alert("aaa");
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
 	    	     
	    if($("#rdate").val() == ""){	         	           
            return false;
         }else if($("#rtime").val() == ""){	             	            
            return false;
        }else if($("#rtotal").val() == ""){	            
            return false;
    	}else if($("#rtotal").val() != ""){		 	
    	    $("#btn32").prop("disabled", !this.checked); 
    	    $("#rallprice").val($("#rprice").val()*$("#rtotal").val());      	    	    
        }else{ }
	});	
		
	/*********************
	 관람인원 변경시 체크박스 해제
	**********************/
	$("#countpeople").click(function(){		 
		$("input:checkbox[id='check30']").prop("checked", false );				 
	}); 
	
	$("#increaseQuantity").click(function(){		 
		$("input:checkbox[id='check30']").prop("checked", false );				 
	}); 
		
		
		
			
	 	/*********************
		 예매하기 클릭 시 비로그인일때 유효성 체크
		**********************/
		$("#btn32").click(function(){
		 if($("#mid").val() == ""){
      	 
       	 $(location).attr("href","http://localhost:9000/dmu/login.do");
            return false;   
		}else {			 	
			ticket_exhibitionFrom.submit();
		 }			 
	});		


	/*********************
	 결제 팝업ㅡ 결제시 결제정보 넘기기
	**********************/
    
    $("#popup_payment").click(function(){
		$("form").attr({
            "name" : "paymentForm",
            "action" : "paymenInsert.do"
        })
     	paymentForm.submit();
    });
 
 	
		/***********03.결제***********/		
		/*********************
		예약 티켓 정보에 대한 동의 후 결제하기 클릭 이벤트
		**********************/
		$("#check287").click(function(){
	 
		 
			$( '.check287' ).prop( 'checked', this.checked );
			$("#btn289").prop("disabled", !this.checked);
			$("#rallprice").val($("#rprice").val()*$("#rtotal").val());      		 
		});
			
 			
 }); //ready

		
