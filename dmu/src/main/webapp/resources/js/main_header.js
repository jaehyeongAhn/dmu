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
    	});



    $("iframe.header").on('mouseover', function(){

        if(this.contentDocument) {
            let par = $(this).contents().find(".main-menu ul li");
            let mainMenu = this.contentWindow.document.body.offsetHeight;
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

            });

            $(this).mouseleave(function(){
                $("iframe.header").css({"min-height" :"0", "z-index" : "0"});
            });

        }


    });


});









