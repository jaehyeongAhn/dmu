 
 $(window).on('load', function () {
    load('#js-load', '6');
    $("#btn50").on("click", function () {
  
        load('#js-load', '6', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $("#btn50").hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
 
  
$(document).ready(function(){

	$("#program").click(function(){
		
		$("html ").animate({scrollTop:$("#id1").offset().top},1000);
		
		});
		
		$("#btn2").click(function(){
		
		$("html").animate({scrollTop:$("#id2").offset().top},1000);
		
	});
	
	 
});


$( document ).ready( function() {
  var Offset = $( '.snb-area' ).offset();
  $( window ).scroll( function() {
    if ( $( document ).scrollTop() > Offset.top ) {
      $( '.snb-area' ).addClass( 'Fixed' );
    }
    else {
      $( '.snb-area' ).removeClass( 'Fixed' );
    }
  });
});
 

 