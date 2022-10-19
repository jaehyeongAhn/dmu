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
		
		    maxSize: 7,	    		// max page size
		    totals: dbCount,	// total rows	
		    page: rpage,		// initial page		
		    pageSize: pageSize,	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
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

	    let index = $(this).parent().parent().index();
	    let mid = $(this).attr("id");

	
    $(".accept_input").val(mid);


})//accept
    
    $("#popup_close").click(function(){
		$("form").attr({
            "name" : "acceptForm",
            "action" : "acceptUpdate.do"
        })
        acceptForm.submit();
    });
    
    
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
	
	$(".accept").click(function(){
		$(".background_accept").addClass("show_accept");
		$(".window_accept").addClass("show_accept");
		$("#popup_acceptNo").click(function(){
			$(".background_accept").removeClass("show_accept");
			$(".window_accept").removeClass("show_accept");
		});
	});
	
	
	$("#popup_acceptOk").click(function(){
		$(".background_ok").addClass("show");
		$(".window_ok").addClass("show");
		$("#popup_close").click(function(){
			$(".background_ok").removeClass("show");
			$(".window_ok").removeClass("show");
		});
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
					   		let mid = $(this).attr("id");
					
						
					    $(".accept_input").val(mid);
							
						});
						
						
						$("#popup_acceptOk").click(function(){
							$(".background_ok").addClass("show");
							$(".window_ok").addClass("show");
							$("#popup_close").click(function(){
								$(".background_ok").removeClass("show");
								$(".window_ok").removeClass("show");
							});
						});
	
							
						$("#popup_close").click(function(){
							//alert($(".admin").attr("id"));
							$.ajax({
								url : 'acceptUpdate.do?mid="+$(".admin").attr("id")',
								success: function(result){
									alert(result);
								}
								
							
							}); //ajax
							//$(location).attr("href", "http://localhost:9000/dmu/acceptUpdate.do?mid="+$(".admin").attr("id")+"&status='admin'");
						});
							
									
/*					    $("#popup_close").click(function(){
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
	                   //$(location).attr('href', "http://localhost:9000/dmu/adminpage_member_list.do?rpage="+e.page);
	                   admin_search_admin(e.page);
	                
	            });  
	            
	            }else{
	                $("div.search-result strong.total").text(dataset.dbCount);
	                $(".info-table").remove();
	                $(".no-result").css("display","block");
	            }
	        
	        },
	        error : function(data){
	            alert('error');
	        }
	        
	        
	    }); //ajax
	    

	}//function - admin_search_admin
    
    
    
    
    
    
    
    
}); //ready    
    

    
    /****************************
	admin_reservation
*****************************/


$(document).ready(function(){

    $(".reservation_detail").click(function(){
    //$(this).css("background", "black");
    let index = $(this).parent().index();
	//alert(index);
    
    //$("tr").filter(":eq("+(index+1)+")").css("background", "black"); //children(".reservationId").css("background", "black"); 
    //$("tr").filter(":eq("+(index+1)+")").children("td.reservationId a").css("color", "red");
    
    let rid = $("tr").filter(":eq("+(index+1)+")").children("td.reservationId").text();
    alert(rid);     
        $.ajax({
            type : "post",
            data : {
                rid : rid
            },
            url : "adminpage_reservation_list_detail.do",
            success : function(result){
            	let data = JSON.parse(result);
            	
            	$(".popup_detail_table dt.dcode").text(data.dcode);
            	$(".popup_detail_table dr.rid").text(data.rid);
            	$(".popup_detail_table dt.dtitle").text(data.dtitle);
            	$(".popup_detail_table dm.mname").text(data.mname);
            	$(".popup_detail_table dpricech").text(data.dpricech);
            	$(".popup_detail_table dr.rtotal").text(data.rtotal);
            	$(".popup_detail_table rallpricech").text(data.rallpricech);
            	$(".popup_detail_table dr.rokdate ").text(data.rokdate);
             
             
            /*	if(data.unregister == 'n'){
	            	$(".popup_detail_table td.unregister").text("탈퇴");
            	}else{
	            	$(".popup_detail_table td.unregister").text("가입완료");
            	}*/
            
            	
            }

        });//ajax
    });//click
	
}); //ready