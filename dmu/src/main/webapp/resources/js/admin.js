$(document).ready(function(){
	

	function popup_set(guideSet){

		$(".background_notice").addClass("show");
		$(".window_notice").addClass("show");
		$("#popup_noticeUpdate").text(guideSet);
		$("#popup_close").click(function(){
			$(".background_notice").removeClass("show");
			$(".window_notice").removeClass("show");
		});

	}

	$(".submit").click(function(){
	    if($(".select-area-write").val() == "default"){
	     	popup_set("카테고리를 입력해주세요");
	     	return false;
	    }else if($("#ntitle").val()==""){
		 	popup_set("제목을 입력해주세요");
	     	return false;
	    }else{
	    	popup_set("등록완료되었습니다");
	    	$("#popup_close").click(function(){
	    		noticeWriteForm.submit();
	    	});
	    }
	});
	
	$("#btn501").click(function(){
	    if($(".select-area-write").val() == "default"){
	     	popup_set("카테고리를 입력해주세요");
	     	return false;
	    }else if($("#ntitle").val()==""){
		 	popup_set("제목을 입력해주세요");
	     	return false;
	    }else{
	    	popup_set("수정완료되었습니다");
	    	$("#popup_close").click(function(){
	    		noticeUpdateForm.submit();
	    	});
	    }
	});


	
});//ready
