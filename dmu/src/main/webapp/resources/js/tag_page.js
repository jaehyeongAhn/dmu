 
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
		
	//	alert($(this).attr("id"));
		$(".snb-area .snb li").removeClass("on");
		$(this).parent().addClass("on");
		var kind = $(this).attr("id");
		
		notice_search(kind, 1);
	});
	
	notice_search("all", 1);
	
	function notice_search(kind){
		
			$.ajax({ 
				url : 'event_page_json.do',
				type : "post" , 
				cache : false,
				headers : {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"dplace" : kind},
				success : function(data){
					//console.log(data);
					 
				let dataset = JSON.parse(data);
				
				var output =  "<div data-v-e3917d8a='' class='container' id='js-load' class='main'>"
				output += "<ul data-v-e3917d8a='' class='program-list'>";
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
					
			var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm'>"
				paging_list +="</div>"
				
				output += "</ul></div> ";
				
				if(dataset.list.length !=0){
				
					$(".no-result").css("display","none");
						
					$(".container").remove();
					$("#contents").append(output);
					$(".container").append(paging_list);
					
					paging(dataset.dbCount);
				
				}else{
					$(".container").remove();
					$(".no-result").css("display","block");
				}
				
			},
			error : function(data){
				alert('error');
			}
		});
		
	}//function - notice_search
});
 
