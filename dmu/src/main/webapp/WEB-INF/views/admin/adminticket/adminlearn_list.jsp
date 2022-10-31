<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin
   href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
   href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
   href="http://localhost:9000/dmu/resources/css/tiket.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script> 
$(document).ready(function(){
    
    $(".learn_target").click(function(){
      //order by 스타일 초기화
      $(".orderby").removeClass("on");
      $(".orderby#0").addClass("on");
      
       $(".learn_target").parent("li").removeClass("on");
       $(this).parent("li").addClass("on");
       var dtarget = $(this).attr("id");
       
       ajax_target_list(dtarget, 1);
    });//click
    
    function ajax_target_list(dtarget, rpage){
       $.ajax({
            url : 'learn_ajaxlist.do?dtarget='+dtarget+"&rpage="+rpage, // 이주소로 보낼건데 
            type : "get" , //어떤 방식으로 보낼거야?
            cache : false,
            headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
            success : function(data){
               let dataset = JSON.parse(data);
               $(".total strong").text(dataset.dbCount);
                  
                  if(dataset.list.length !=0){   
                  var   output = "<div class='ticket-list learn' id='ticket_list_learn'>";
                  for(aj of dataset.list){
                     output += "<ul data-v-41f56098=''>";
                  output +="<li data-v-41f56098=''>";
                  output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"'  class='thumb'>"
                  output +="<img data-v-2fed1a9a='' data-v-1e8092ec=''src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+"'>"
                  output +="</a>"
                  output +="<ul data-v-41f56098='' class='flag'>"
                  output +="<li data-v-41f56098=''>"+ aj.dnum + "</li>"
                  output +="<li data-v-41f56098=''>"+ aj.dplace + "</li>"
                  output +="</ul>"
                  output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"' class='title'>" +aj.dtitle +"</a>"
                  
                  output +="<p data-v-41f56098='' class='explan'>" + aj.dtitle2 +"</p>"
                  
                  output +="<ul data-v-41f56098='' class='info'>"
                  
                  output +="<li data-v-41f56098=''>"
                  output +="<span data-v-41f56098='' class='tit'> 교육진행 </span>"
                  output +="<span data-v-41f56098='' class='txt'>"+aj.dstart+ " ~ " +aj.dend+"</span>"
                  output +="</li>"
                  
                  output +="<li data-v-41f56098=''>"
                  output +="<span data-v-41f56098='' class='tit'> 장소  </span>"
                  output +="<span data-v-41f56098='' class='txt'>"+ aj.dplace +"</span>"
                  output +="</li>"
                  
                  output +="<li data-v-41f56098=''>"
                  output +="<span data-v-41f56098='' class='tit'> 대상 </span>"
                  output +="<span data-v-41f56098='' class='txt'>"+ aj.dtarget +"</span>"
                  output +="</li>"
                  
                  output +="<li data-v-41f56098=''>"
                  output +="<span data-v-41f56098='' class='tit'> 교육시간 </span>"
                  output +="<span data-v-41f56098='' class='txt'>"+ aj.dtime +"</span>"
                  output +="</li>"
                  
                  output +="<li data-v-41f56098=''>"
                  output +="<span data-v-41f56098='' class='tit'> 참가비 </span>"
                  output +="<span data-v-41f56098='' class='txt'>"+ aj.dprice +"원</span>"
                  output +="</li>"
                  output +="</ul>"
                  output +="</li>"
                  output +="</ul>" 
               }//for
                  output +=   "</ul></div>"  
                
             var more_list = "<div data-v-41f56098='' class='btn-more-area' id='btn_learn'>";
                more_list += "<div data-v-26e42198='' data-v-41f56098='' class='btn-area'>"
                more_list += "<button data-v-26e42198='' id='more_button'class='secondary more'>더보기</button>";
                more_list += "</div></div>";
                
               }else{
                  var output =   "<div data-v-e20ce500='' data-v-080a389a='' class='previous-list no-data' id='ticket_list_learn'>"
                        output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";   
                      output +="<p data-v-e20ce500='' data-v-080a389a=''>프로그램 준비중입니다.</p></div></div>"
               }//else
                  output +="</div>" 
                  output +="</div>" 
                  output +="</div>" 
                  
                  $("#ticket_list_learn").remove();
                  $("#btn_learn").remove();
                  $(".list-top-area").after(output);
                  
                  if(dataset.dbCount > dataset.endCount){
                     $("#ticket_list_learn").after(more_list);
                     $("#btn_learn").off("click").click(function(){
                        ajax_target_list(dtarget, rpage+1);
                     });//click
                  }//if
            },
                error : function(data){
                alert('error');
                }//error 출력 
            })//ajax
    }
    
    $('.orderby').click(function(){
       $(".orderby").removeClass("on");
       $(this).addClass("on");
       var day = $(".orderby.on").attr("id");
       var dtarget = $("li.on .learn_target").attr("id");
    
       ajax_orderby_list(day, dtarget, 1);
    });//click
    
    function ajax_orderby_list(day, dtarget, rpage){
       $.ajax({
              url : 'orderby_ajaxlist.do?day='+day+"&dtarget="+dtarget+"&rpage="+rpage, 
              type : "get" ,
              cache : false,
              headers : {"cache-control" : "no-cache" , "pragma" : "no-cache"},
              success : function(data){
                 let dataset = JSON.parse(data);
                
                    if(dataset.list.length !=0){   
                    var   output = "<div class='ticket-list learn' id='ticket_list_learn'>";
                    for(aj of dataset.list){
                       output += "<ul data-v-41f56098=''>";
                    output +="<li data-v-41f56098=''>";
                    output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"'  class='thumb'>"
                    output +="<img data-v-2fed1a9a='' data-v-1e8092ec=''src='http://localhost:9000/dmu/resources/upload/"+aj.dsfile+"'>"
                    output +="</a>"
                    output +="<ul data-v-41f56098='' class='flag'>"
                    output +="<li data-v-41f56098=''>"+ aj.dnum + "</li>"
                    output +="<li data-v-41f56098=''>"+ aj.dplace + "</li>"
                    output +="</ul>"
                    output +="<a data-v-41f56098='' href='http://localhost:9000/dmu/adminticketlist_content.do?did="+aj.did+"' class='title'>" +aj.dtitle +"</a>"
                    
                    output +="<p data-v-41f56098='' class='explan'>" + aj.dtitle2 +"</p>"
                    
                    output +="<ul data-v-41f56098='' class='info'>"
                    
                    output +="<li data-v-41f56098=''>"
                    output +="<span data-v-41f56098='' class='tit'> 교육진행 </span>"
                    output +="<span data-v-41f56098='' class='txt'>"+aj.dstart+ " ~ " +aj.dend+"</span>"
                    output +="</li>"
                    
                    output +="<li data-v-41f56098=''>"
                    output +="<span data-v-41f56098='' class='tit'> 장소  </span>"
                    output +="<span data-v-41f56098='' class='txt'>"+ aj.dplace +"</span>"
                    output +="</li>"
                    
                    output +="<li data-v-41f56098=''>"
                    output +="<span data-v-41f56098='' class='tit'> 대상 </span>"
                    output +="<span data-v-41f56098='' class='txt'>"+ aj.dtarget +"</span>"
                    output +="</li>"
                    
                    output +="<li data-v-41f56098=''>"
                    output +="<span data-v-41f56098='' class='tit'> 교육시간 </span>"
                    output +="<span data-v-41f56098='' class='txt'>"+ aj.dtime +"</span>"
                    output +="</li>"
                    
                    output +="<li data-v-41f56098=''>"
                    output +="<span data-v-41f56098='' class='tit'> 참가비 </span>"
                    output +="<span data-v-41f56098='' class='txt'>"+ aj.dprice +"원</span>"
                    output +="</li>"
                    output +="</ul>"
                    output +="</li>"
                    output +="</ul>" 
                 }//for
                 
                    output +=   "</ul></div>"      
                   
                  var more_list = "<div data-v-41f56098='' class='btn-more-area' id='btn_learn'>";
                     more_list += "<div data-v-26e42198='' data-v-41f56098='' class='btn-area'>"
                     more_list += "<button data-v-26e42198='' id='more_button'class='secondary more'>더보기</button>";
                     more_list += "</div></div>";
                 }else{
                 var output =   "<div data-v-e20ce500='' data-v-080a389a='' class='previous-list no-data' id='ticket_list_learn'>"
                    output +="<div data-v-e20ce500='' data-v-080a389a='' class='no-result'>";   
                     output +="<p data-v-e20ce500='' data-v-080a389a=''>프로그램 준비중입니다.</p></div></div>"
                 }//else
                    output +="</div>" 
                    output +="</div>" 
                    output +="</div>" 
                    
                    $("#ticket_list_learn").remove();
                    $("#btn_learn").remove();
                    $(".list-top-area").after(output);
                 
                    if(dataset.dbCount > dataset.endCount){
                       $("#ticket_list_learn").after(more_list);
                       $("#btn_learn").off("click").click(function(){
                          ajax_orderby_list(day, dtarget, rpage+1);
                       });//click
                    }//if
              },
                     error : function(data){
                     alert('error');
                     }//error 출력 
                 })//ajax
    }
    
    $('#more_button').click(function(){
       
       $(location).attr('href', "http://localhost:9000/dmu/adminlearn_list.do?rpage="+${rpage+1});
       });
        var rpage = "${rpage}";
       if(rpage != 1){
          
          var offset = $(".learnlist_move:nth-child(" + ((rpage-1) * 3 + 1) + ")").offset(); 
          $("html, body").scrollTop(offset.top);
    }
 });
