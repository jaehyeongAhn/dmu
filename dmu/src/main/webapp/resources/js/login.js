$(document).ready(function(){
		
/********************************* login.do ************************************/
	//주의 문구 띄우는 함수
	function warningCheck(check, obj, coment){
		let style_warning = "<div class = 'check_join'>"
			style_warning += "<img src = 'http://localhost:9000/dmu/resources/images/warning.png' class = 'join_warning'>";
			style_warning += "<span></span></div>";
		if(check == true){
			
			/* $(".check_join").addClass(name);
			if(document.querySelector(name) ) */
			
			//$(".check_join").remove();
			obj.next().remove();
			obj.after(style_warning);
			
			obj.next().children(".join_warning").css("height", "20px").css("margin-right", "10px");
			//$(".join_warning + span").text(coment).css({"color" : "#D92121", "letter-spacing" : "-0.08rem"});
			obj.next().children(".join_warning + span").text(coment).css({"color" : "#D92121", "letter-spacing" : "-0.08rem", "font-weight" : "400"});
			$(".check_join").css({"height": "40px", "display" : "flex", "align-items" : "center", "justify-content" : "flex-start"});
		}else if(check == 'ok'){
			
			//$(".check_join").remove();
			obj.next().remove();
			obj.after(style_warning);
			
			obj.next().children(".join_warning").remove();

			//$(".check_join span").text(coment).css({"color" : "black", "letter-spacing" : "-0.08rem",
			obj.next().children("span").text(coment)
					.css({"color" : "black", "letter-spacing" : "-0.08rem", "font-weight" : "400"});
			$(".check_join").css({"height": "40px", "display" : "flex", "align-items" : "center", "justify-content" : "flex-start"});
			
		}else{
			obj.next().remove();
		}
	}
		
	
	
});