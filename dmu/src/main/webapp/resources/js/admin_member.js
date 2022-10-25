/****************************
   admin_member
*****************************/


//public

$(document).ready(function(){


    $(".member_detail").click(function(){
 
       //$(this).css("background", "black");
          let index = $(this).parent().parent().index();
          let mid = $("tr").filter(":eq("+(index+1)+")").children(".memberId").text();
    
       //alert(mid);
    
          popup_public_detail(mid);
       
       });//member click

    

    
    function popup_public_detail(mid){
        $.ajax({
            type : "post",
            data : {
                mid : mid
            },
            url : "adminpage_member_list_detail.do",
            success : function(result){
               let data = JSON.parse(result);
               
               $(".popup_detail_table td.mid").text(data.mid);
               $(".popup_detail_table td.mname").text(data.mname);
               $(".popup_detail_table td.pnumber").text(data.pnumber);
               $(".popup_detail_table td.email").text(data.email);
               $(".popup_detail_table td.birth").text(data.birth);
               $(".popup_detail_table td.address").text(data.address);
               if(data.gender == 'f'){
                  $(".popup_detail_table td.gender").text("여");
               }else{
                  $(".popup_detail_table td.gender").text("남");
            
               }
               if(data.nationality == 'foreign'){
                  $(".popup_detail_table td.nationality").text("외국인");
                  
               }else{
                  $(".popup_detail_table td.nationality").text("내국인");
               }
               $(".popup_detail_table td.ddate").text(data.ddate);
               if(data.unregister == 'n'){
                  $(".popup_detail_table td.unregister").text("탈퇴");
               }else{
                  $(".popup_detail_table td.unregister").text("가입완료");
               }
               
            
               
            }

        });//ajax
      }
    
    
    
    function paging(dbCount, rpage, pageSize){
    
      //페이징 리스트 출력
      var pager = jQuery('#ampaginationsm').pagination({
      
          maxSize: 5,             // max page size
          totals: dbCount,   // total rows   
          page: rpage,      // initial page      
          pageSize: pageSize,   // max number items per page
      
          // custom labels      
          lastText: '&raquo;&raquo;',       
          firstText: '&laquo;&laquo;',      
          prevText: '&laquo;',      
          nextText: '&raquo;',
                 
          btnSize:'sm'   // 'sm'  or 'lg'      
      });
      
   }
    

    
    
       //popup
   function member_popup(){
      $(".member_detail").click(function(){
         $(".background_member").addClass("show");
         $(".window_member").addClass("show");
         $(".popup_close").click(function(){
            $(".background_member").removeClass("show");
            $(".window_member").removeClass("show");
         });
      });
   }
   
   member_popup();
   
   //검색기능
   
   $(".search-btn").click(function(){
      admin_search_public(1);
   });
   
   
   $(".search-bar").keyup(function(e){
      if(e.keyCode == 13){
         admin_search_public(1);
      }
   });
   
   
   function admin_search_public(rpage){
       $(".search-bar").val($(".search-bar").val().trim());
       let keyword = $(".search-bar").val().trim();
       $.ajax({
           
           url : 'admin_search_public_json.do',
           type: 'get',
           cache : false,
           headers : {"cache-control":"no-cache", "pragma": "no-cache"},
           data : {"keyword" : keyword, "rpage": rpage},
           success : function(data){
               let dataset = JSON.parse(data);
               
                 var output ="<table class='info-table'><thead><tr>";
               output +="<th>아이디</th>";
               output +="<th>회원명</th>";
               output +="<th>전화번호</th>";
               output +="<th>이메일</th>";
               output +="<th>가입일자</th>";
               output +="<th>상태</th>";
               output +="<th>자세히보기</th>";
               output +="</tr></thead>";
               
               for(obj of dataset.list){
                   output += "<tbody><tr>";
                   output += "<td class='memberId'>" + obj.mid + "</td>";
                   output += "<td>" + obj.mname + "</td>";
                   output += "<td>" + obj.pnumber + "</td>";
                   output += "<td>" + obj.email + "</td>";
                   output += "<td>" + obj.ddate + "</td>";
                   if(obj.unregister == 'n'){
                       output += "<td>탈퇴</td>"
                   }else{
                       output +="<td>가입완료</td>"
                   }
                   output += "<td><button class='member_detail' id='"+obj.mid+"'>자세히보기</button></td>"
               }
                   output += "</tr></tbody></table>";   
               
               var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm' style='text-align:center;''> "
               paging_list +="</div>"
               
               if(dataset.list.length !=0){
                   
               $(".no-result").css("display","none");
                              
               $(".info-table").remove();
               $("#ampaginationsm").remove();
               $(".info-list").append(output);
               $(".info-list").after(paging_list);
               $("div.search-result strong.total").text(dataset.dbCount);
               
               member_popup();
                   $(".member_detail").click(function(){
                   //alert("ajax");
                   //$(this).css("background", "black");
                      let index = $(this).parent().parent().index();
                      let mid = $(this).attr("id");
                
                   //alert(mid);
                
                      popup_public_detail(mid);
                   
                   });//member click
               paging(dataset.dbCount, dataset.rpage, dataset.pageSize);
               
               //페이징 번호 클릭 시 이벤트 처리
                jQuery('#ampaginationsm').on('am.pagination.change',function(e){      
                      jQuery('.showlabelsm').text('The selected page no: '+e.page);
                      //$(location).attr('href', "http://localhost:9000/dmu/adminpage_member_list.do?rpage="+e.page);
                      admin_search_public(e.page);
                   
               });  
               
               }else{
                   $("div.search-result strong.total").text(dataset.dbCount);
                   $(".info-table").remove();
                   $("#ampaginationsm").remove();
                   $(".no-result").css("display","block");
                   
               }
           
           },
           error : function(data){
               alert('error');
           }
           
           
       }); //ajax
       

   }//function - admin_search_public
    
    
    
    
    
    
    
    
    
    
//admin  
    

       $(".admin").click(function(){
       //$(this).css("background", "black");
       let index = $(this).parent().parent().index();
   
       let mid = $("tr").filter(":eq("+(index+1)+")").children(".memberId").text();
    
       //alert(mid);
          
          popup_admin_detail(mid);
          
       });//admin click

    
    
    function popup_admin_detail(mid){
        $.ajax({
            type : "post",
            data : {
                mid : mid
            },
            url : "adminpage_admin_list_detail.do",
            success : function(result){
               let data = JSON.parse(result);
               
               $(".popup_detail_table td.mid").text(data.mid);
               $(".popup_detail_table td.mname").text(data.mname);
               $(".popup_detail_table td.pnumber").text(data.pnumber);
               $(".popup_detail_table td.email").text(data.email);
               $(".popup_detail_table td.birth").text(data.birth);
               $(".popup_detail_table td.address").text(data.address);
               if(data.gender == 'f'){
                  $(".popup_detail_table td.gender").text("여");
               }else{
                  $(".popup_detail_table td.gender").text("남");
            
               }
               if(data.nationality == 'foreign'){
                  $(".popup_detail_table td.nationality").text("외국인");
                  
               }else{
                  $(".popup_detail_table td.nationality").text("내국인");
               }
               $(".popup_detail_table td.ddate").text(data.ddate);
               if(data.unregister == 'n'){
                  $(".popup_detail_table td.unregister").text("탈퇴");
               }else{
                  $(".popup_detail_table td.unregister").text("가입완료");
               }
               if(data.status == 'accept') {
                  $(".popup_detail_table td.status").text("승인대기중");
               }else{
                  $(".popup_detail_table td.status").text("승인완료");               
               }
            
               
            }

        });//ajax
      }
    
    $(".accept").click(function(){

//      alert("accept123");



   })//accept
    
 /*   $("#popup_close").click(function(){
      $("form").attr({
            "name" : "acceptForm",
            "action" : "acceptUpdate.do"
        })
        acceptForm.submit();
    }); */
    
    
    //popup
   function admin_popup(){
      $(".member_detail").click(function(){
         $(".background_member").addClass("show");
         $(".window_member").addClass("show");
         $(".popup_close").click(function(){
            $(".background_member").removeClass("show");
            $(".window_member").removeClass("show");
         });
      });
   }
   
   admin_popup();
   
   /* $(".accept").click(function(){
      alert("123accept");
      let index = $(this).parent().parent().index();
       let mid = $(this).attr("id");
   
         $(".accept_input").val(mid);

      

      $(".background_accept").addClass("show_accept");
      $(".window_accept").addClass("show_accept");
      $("#popup_acceptNo").click(function(){
         $(".background_accept").removeClass("show_accept");
         $(".window_accept").removeClass("show_accept");
      });
      
   }); */
   
   
   
                     $(".accept").click(function(){
                        $(".background_accept").addClass("show_accept");
                        $(".window_accept").addClass("show_accept");
                        $("#popup_acceptNo").click(function(){
                           $(".background_accept").removeClass("show_accept");
                           $(".window_accept").removeClass("show_accept");
                        });
                        
                        let index = $(this).parent().parent().index();
                           let mid = $(this).parent().parent().children(".memberId").text();
                           
                           //alert(mid);
                         $(".accept_input").val(mid);
                         
                      
                     
                     }); 
   
   
   
   $("#popup_acceptOk").click(function(){
      //alert("22");
      popup_accept();
                            $.ajax({
                        url : "acceptUpdate.do?mid="+$(".accept_input").val(),
                        success: function(result){
                           alert(result);
                     
                           if(result == 1){
                           
                              
                                 $(".background_ok").addClass("show");
                                 $(".window_ok").addClass("show");
                              
                                 $("#popup_close").click(function(){
                                 $(location).attr("href", "http://localhost:9000/dmu/adminpage_admin_list.do")
                                 });
                           
                           
                           }
                     
                        }
                        
                     
                     });  //ajax
      
      
      /*$(".background_ok").addClass("show");
      $(".window_ok").addClass("show");
      $("#popup_close").click(function(){
         $(".background_ok").removeClass("show");
         $(".window_ok").removeClass("show");
      });*/
   }); 
   
   function popup_accept(){
      //$("#popup_acceptOk").click(function(){
      $(".background_ok").addClass("show");
      $(".window_ok").addClass("show");
      //});
   }
   
      $("#popup_close").click(function(){
         $(".background_ok").removeClass("show");
         $(".window_ok").removeClass("show");
      });
   
   
   
   
   
   //검색기능
   
   $(".search-btn-admin").click(function(){
      admin_search_admin(1);
   });
   
   
   $(".search-bar-admin").keyup(function(e){
      if(e.keyCode == 13){
         admin_search_admin(1);
      }
   });
   
   function admin_search_admin(rpage){
       $(".search-bar-admin").val($(".search-bar-admin").val().trim());
       let keyword = $(".search-bar-admin").val().trim();
       $.ajax({
           
           url : 'admin_search_admin_json.do',
           type: 'get',
           cache : false,
           context : this,
           headers : {"cache-control":"no-cache", "pragma": "no-cache"},
           data : {"keyword" : keyword, "rpage": rpage},
           success : function(data){
               let dataset = JSON.parse(data);
               
                 var output ="<table class='info-table'><thead><tr>";
               output +="<th>아이디</th>";
               output +="<th>회원명</th>";
               output +="<th>전화번호</th>";
               output +="<th>이메일</th>";
               output +="<th>가입일자</th>";
               output +="<th>상태</th>";
               output +="<th>자세히보기</th>";
               output +="<th>관리자승인</th>";
               output +="</tr></thead>";
               
               for(obj of dataset.list){
                   output += "<tbody><tr>";
                   output += "<td class='memberId'>" + obj.mid + "</td>";
                   output += "<td>" + obj.mname + "</td>";
                   output += "<td>" + obj.pnumber + "</td>";
                   output += "<td>" + obj.email + "</td>";
                   output += "<td>" + obj.ddate + "</td>";
                   if(obj.unregister == 'n'){
                       output += "<td>탈퇴</td>"
                   }else{
                       output +="<td>가입완료</td>"
                   }
                   output += "<td><button class='member_detail admin' id='"+obj.mid+"'>자세히보기</button></td>"
                   if(obj.status == 'accept'){
                      output +="<td><button class='accept'>관리자승인</button></td>"
                   }else{
                      output +="<td>승인완료</td>"
                   }
               }
                   output += "</tr></tbody></table>";   
               
               var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm' style='text-align:center;''> "
               paging_list +="</div>"
               
               
               
               if(dataset.list.length !=0){
                   
               $(".no-result").css("display","none");
                              
               $(".info-table").remove();
               $("#ampaginationsm").remove();
               $(".info-list").append(output);
               $(".info-list").after(paging_list);
               $("div.search-result strong.total").text(dataset.dbCount);
               
               admin_popup();
               
               $(".admin").click(function(){
                   //alert("ajax");
                   //$(this).css("background", "black");
                      let index = $(this).parent().parent().index();
                      let mid = $(this).attr("id");
                
                   //alert(mid);
                
                      popup_admin_detail(mid);
                   
                   });//member click
                   
               
               
                   $(".accept").click(function(){
                     $(".background_accept").addClass("show_accept");
                     $(".window_accept").addClass("show_accept");
                     $("#popup_acceptNo").click(function(){
                        $(".background_accept").removeClass("show_accept");
                        $(".window_accept").removeClass("show_accept");
                     });
                     
                     let index = $(this).parent().parent().index();
                        let mid = $(this).parent().parent().children(".memberId").text();
                        
                        //alert(mid);
                      $(".accept_input").val(mid);
                     
                  }); 
                  
                  
                  /* $("#popup_acceptOk").click(function(){
                     alert("ee");
                     popup_accept();
                     $(".background_ok").addClass("show");
                     $(".window_ok").addClass("show");
                     $("#popup_close").click(function(){
                        $(".background_ok").removeClass("show");
                        $(".window_ok").removeClass("show");
                     });
                  });*/
   
                     
                  $("#popup_acceptOk").click(function(){
                     //update_admin($(".admin").attr("id"));
                     alert($(".accept_input").val());
                      $.ajax({
                        url : "acceptUpdate.do?mid="+$(".accept_input").val(),
                        success: function(result){
                           alert(result);
                     
                           if(result == 1){
                           
                              
                                 $(".background_ok").addClass("show");
                                 $(".window_ok").addClass("show");
                              
                                 $("#popup_close").click(function(){
                                 $(location).attr("href", "http://localhost:9000/dmu/adminpage_admin_list.do")
                                 });
                           
                           
                           }
                     
                        }
                        
                     
                     });  //ajax
                     //$(location).attr("href", "http://localhost:9000/dmu/acceptUpdate.do?mid="+$(".admin").attr("id")+"&status='admin'");
                  }); 
                     
                           
               /* $("#popup_close").click(function(){
                     $("form").attr({
                           "name" : "acceptForm",
                           "action" : "acceptUpdate.do"
                       })
                       acceptForm.submit();
                   }); */
               
               
               
               paging(dataset.dbCount, dataset.rpage, dataset.pageSize);
               
               //페이징 번호 클릭 시 이벤트 처리
                jQuery('#ampaginationsm').on('am.pagination.change',function(e){      
                      jQuery('.showlabelsm').text('The selected page no: '+e.page);
                      //$(location).attr('href', "http://localhost:9000/dmu/adminpage_admin_list.do?rpage="+e.page);
                      admin_search_admin(e.page);
                   
               });  
               
               }else{
                   $("div.search-result strong.total").text(dataset.dbCount);
                   $(".info-table").remove();
				   $("#ampaginationsm").remove();
                   $(".no-result").css("display","block");
               }
           
           },
           error : function(data){
               alert('error');
           }
           
           
       }); //ajax
       
       
/*       function update_admin(){
       alert("admin");
               $.ajax({
            url : 'acceptUpdate.do?mid="+$(".accept").attr("id")',
            success: function(result){
               alert(result);
            }
            
         
         }); //ajax
       } */
       
       

   }//function - admin_search_admin
    
    
    
    
    
    
    
    
}); //ready    
    

    
    /****************************
   admin_reservation
*****************************/