</script>
<style type="text/css">
</style>
</head>
<body>
   <iframe src="header.do" width="100%" height="200px" scrolling="no"
      frameborder=0 class="header"
      style="position: absolute; overflow: hidden;"></iframe>
   <div style="width: 100%; height: 17vh; color: transparent">헤더</div>
   <main>
      <div data-v-ec5a0c2c="" class="root-container">
         <div data-v-ec5a0c2c="" class="content-wrapper">
            <div data-v-ec5a0c2c="" class="body-wrapper">
               <div data-v-7b1f57c8="" data-v-ec5a0c2c="">
                  <div data-v-7b1f57c8="" class="sub-contents-area">
                     <div data-v-6d324aa0="" data-v-7b1f57c8=""
                        class="step-process-area">
                        <ul data-v-6d324aa0="">
                           <li data-v-6d324aa0="" class="on"><span
                              data-v-6d324aa0="" class="no">01</span> <span
                              data-v-6d324aa0="" class="txt">learn list</span></li>
                           <li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
                              class="no">02</span> <span data-v-6d324aa0="" class="txt">ticket
                                 content</span></li>
                           <li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
                              class="no">03</span> <span data-v-6d324aa0="" class="txt">write/update/delete</span>
                           </li>
                        </ul>
                     </div>
                     <div data-v-7b1f57c8="" class="container">
                        <div data-v-7b1f57c8="" class="ticket-list-area">
                           <div data-v-7b1f57c8="">
                              <div data-v-7b1f57c8="" class="snb-area">

                                 <ul data-v-7b1f57c8="" class="snb">
                                    <li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
                                       href="http://localhost:9000/dmu/adminexhibition_list.do"
                                       role="button">EXHIBITION </a></li>

                                    <li data-v-7b1f57c8="" class="on"><a data-v-7b1f57c8=""
                                       href="http://localhost:9000/dmu/adminlearn_list.do"
                                       role="button">LEARN </a></li>
                                    <li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
                                       href="http://localhost:9000/dmu/adminevent_list.do"
                                       role="button">EVENT </a></li>
                                 </ul>
                              </div>

                              <div data-v-7b1f57c8="" class="sub-contents-area">
                                 <div data-v-41f56098="" data-v-7b1f57c8="" class="container">
                                    <div data-v-41f56098="" class="division-list">
                                       <ul data-v-41f56098="">
                                          <li data-v-41f56098="" class="on"><a
                                             data-v-41f56098="" class="learn_target" id="all">전체</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="유아">유아</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="어린이">어린이</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="청소년">청소년</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="대학생">대학생</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="성인">성인</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="교사">교사</a></li>

                                          <li data-v-41f56098="" class=""><a data-v-41f56098=""
                                             class="learn_target" id="전시해설">전시해설</a></li>
                                       </ul>
                                    </div>

                                    <div data-v-41f56098="" class="list-top-area"
                                       id="list-top-area1">

                                       <span data-v-41f56098="" class="total">총 <strong>${dbCount}</strong>건
                                       </span>
                                       <ul data-v-41f56098="" class="order">
                                          <li data-v-3c1f59cb="" class="">
                                             <a data-v-3c1f59cb="" href="adminticketlist_write.do">
                                             <button type="button" class="btn_style">글쓰기</button>
                                             </a>         
                                          </li>
                                          <li data-v-41f56098="" class="orderby" id="0"><a
                                             data-v-41f56098="">시작일 순</a></li>

                                          <li data-v-41f56098="" class="orderby" id="1"><a
                                             data-v-41f56098="">종료일 순</a></li>
                                       </ul>
                                    </div>
                                    <div data-v-41f56098="" class="ticket-list learn"
                                       id="ticket_list_learn">
                                       <c:if test="${not empty list}">
                                          <c:forEach var="vo" items="${list}">

                                             <ul data-v-41f56098="" class="learnlist_move">
                                                <li data-v-41f56098=""><c:if
                                                      test="${vo.dsfile != null }">
                                                      <a data-v-41f56098=""
                                                         href="http://localhost:9000/dmu/adminticketlist_content.do?did=${vo.did}"
                                                         class="thumb"> <img data-v-2fed1a9a=""
                                                         data-v-1e8092ec=""
                                                         src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"></a>
                                                   </c:if>

                                                   <ul data-v-41f56098="" class="flag" style="display:flex;">
                                                      <li data-v-41f56098="">${vo.dnum}</li>
                                                      <li data-v-41f56098="">${vo.dplace}</li>

                                                      <!---->
                                                      <!---->
                                                   </ul> <a data-v-41f56098=""
                                                   href="http://localhost:9000/dmu/adminticketlist_content.do?did=${vo.did}"
                                                   class="title">${vo.dtitle}</a>

                                                   <p data-v-41f56098="" class="explan">${vo.dtitle2 }</p>

                                                   <ul data-v-41f56098="" class="info">
                                                      <li data-v-41f56098=""><span data-v-41f56098=""
                                                         class="tit">교육진행</span> <span data-v-41f56098=""
                                                         class="txt">${vo.dstart} ~ ${vo.dend}</span></li>
                                                      <li data-v-41f56098=""><span data-v-41f56098=""
                                                         class="tit">장소</span> <span data-v-41f56098=""
                                                         class="txt">${vo.dplace}</span></li>
                                                      <li data-v-41f56098=""><span data-v-41f56098=""
                                                         class="tit">대상</span> <span data-v-41f56098=""
                                                         class="txt">${vo.dtarget}</span></li>
                                                      <li data-v-41f56098=""><span data-v-41f56098=""
                                                         class="tit">교육시간</span> <span data-v-41f56098=""
                                                         class="txt">${vo.dtime}</span></li>
                                                      <li data-v-41f56098=""><span data-v-41f56098=""
                                                         class="tit">참가비</span> <span data-v-41f56098=""
                                                         class="txt">${vo.dprice} 원</span></li>
                                                   </ul></li>
                                             </ul>

                                          </c:forEach>
                                       </c:if>
                                       <c:if test="${empty list }">
                                          <div data-v-97ddc3ec="" class="no-data">
                                             <div data-v-e20ce500="" data-v-080a389a=""
                                                class="no-result" id="ticket_list_learn">
                                                <p data-v-e20ce500="" data-v-080a389a="">프로그램 준비중입니다.</p>
                                             </div>
                                          </div>
                                       </c:if>


                                    </div>

                                    <c:if test="${ rpage lt pageCount }">
                                       <div data-v-41f56098="" class="btn-more-area"
                                          id="btn_learn">
                                          <div data-v-26e42198="" data-v-41f56098=""
                                             class="btn-area">
                                             <button data-v-26e42198="" id="more_button"
                                                class="secondary more">더보기</button>
                                          </div>
                                       </div>
                                    </c:if>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>
   <iframe src="footer.do" width="100%" height="490px" scrolling="no"
      frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>
</body>
</html>