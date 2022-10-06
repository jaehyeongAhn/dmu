$(document).ready(function(){


   $("#btn50").click(function(){
      if($(".select-area-write").val() == "default"){
         alert("카테고리를 선택해주세요");
      }else if($("#ntitle").val()==""){
         alert("제목을 입력해주세요");
         $("#btn50").focus();
         return false;
      }else{
         noticeWriteForm.submit();
      }
   });
	

   $("#btn501").click(function(){
      if($(".select-area-write").val() == "default"){
         alert("카테고리를 선택해주세요");
      }else if($("#ntitle").val()==""){
         alert("제목을 입력해주세요");
         return false;
      }else{
         noticeUpdateForm.submit();
      }
   });
	
});//ready


const body = document.querySelector('body');
const select = document.querySelector('[data-role="selectBox"]');
const values = select.querySelector('[data-value="title"]');
const option = select.querySelector('ul');
const opts = option.querySelector('li');


/* 셀렉트 영역 클릭 시옵션 숨기기, 보이기 */
function selects(e){
    e.stopPropagation();
    option.setAttribute('style', 'top:${select.offsetHeight}px')
    if(option.classList.contains('select-list')){
        option.classList.remove('select-list');
        option.classList.add('show');
    }else{
        option.classList.add('select-list');
        option.classList.remove('show');
    }
    selectOpt();
}

/* 옵션선택 */
function selectOpt(){
    opts.forEach(opt=>{
        const innerValue = opt.innerHTML;
        function changeValue(){
            values.innerHTML - innerValue;
        }
        opt.addEventListener('click', changeValue)
    });
}

/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
function selectFirst(){
    const firstValue = opts[0].innerHTML;
    values.innerHTML='${firstValue}'
}

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('select-list');
        option.classList.remove('show');
    }
}

selectFirst();
select.addEventListener('click',selects);
body.addEventListener('click', hideSelect);

	$("#btn501").click(function(){
      if($("#ntitle").val()==""){
         alert("제목을 입력해주세요");
      }else{
         noticeUpdateForm.submit();
      }
   }); 