$(document).ready(function(){

	function popup_reserve_detail(){

    $(".reservation_detail").click(function(){
    
   		let index = $(this).parent().index();
    	let rid = $(this).attr("id");
    	 
    	
    	popup_reservation_detail(rid);
	  });
    	 
	 function popup_reservation_detail(rid){
        $.ajax({
            type : "post",
            contect : this,
            data : {
                rid : rid
            },
            url : "adminpage_reservation_list_detail.do",
            success : function(result){

            	let data = JSON.parse(result);
            	
            	$(".popup_detail_table td.dcode").text(data.dcode);
            	$(".popup_detail_table td.rid").text(data.rid);
            	$(".popup_detail_table td.tid").text(data.tid);
            	$(".popup_detail_table td.dtitle").text(data.dtitle);
            	$(".popup_detail_table td.mid").text(data.mname);
            	$(".popup_detail_table td.dprice").text(data.dpricech);
            	$(".popup_detail_table td.rtotal").text(data.rtotal);
            	$(".popup_detail_table td.rallprice").text(data.rallpricech);
            	$(".popup_detail_table td.rdate").text(data.rdateda);
            	$(".popup_detail_table td.rokdate").text(data.rokdate);
            	$(".popup_detail_table td.pid").text(data.pid);
            	$(".popup_detail_table td.pdate").text(data.pdate);
            	$(".popup_detail_table td.pcoin ").text(data.pcoin);
            	$(".popup_detail_table td.tcheck ").text(data.tcheck);
 
             
             
            /*   if(data.unregister == 'n'){
                  $(".popup_detail_table td.unregister").text("탈퇴");
               }else{
                  $(".popup_detail_table td.unregister").text("가입완료");
               }*/
            
               
            }
 
    	});//click
  	}
  
 
  }
  
 
   $(".reservation_detail_admin").click(function(){
 
   		 var id_check = $(this).attr("id");
 
   
         $(location).attr('href', "http://localhost:9000/dmu/adminpage_reservation_list_det.do?rid="+ id_check);  
         
   });
  

	 
    
   /*
   ** 검색기능
   */

   function paging1(dbCount, rpage, pageSize){
    
      //페이징 리스트 출력
      var pager = jQuery('#ampaginationsm1').pagination({
      
          maxSize: 5,             // max page size
          totals: dbCount,   // total rows   
          page: rpage,      // initial page      
          pageSize: pageSize,   // max number items per page
      
          // custom labels      
          lastText: '&raquo;&raquo;',       
          firstText: '&laquo;&laquo;',      
          prevText: '&laquo;',      
          nextText: '&raquo;',
                 
          btnSize:'sm'   // 'sm'  or 'lg'      
      });
      
   }
   
   
   $(".search-btn-reserve").click(function(){
      admin_search_reserve(1);
   });
   
   
   $(".search-bar-reserve").keyup(function(e){
      if(e.keyCode == 13){
         admin_search_reserve(1);
      }
   });


   function admin_search_reserve(rpage){

      $(".search-bar-reserve").val($(".search-bar-reserve").val().trim());
       let keyword = $(".search-bar-reserve").val().trim();
       $.ajax({
           
           url : 'admin_search_reserve_json.do',
           type: 'get',
           cache : false,
           headers : {"cache-control":"no-cache", "pragma": "no-cache"},
           data : {"keyword" : keyword, "rpage": rpage},
           success : function(data){
               let dataset = JSON.parse(data);
               
                 var output ="<table class='info-table'><thead><tr>";
               output +="<th>분류</th>";
               output +="<th>티켓번호</th>";
               output +="<th>이벤트명</th>";
               output +="<th>예약자명</th>";
               output +="<th>티켓금액</th>";
               output +="<th>티켓매수</th>";
               output +="<th>총 금액</th>";
               output +="<th>관람일</th>";
               output +="<th>예약일</th>";
               output +="<th>관리자모드</th>";
               output +="</tr></thead>";
               
               for(obj of dataset.list){
                   output += "<tbody><tr class='name'>";
                   output += "<td>" + obj.dcode + "</td>";
                   output += "<td  class='reservation_detail reservationId'>" + obj.rid + "</td>";
                   output += "<td>" + obj.dtitle + "</td>";
                   output += "<td>" + obj.mname + "</td>";
                   output += "<td>" + obj.dpricech + "</td>";
                   output += "<td>" + obj.rtotal + "</td>";
                   output += "<td>" + obj.rallpricech + "</td>";
                   output += "<td>" + obj.rdateda + "</td>";
                   output += "<td>" + obj.rokdatech + "</td>";
                   if(obj.rid == 'n'){
                       output += "<td>취소완료</td>"
                   }else{
                       output +="<td><button class='reservation_detail_admin member_detail' type='button' id="+ obj.rid +" > 자세히보기 </button></a></td>"
                   }
               }
                   output += "</tr></tbody></table>";   
               
               var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm1' style='text-align:center;'> "
               paging_list +="</div>"
               
               if(dataset.list.length !=0){
                   
               $(".no-result").css("display","none");
                              
	            $(".info-table").remove();
	            $("#ampaginationsm").remove();
	            $("#ampaginationsm1").remove();
	            $(".info-list").append(output);
	            $(".info-list").after(paging_list);
	            $("div.search-result strong.total").text(dataset.dbCount);
               
               
                $(".reservation_detail_admin").click(function(){
			   		 var id_check = $(this).attr("id");
			         $(location).attr('href', "http://localhost:9000/dmu/adminpage_reservation_list_det.do?rid="+ id_check);  
			   });
               
               popup_reserve_detail();
               
               paging1(dataset.dbCount, dataset.rpage, dataset.pageSize);
               
               //페이징 번호 클릭 시 이벤트 처리
                jQuery('#ampaginationsm1').on('am.pagination.change',function(e){      
                      jQuery('.showlabelsm').text('The selected page no: '+e.page);
                      //$(location).attr('href', "http://localhost:9000/dmu/adminpage_reservation_list.do?rpage="+e.page);
                      admin_search_reserve(e.page);
                   
               });  
               
               }else{
	                $("div.search-result strong.total").text(dataset.dbCount);
	                $(".info-table").remove();
	                $("#ampaginationsm").remove();
	                $("#ampaginationsm1").remove();
	                $(".no-result").css("display","block");
                   
               }
           
           },
           error : function(data){
               alert('error');
           }
           
           
       }); //ajax

	}//finction - admin_search_reserve
 
}); //ready
 