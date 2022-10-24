$(document).ready(function(){

      $('.sub-menu').hide();
       
       $('.visit').mouseover(function(){
          $('#menu_visit').show();
          
       });
       $('#menu_visit').mouseover(function(){
          $("#menu_visit").show();
       });
       
       $('.visit').mouseout(function(){
          $("#menu_visit").hide();
       });
       $('#menu_visit').mouseout(function(){
          $("#menu_visit").hide();
       });
       
       $('.exhibition').mouseover(function(){
          $("#menu_exhibition").show();
       });
       $('#menu_exhibition').mouseover(function(){
          $("#menu_exhibition").show();
       });
       
       $('.learn').mouseover(function(){
          $("#menu_learn").show();
       });
       $('#menu_learn').mouseover(function(){
          $("#menu_learn").show();
       });
       
       $('.main-menu li').mouseleave(function(){
          $('.sub-menu').hide();
       });
       

       $(".event").hover(function(){
          $('.sub-menu').hide();
       });
       $(".ticket").hover(function(){
          $('.sub-menu').hide();
       });   
       
       
       $(".search").click(function(){
          $(".search-view-box").show();
       });
       
       $(".search-close").click(function(){
          $(".search-view-box").hide();
          $("input.search").val("");
       });


	  var Offset = $( '.main-menu-area' ).offset();
  		$( window ).scroll( function() {
		    if ( $( document ).scrollTop() > Offset.top ) {
		      $( '.main-menu-area' ).addClass( 'sticky' );
		    }
		    else {
		      $( '.main-menu-area' ).removeClass( 'sticky' );
		    }
		  });



    $("iframe.header").on('load', function(){
    
       let mainMenu = this.contentWindow.document.body.offsetHeight;
       let search = $(this).contents().find(".side-links > ul li.search");
       
       let search_close = $("iframe.header").contents().find(".search-view-box .search-close");
       
       search.click(function(){
          let height = mainMenu;
          let search_submenu = $("iframe.header").contents().find(".search-view-box").outerHeight();
          height += search_submenu;
          
          $("iframe.header").css({"min-height" : height, "z-index" : "100"});
       });
       
       search_close.click(function(){
          $("iframe.header").css({"min-height" : 0, "z-index" : "100"});
       });
       
       let body = $(this).contents().find("body");
       body.on("mousewheel", function(e){
          let wheel = e.originalEvent.wheelDelta;
          if(wheel != 0){
             $(".search-view-box").hide();
             $("iframe.header").css({"min-height" : 0, "z-index" : "100"});
          }
       });
    
    


        if(this.contentDocument) {
            let par = $(this).contents().find(".main-menu > ul li");
            //let mainMenu = this.contentWindow.document.body.offsetHeight;
            par.mouseover(function(){
                let height = mainMenu;
                let children = [];
                for(let i = 0; i<3; i++){
                    children[i] = $("iframe.header").contents().find(".sub-menu").eq(i);
                }

                let index = $(this).index();
                if(index < 3){
                    height += children[index].outerHeight();
                }

                $("iframe.header").css({"min-height" : height, "z-index" : "100"});
                
                children[index].mouseleave(function(){
                   $("iframe.header").css({"min-height" : 0, "z-index" : "0"});
                });

            });

            /*$(this).mouseleave(function(){
                $("iframe.header").css({"min-height" :"0", "z-index" : "0"});
            });*/

        }


    });


	/*************************** header_search ********************************/
		$(".search-submit").click(function(){
			search_check();
    	});
    	
    	$("input#field13").keyup(function(e){
    		if(e.keyCode == 13){
    			search_check();
    		}
    	});
    	
    	function search_check(){
    		let keyword = $.trim($("input#field13").val());
    		if(keyword.length < 2){
    			$(".alert").css("display", "block");
    		}else{
    			let search_content = "<form name='searchForm' action='search_header.do' method = 'post' style='display:none;' target='_parent'>";
    			search_content += "<input type='hidden' name = 'keyword' value = '" + keyword + "'></form>"
    			
    			//스타일 초기화
    			$(".alert").css("display", "none");
    			$("input#field13").val(keyword);
				$("body").after(search_content);
    			
    			//submit
    			searchForm.submit();
    		}
    	}
    	
});








