$(document).ready(function(){


   $("#btn50").click(function(){
      if($(".select-area-write").val() == "default"){
         alert("카테고리를 선택해주세요");
      }else if($("#ntitle").val()==""){
         alert("제목을 입력해주세요")
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