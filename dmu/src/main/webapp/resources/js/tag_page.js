 
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
 
 
 
	function myFunction1() {
 	 const element = document.getElementById("program");
 	 element.scrollIntoView({ behavior: 'smooth' });  	 
	} 
 	function myFunction2() {
 	const element = document.getElementById("brand");
 	 element.scrollIntoView({ behavior: 'smooth' });	 
	} 
	function myFunction3() {
 	  const element = document.getElementById("info");
 	 element.scrollIntoView({ behavior: 'smooth' });
	} 





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
  
  function myFunction1() {
	    const element = document.getElementById("program");
	    element.scrollIntoView({ behavior: 'smooth' });      
	  } 
	   function myFunction2() {
	   const element = document.getElementById("brand");
	    element.scrollIntoView({ behavior: 'smooth' });    
	  } 
	  function myFunction3() {
	     const element = document.getElementById("info");
	    element.scrollIntoView({ behavior: 'smooth' });
	  } 
	


   
		$(".tabbox").click(function(){
			var test = $(this).attr("id"); 
			$(".tabbox").css("color","#9999").css("font-weight","400");
			$("#"+test).css("font-weight","bold").css("color","black");
			
			var itemlist = $(this).attr("id");
			var dplace ="${dplace}"; 
			 
			$.ajax({
				url : 'event_page_ajaxlist.do?itemlist='+itemlist+'&dplace='+dplace,
				type : "get" , 
				cache : false,
				headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
				success : function(data){
					let dataset = JSON.parse(data);
					var output =  "<ul data-v-e3917d8a='' class='program-list'>"
						for(aj of dataset.list){
						output += "<li data-v-e3917d8a='' class='lists__item js-load'>"
						output += "<a data-v-e3917d8a='' href='javascript:void(0);' style='cursor: auto;'>"
						output += "<div data-v-e3917d8a='' class='thumb'>"
						output += "<img data-v-2fed1a9a='' data-v-e3917d8a=''  src='http://localhost:9000/dmu/resources/upload/" + aj.dsfile +"' alt='"+aj.dtitle +"' style=''>"
						output += "</div>"
						output += "<div data-v-e3917d8a='' class='info'>"
						output += "<span data-v-e3917d8a='' class='place'>" + aj.dplace +" </span>"
						output += "<strong data-v-e3917d8a='' class='title'> " + aj.dtitle +" </strong>"
						output += "</div></a></li>"
					 
						}
						output += "</ul>"

					//3. 출력 
					$("#program-list").remove();
					$("#program-list").after(output);
					
				},
			 	error : function(data){
			 		alert('error');
			 	}//error 출력 
			})//ajax
		});//click	
	
  
});
 
