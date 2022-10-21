$(document).ready(function(){

	//페이징 리스트 출력
	function page(dbCount, rpage, pageSize){
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: dbCount,	// total rows	
		    page: rpage,		// initial page		
		    pageSize: pageSize,	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
	}
	
	function inquiry_popup_set(){
		//스타일 초기화
		$(".popup_admin_inquiry_form").scrollTop(0);
		$(".background_admin_inquiry").addClass("show");
		$(".window_admin_inquiry").addClass("show");
		$(".admin_inquiry_detail_close").click(function(){
			close_inquiry_popup();
		});
		$("#inquiry_check").click(function(){
			if($("#inquiry_check").is(":checked")){
				$(".admin_inquiry_detail_ok").attr("disabled", false);
			}else{
				$(".admin_inquiry_detail_ok").attr("disabled", true);
			}
		});
	}
	
	function close_inquiry_popup(){
		$(".background_admin_inquiry").removeClass("show");
		$(".window_admin_inquiry").removeClass("show");
		$("div.popup_admin_inquiry_answer_content textarea").val("");
		$("#inquiry_check").prop("checked", false);
		$(".admin_inquiry_detail_ok").attr("disabled", true);
	}
	//탭 메뉴
	$(".admin-inquiry-search div").click(function(){
		$(".admin-inquiry-search div").removeClass("inquiry_on");
		$(this).addClass("inquiry_on");
		inquiry_ajax(1);
	});
	
	//list ajax
	
	inquiry_ajax(1);
	function inquiry_ajax(rpage){
		$.ajax({
			type : "post",
			cache : false,
			data : {
				rpage : rpage,
				answerType : $(".inquiry_on").attr("data-type")
			},
			url : "adminpage_inquiry_list_ajax.do",
			success : function(result){
				let data = JSON.parse(result);
				
				let output = "";
				//결과 값이 없을 경우
				if(data.list.length == 0){
					output += "<div class = 'inquiry-info-list-no'>";
					output += "<div class='no-result'>";
					output += "<p>문의 사항이 없습니다.</p></div></div>";
				}else{
					//결과 값이 있을 경우
					output += "<div data-v-1b9c8af9='' data-v-080a389a='' class='search-result'>";
					output += "총 <strong>" + data.dbCount + "</strong>건";
					output += "</div>";
					output += "<div class = 'inquiry-info-list'>";
				
					output += "<ul style='list-style:none;' class = 'inquiry_list_ajax'>";
					for(dataset of data.list) {
						output += "<li>";
						output += "<div class = 'admin-inquiry-author'>";
						output += "<img src='http://localhost:9000/dmu/resources/images/public.svg'>";
						output += "<div style = 'margin: 10px 0 0 0;'>"
						output += "<span class = 'author'>작성자</span><span>" + dataset.mid + "</span>";
						output += "</div></div>";
						output += "<div class = 'admin-inquiry-info-list'>";
						output += "<div>";
						output += "<div class = 'admin-inquiry-category'>";
						output += "<div><span>미술관</span><span class = 'category'>" + dataset.iqcategory + "</span>";
						output += "<span>문의 유형</span><span class = 'type'>" + dataset.iqtype + "</span></div>";
						output += "<div><span>문의 등록일</span><span>" + dataset.iqdate +"</span></div></div>";
						output += "<div><h2>" + dataset.iqtitle + "</h2></div>";
						output += "</div></div>";
						
						if(dataset.iqanswer == 'n') {
							output += "<button type = 'button' class = 'admin-inquiry-answer' data-id = '" + dataset.iqid +"'>";
							output += "<img src = 'http://localhost:9000/dmu/resources/images/airplane.png'>";
							output += "<div>답변 보내기</div><hr class = 'back_hr1'><hr class = 'back_hr2'><hr class = 'back_hr3'>";
							output += "</button>";
							output += "</li>";
						}else{
							output += "<button type = 'button' class = 'admin-inquiry-answer-ok'>";
							output += "<div>답변 완료</div></button>";
						}
					}
					output += "</ul></div>";
					output += "<div id='ampaginationsm' style='text-align:center;'></div>";
				}
				
				$(".myinfo-box div.inquiry-info-list-no").remove();
				$(".myinfo-box div.search-result").remove();
				$(".inquiry_list_ajax").remove();
				$("#ampaginationsm").remove();
				$(".myinfo-box").append(output);
			
				//문의사항 상세보기 및 답변 팝업창
				$(".admin-inquiry-answer").click(function(){
					//alert($(this).attr("data-id"));
					inquiry_popup_set();
					inquiry_content_popup($(this).attr("data-id"));
				});
				
				if(data.list.length != 0){
					//페이징 처리
					page(data.dbCount, data.rpage, data.pageSize);
					
					//페이징 번호 클릭 시 이벤트 처리
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
						    jQuery('.showlabelsm').text('The selected page no: '+e.page);;
							inquiry_ajax(e.page);      
				    });
				}//페이징-if
			}//success
		});//ajax-list
	}//function-list
	
	
	//문의사항 상세 보기
	function inquiry_content_popup(iqid){
		$.ajax({
			type : "post",
			context : this,
			cache : false,
			data : {
				iqid : iqid
			},
			url : "adminpage_inquiry_content_ajax.do",
			success : function(result) {
				let data = JSON.parse(result);
				
				$("div.popup_admin_inquiry_form div.admin_category_list span.category > span.second").text(data.iqcategory);
				$("div.popup_admin_inquiry_form div.admin_category_list span:nth-child(2) > span.second").text(data.iqtype);
				$("div.popup_admin_inquiry_form div.admin_inquiry_write_date p > span").text(data.iqdate);
				$("div.popup-admin-inquiry-author span:nth-child(2)").text(data.mid);
				$("div.popup_admin_inquiry_form div.admin_inquiry_write_content p").text(data.iqtitle);
				$("div.popup_admin_inquiry_form div.admin_inquiry_write_content div").text(data.iqcontent);


				//답변하기 전송 버튼
				$(".admin_inquiry_detail_ok").off("click").click(function(){
					if($(".inquiry_response").val() == "") {
						$("div.popup_admin_inquiry_answer_content div").css("display", "flex");
						$(".inquiry_response").focus();
						return false;
					}else{
						//textarea 줄바꿈 변환
						let answer = $(".inquiry_response").val().replace(/(?:\r\n|\r|\n)/g, "<br/>");
						inquiry_email_response(answer, iqid, data.mid);
					}
				});
			}//success
		});//ajax-content
	}//function
	
	//유효성 체크
	$(".inquiry_response").keyup(function(){
		if($(".inquiry_response").val() != "") {
			$("div.popup_admin_inquiry_answer_content div").css("display", "none");
			return false;
		}
	});
	
	//이메일 전송 및 반환
	function inquiry_email_response(answer, iqid, mid){
		$.ajax({
			type : "post",
			context : this,
			cache : false,
			data : {
				answer : answer,
				iqid : iqid,
				mid : mid
			},
			url : "inquiry_response.do",
			success : function(result) {
				let data = JSON.parse(result);

				if(data.email_response == "success") {
					close_inquiry_popup();
					$(".background_inquiry_result").addClass("show");
					$(".window_inquiry_result").addClass("show");
					$(".inquiry_result_success").click(function(){
						$(location).attr("href", "http://localhost:9000/dmu/adminpage_inquiry_list.do");
					});
				}
			}//success
		});//ajax
	}//function
});