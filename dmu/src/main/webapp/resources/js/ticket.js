$(document).ready(function(){
      
   /********* popup setup *********/
   function popup_setup(guideLine) {
      $(".background_exhibition").addClass("show");
      $(".window_exhibition").addClass("show");
      $("#popup_title").text(guideLine);
      $("#popup_close").click(function() {
         $(".background_exhibition").removeClass("show");
         $(".window_exhibition").removeClass("show");
      });
   }
   
   /*********************
      전시 등록폼 유효성 체크
      **********************/
      $("#btn_exhibition_Write").click(function(){
         var start = $("#dstart").val().split("-");
         var end = $("#dend").val().split("-");
      
      
         if($("#dtitle").val() == ""){
            popup_setup("제목을 입력해주세요");
            $("#dtitle").focus();
            return false;
         }else if($("#dplace").val() =="default"){
            popup_setup("장소를 선택해주세요")
            $("#dplace").focus();
            return false;
         }else if($("#dentertime").val() ==""){
            popup_setup("회차를 선택해주세요")
             $("#dentertime").focus();
             return false;
         }else if(start > end){
            popup_setup("유효하지 않은 날짜입니다.")
            $("#dstart").focus();
            return false;
         }else if(start == "" || end == ""){
            popup_setup("날짜를 선택해주세요");
            $("#dstart").focus();
            return false;
         }else if($("#dprice").val() == ""){
            popup_setup("가격을 입력해주세요.");
            $("#dprice").focus();
            return false;
         }
         else if($("#file_list").val() == ""){
            popup_setup("파일을 선택해주세요.");
            return false;
         }else if($("#dtime").val() == ""){
            popup_setup("운영시간을 입력해주세요.");
          return false;
         
         }else if($("#dinformation").val() == ""){
            popup_setup("이용정보를 입력해주세요.");
             return false;
         }else{
               //서버전송
            exhibitionlistform.submit();
         
         } 
      });
      $("#btn_exhibition_Write1").click(function(){
         var start = $("#dstart1").val().split("-");
         var end = $("#dend1").val().split("-");
         
         
         if($("#dtitle1").val() == ""){
            popup_setup("제목을 입력해주세요");
            $("#dtitle1").focus();
            return false;
         }else if($("#dtitle21").val() ==""){
            popup_setup("부제목을  입력해주세요")
            $("#dtitle21").focus();
            return false;
         }else if($("#dplace1").val() =="default"){
            popup_setup("장소를 선택해주세요")
            $("#dplace1").focus();
            return false;
         }else if($("#dentertime1").val() == ""){
            popup_setup("수업시간을 입력해주세요.");
            $("#dentertime1").focus();
            return false;
         }else if($("#dprice1").val() == ""){
            popup_setup("가격을 입력해주세요.");
            $("#dprice1").focus();
            return false;
         }else if($("#dpersonnel1").val() == ""){
            popup_setup("정원을 입력해주세요.");
              $("#dpersonnel1").focus();
              return false;
           }else if($("#dtarget1").val() == "default"){
              popup_setup("대상을 선택해주세요.");
               $("#dtarget1").focus();
               return false;
           }else if($("#dnum1").val() == ""){
              popup_setup("교육횟수를 입력해주세요.");
              $("#dnum1").focus();
              return false;
            }else if($("#dtime1").val() == ""){
               popup_setup("교육시간을 입력해주세요.");
                $("#dtime1").focus();
                return false;
              }else if($("#dinformation1").val() == ""){
                 popup_setup("이용정보를 입력해주세요.");
                  $("#dinformation1").focus();
                  return false;
                }
         else if($("#file_list1").val() == ""){
            popup_setup("파일을 선택해주세요.");
            return false;
         }else if(start > end){
            popup_setup("유효하지 않은 날짜입니다.")
            $("#dstart1").focus();
            return false;
         }else if(start == "" || end == ""){
            popup_setup("날짜를 선택해주세요");
            $("#dstart1").focus();
            return false;
            
         }else{
            //서버전송
            learnlistform.submit();
            
         } 
      });
      $("#btn_exhibition_Write2").click(function(){
         var start = $("#dstart2").val().split("-");
         var end = $("#dend2").val().split("-");
         
         
         if($("#dtitle_event").val() == ""){
            popup_setup("제목을 입력해주세요");
            $("#dtitle_event").focus();
            return false;
         }else if($("#dtitle22").val() ==""){
            popup_setup("부제목을 입력해주세요.")
            $("#dtitle22").focus();
            return false;
         }else if($("#dplace2").val() =="default"){
            popup_setup("장소를 선택해주세요")
            $("#dplace2").focus();
            return false;
         }else if($("#dprice2").val() == ""){
            popup_setup("참가비를 입력해주세요.");
            $("#dprice2").focus();
            return false;
         }else if($("#dtarget2").val() =="default"){
            popup_setup("장소를 선택해주세요")
            $("#dtarget2").focus();
            return false;
         }else if($("#dentertime2").val() == ""){
            popup_setup("회차를 입력해주세요.");
            $("#dentertime2").focus();
            return false;
         }
            else if($("#dinformation2").val() == ""){
               popup_setup("이용정보를 입력해주세요.");
         $("#dinformation2").focus();
         return false;
            }
         else if($("#file_list2").val() == ""){
            popup_setup("파일을 선택해주세요.");
            return false;
         }else if(start > end){
            popup_setup("유효하지 않은 날짜입니다.")
            $("#dstart2").focus();
            return false;
         }else if(start == "" || end == ""){
            popup_setup("날짜를 선택해주세요");
            $("#dstart2").focus();
            return false;
            
         }else{
            //서버전송
            eventlistform.submit();
            
         } 
      });
      
  /*********************
   티켓리스트 수정폼 유효성 체크
   **********************/
      
        $("#btnTicketUpdate").click(function(){
         var start = $("#dstart").val().split("-");
         var end = $("#dend").val().split("-");
         
         
         if($("#dtitle").val() == ""){
            popup_setup("제목을 입력해주세요");
            $("#dtitle").focus();
            return false;
         }else if($("#dtitle23").val() ==""){
            popup_setup("부제목을  입력해주세요")
            $("#dtitle2").focus();
            return false;
         }else if($("#dplace").val() =="default"){
            popup_setup("장소를 입력해주세요")
            $("#dplace").focus();
            return false;
         }else if($("#dentertime").val() == ""){
            popup_setup("회차/수업시간을 입력해주세요.");
            $("#dentertime1").focus();
            return false;
         }else if($("#dprice").val() == ""){
            popup_setup("가격을 입력해주세요.");
            $("#dprice1").focus();
            return false;
         }else if($("#dpersonnel").val() == ""){
            popup_setup("정원을 입력해주세요.");
              $("#dpersonnel").focus();
              return false;
           }else if($("#dtarget").val() == "default"){
              popup_setup("대상 입력해주세요.");
               $("#dtarget").focus();
               return false;
           }else if($("#dnum").val() == ""){
              popup_setup("교육횟수를 입력해주세요.");
              $("#dnum").focus();
              return false;
            }else if($("#dtime").val() == ""){
               popup_setup("교육시간을 입력해주세요.");
                $("#dtime").focus();
                return false;
              }else if($("#dinformation").val() == ""){
                 popup_setup("이용정보를 입력해주세요.");
                  $("#dinformation").focus();
                  return false;
                }
         else if($("#file_list").val() == ""){
            popup_setup("파일을 선택해주세요.");
            return false;
         }else if(start > end){
            popup_setup("유효하지 않은 날짜입니다.")
            $("#dstart").focus();
            return false;
         }else if(start == "" || end == ""){
            popup_setup("날짜를 선택해주세요");
            $("#dstart").focus();
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
                  
         $("#check30").prop("checked", false);
      });   
      
   /*********************
   회차 클릭시 관람인원 버튼 활성화
   **********************/
   $("#entertime").click(function(){
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
        }else if($("#rtotal").val() == "0"){               
            return false;
        }else if($("#inptext").val() == "0"){               
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
       if($("#inptext").val() == "5"){   
          $("#increaseQuantity").removeAttr("disabled");
       }else if($("#inptext").val() == "1"){   
          $("#countpeople").prop("disabled", !this.checked); 
          $("input:checkbox[id='check30']").prop("checked", false );   
       }else if($("#inptext").val() == "4"){   
          $("#increaseQuantity").removeAttr("disabled");
          $("input:checkbox[id='check30']").prop("checked", false );   
        }else if($("#inptext").val() == "3"){   
          $("#increaseQuantity").removeAttr("disabled");
          $("input:checkbox[id='check30']").prop("checked", false );   
       }else{     
         $("input:checkbox[id='check30']").prop("checked", false );   
         $("#btn32").prop("disabled", !this.checked);
       }                 
   }); 
   
   $("#increaseQuantity").click(function(){       
       if($("#inptext").val() == "0"){   
          $("#countpeople").removeAttr("disabled");
       }else if($("#inptext").val() == "3"){   
          $("#increaseQuantity").prop("disabled", !this.checked); 
          $("input:checkbox[id='check30']").prop("checked", false );   
       
       }else{     
           $("#increaseQuantity").removeAttr("disabled");
         $("input:checkbox[id='check30']").prop("checked", false );   
         $("#btn32").prop("disabled", !this.checked);
       }           
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

      