$(document).ready(function(){


   $("#btn50").click(function(){
      	 alert($(".select-area-write").val());
      if($(".select-area-write").val() == "defalut"){
         alert("카테고리를 선택해주세요");
      }else if($("#ntitle").val()==""){
         alert("제목을 입력해주세요")
      }else{
      	 alert($(".select-area-write").val());
         noticeWriteForm.submit();
      }
   });
   
   
   
});//ready