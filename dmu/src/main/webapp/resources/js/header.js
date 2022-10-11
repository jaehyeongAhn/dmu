$(document).ready(function(){

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
	
}); //ready



