$(document).ready(function(){


	$("#btn50").click(function(){
		if($("#ntitle").val()==""){
			alert("제목을 입력해주세요");
		}else{
			noticeWriteForm.submit();
		}
	});

		$("#btn501").click(function(){
		if($("#ntitle").val()==""){
			alert("제목을 입력해주세요");
		}else{
			noticeUpdateForm.submit();
		}
	});
	
	
});//ready