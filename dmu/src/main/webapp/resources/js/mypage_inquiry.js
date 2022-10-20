$(document).ready(function(){
	/************************************ mypage_inquiry ***************************************/
		
		//문의 사항 작성하기
		$(".review_write_btn").click(function(){
			$(".check_join").remove();
			$("body").css("overflow", "hidden");
			$(".popup_inquire_write").scrollTop(0);
			$(".inquire_category").val("default");
			$(".inquire_type").val("default");
			$("div.write_inquire_form input").val("");
			$("div.write_inquire_form textarea").val("");
			$(".background_inquire").addClass("show");
			$(".window_inquire").addClass("show");
			$(".inquire_close").click(function(){
				$("body").css("overflow", "auto");
				$(".background_inquire").removeClass("show");
				$(".window_inquire").removeClass("show");
			});
		});

		//문의 내역 상세 보기
		$("div.inquire_title .detail").click(function(){
			//팝업창 띄우기
			$("body").css("overflow", "hidden");
			$(".popup_inquire_detail_form").scrollTop(0);
			$(".background_inquire_detail").addClass("show");
			$(".window_inquire_detail").addClass("show");
			$(".inquire_detail_close").click(function(){
				$("body").css("overflow", "auto");
				$(".background_inquire_detail").removeClass("show");
				$(".window_inquire_detail").removeClass("show");
			});
			
			//문의 상세 정보 불러오기
			let iqid = $(this).parent().parent().prev().val();
			$.ajax({
				type : "post",
				data : {
					iqid : iqid
				},
				url : "mypage_inquiry_content.do",
				success : function(result) {
					let data = JSON.parse(result);
					let inquiry_answer_status = $(".popup_inquire_detail_content div.inquiry_answer p.inquiry_answer_status");
					
					if(data.iqanswer == "n"){
						inquiry_answer_status.css("display", "none");
					}else{
						inquiry_answer_status.css("display", "flex");
					}
					$(".popup_inquire_detail_content div.category_list span.category > span.second").text(data.iqcategory);
					$(".popup_inquire_detail_content div.category_list span.first:nth-child(2) span.second").text(data.iqtype);
					$(".popup_inquire_detail_content div.inquire_write_date span").text(data.iqdate);
					$(".popup_inquire_detail_content div.inquire_write_content p").html(data.iqtitle);
					$(".popup_inquire_detail_content div.inquire_write_content div").html(data.iqcontent);
				},
				error : function(e){
					alert("정보를 불러올 수 없습니다.");
				}
			});
		});
		
		
		/****************************************** 팝업창 사이즈 *****************************************/
		function warningCheck_inquiry(check, obj, coment){
			let style_warning = "<div class = 'check_join'>"
				style_warning += "<img src = 'http://localhost:9000/dmu/resources/images/warning.png' class = 'join_warning'>";
				style_warning += "<span></span></div>";
			if(check == true){
				obj.next(".check_join").remove();
				obj.after(style_warning);
				
				obj.next(".check_join").children(".join_warning").css({"height" : "15px", "margin-right" : "5px", "width" : "auto"});
				obj.next(".check_join").children(".join_warning + span").text(coment).css({"color" : "#D92121", "letter-spacing" : "-0.08rem", "font-weight" : "400", "font-size" : "14px"});
				$(".check_join").css({"height": "20px", "display" : "flex", "align-items" : "center", "justify-content" : "flex-start", "margin-bottom" : "10px"});
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
				obj.next(".check_join").remove();
			}
		}
		
		
		/***************** 문의사항 글쓰기 팝업창 *****************/
		
		//문의 사항 글쓰기 팝업창 유효성 체크
		$("div.popup_inquire_write select.inquire_category").change(function(){
			if($("div.popup_inquire_write select.inquire_category").val() != "default"){
				warningCheck_inquiry(false, $("div.popup_inquire_write select.inquire_category"), "");
				$("div.popup_inquire_write select.inquire_type option").css("display", "block");
			}
		});
		
		$("div.popup_inquire_write select.inquire_type").change(function(){
			if($(this).val() != "default"){
				warningCheck_inquiry(false, $("div.popup_inquire_write select.inquire_type"), "");
			}
		});
		
		$("div.write_inquire_form input.iqtitle").keyup(function(){
			if($(this).val() != ""){
				warningCheck_inquiry(false, $("div.write_inquire_form input.iqtitle"), "");
			}
		});
		
		$("div.write_inquire_form textarea.iqcontent").keyup(function(){
			if($(this).val() != ""){
				warningCheck_inquiry(false, $("div.write_inquire_form textarea.iqcontent"), "");
			}
		});
		
		$("button.inquire_ok").click(function(){
			if($("div.popup_inquire_write select.inquire_category").val() == "default") {
				warningCheck_inquiry(true, $("select.inquire_category"), "카테고리를 선택해주세요.");
				$(".popup_inquire_write").scrollTop(0);
				return false;
			}else if($("div.popup_inquire_write select.inquire_type").val() == "default") {
				let scroll = $("div.popup_inquire_write select.inquire_category").offset().top - 130;
				warningCheck_inquiry(true, $("select.inquire_type"), "문의 유형을 선택해주세요.");
				$(".popup_inquire_write").scrollTop(scroll);
				return false;
			}else if($("div.write_inquire_form input.iqtitle").val() == ""){
				let scroll = $("div.write_inquire_form input.iqtitle").offset().top - 130;
				warningCheck_inquiry(true, $("div.write_inquire_form input.iqtitle"), "문의 제목을 입력해주세요.");
				$("div.write_inquire_form input.iqtitle").focus();
				$(".popup_inquire_write").scrollTop(scroll);
				return false;
			}else if($("div.write_inquire_form textarea.iqcontent").val() == ""){
				let content_scroll = $(".popup_inquire_write_form")[0].scrollHeight;
				warningCheck_inquiry(true, $("div.write_inquire_form .iqcontent"), "문의 내용을 입력해주세요.");
				$(".popup_inquire_write").scrollTop(content_scroll);
				$("div.write_inquire_form .iqcontent").focus();
				return false;
			}else{
				inquireWriteForm.submit();
			}
		});
		
		
		
		/***************** 문의사항 글보기 팝업창 *****************/
		let height_content = $(".popup_inquire_detail").height() - $(".popup_inquire_detail_title").outerHeight() - $(".inquire_detail_button_list").outerHeight();
		$(".popup_inquire_detail_form").css("height", height_content);
	
});