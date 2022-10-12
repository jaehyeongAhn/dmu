/****************************
	admin_member
*****************************/


$(document).ready(function(){

    $(".member_detail").click(function(){
    //$(this).css("background", "black");
    let index = $(this).parent().parent().index();

    let mid = $("tr").filter(":eq("+(index+1)+")").children(".memberId").text();
 
    //alert(mid);
 
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
    });//click
}); //ready    
    
    
    
    /****************************
	admin_reservation
*****************************/


$(document).ready(function(){

    $(".reservation_detail").click(function(){
    //$(this).css("background", "black");
    let index = $(this).parent().parent().index();

    let rid = $("tr").filter(":eq("+(index+1)+")").children(".reservationId").text();
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