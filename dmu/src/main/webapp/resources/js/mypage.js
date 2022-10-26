$(document).ready(function(){
		/********************************** mypage_ticket_content ************************************/

		$(".ticket_cancle").click(function(){
			if($(".ticket_list:checked").length == 0){
				$(".background_join").addClass("show_join");
				$(".window_join").addClass("show_join");
				$("#popup_joinOk").click(function(){
					$(".background_join").removeClass("show_join");
					$(".window_join").removeClass("show_join");
				});
			}else {
				$(".refund_content").scrollTop(0);
				$("body").css("overflow", "hidden");
				$("#refund_ticket_check_box").prop("checked", false);
				$(".refund_ticket_btn").prop("disabled", true);
				$(".background_refund").addClass("show_refund");
				$(".window_refund").addClass("show_refund");
				$(".refund_popup_close").click(function(){
					$("body").css("overflow", "auto");
					$(".background_refund").removeClass("show_refund");
					$(".window_refund").removeClass("show_refund");
				});
				

				/* 선택한 티켓 정보 받기*/
				function style_table(index_result){
					let output = "<tr class='ticket_info purchase_result" + index_result + "'>";
					output += "<input type = 'hidden' name = 'ticket_list' id = 'ticket_id'>";
					output += "<td class='ticket_num'></td>";
					output += "<td class='ticket_date'></td>";
					output += "<td class='ticket_status'><strong></strong></td>";
					output += "<td class='ticket_price'></td>";
					output += "</tr>";
					
					return output;
				}
				
				let total = 0;
				let ticket_list = [];
				$(".ticket_info").remove();
				
				$(".ticket-result-list-content table input.ticket_list:checked").each(function(index, el){
					let index_tr = $(el).parent().parent().index();
					let table = $(".ticket-result-list-content table tr:nth-child(" +  (index_tr + 1) + ")");
					let standard = $(".refund_ticket_list table tr:last-child");

					standard.before(style_table(index_tr));

					let tid = table.children(".purchase_tid").text();
					let dtitle = table.children(".purchase_dtitle").text();
					let rdate = table.children(".purchase_rdate").text();
					let status = table.children(".ticket_list_status strong").text();
					let price = $(".ticket_purchase strong").text();
					
					$("tr.purchase_result" + index_tr + " td.ticket_num").text(tid);
					$("tr.purchase_result" + index_tr + " td.ticket_date").text(rdate);
					$("tr.purchase_result" + index_tr + " td.ticket_status").text("취소가능");
					$("tr.purchase_result" + index_tr + " td.ticket_price").text(price);

					total += intChange(price);
					$(".total_count").text(numberFormat(total) + "원");
					
					
					//티켓 번호 전송
					ticket_list.push(tid);
					$("tr.purchase_result" + index_tr + " input#ticket_id").val(tid);
				});//each
				

				//티켓 정보 전송
				$(".refund_ticket_btn").click(function(){
					//refundForm.submit();
					
					$.ajax({
						type : "post",
						data : {
							"ticketList" : ticket_list,
							"rtotal" : $("#reservation_ticket_total").val(),
							"rid" : $("#reservation_ticket_rid").val()
						},
						url : "mypage_ticket_cancel.do",
						success : function(result){

							if(result == "update_success"){
								$("div.popup_ticket_refund_result p").text("예매 취소가 완료되었습니다.");
							}else if(result == "fail") {
								$("div.popup_ticket_refund_result p").text("환불에 실패했습니다.");
							}else{
								$("div.popup_ticket_refund_result p").text("선택하신 티켓의 취소가 완료되었습니다.");
							}
							$(".background_refund").removeClass("show_refund");
							$(".window_refund").removeClass("show_refund");
							$(".background_ticket_refund_result").addClass("show");
							$(".window_ticket_refund_result").addClass("show");
							$("#ticket_refund_result_btn").click(function(){
								$(location).attr("href", "http://localhost:9000/dmu/mypage_ticket.do");
							});
						}//success
						
					});//ajax
				});//click-function
				
			}//else
		});//click-function
		
		function intChange(price) {
			return parseInt(price.replace(",", "").replace("원", ""));
		}
		
		function numberFormat(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		/*** content size ****/
		$("#refund_ticket_check_box").change(function(){
			if($(this).is(":checked")){
				$(".refund_ticket_btn").prop("disabled", false);
			}else{
				$(".refund_ticket_btn").prop("disabled", true);
			}
		});
		
		
		
		/*************************************** mypage_ticket **************************************/
		
		
		
		/************************** 조회 기능  ***************************/
		//카테고리 선택
		$("div.snb-area ul.snb li").click(function(){
			$("div.snb-area ul.snb li").removeClass("show_ticket");
			$(this).addClass("show_ticket");
			ticket_reservation_ajax(1, $(this).attr("data-dcode"), $("#datepicker1").val(), $("#datepicker2").val());
		});
		
		//날짜 검색	
		$("#search_date").click(function(){
			ticket_reservation_ajax(1, $(".show_ticket").attr("data-dcode"), $("#datepicker1").val(), $("#datepicker2").val());
		});
		
		//ajax 실행
		ticket_reservation_ajax(1, $(".show_ticket").attr("data-dcode"), $("#datepicker1").val(), $("#datepicker2").val());

		function ticket_reservation_ajax(rpage, dcode, startdate, enddate){
			$.ajax({
				type : "post",
				data : {
					rpage : rpage,
					dcode : dcode,
					startdate : startdate,
					enddate : enddate
				},
				url : "mypage_ticket_list.do",
				success : function(result) {
					let data = JSON.parse(result);
					let output = "";
					
					if(data.list.length == 0){
						output += "<div class='no-result_purchase' style='margin: 0 15px 0 0;'>";
						output += "<div class='no-result'>";
						output += "<p>예매 내역이 없습니다.</p></div></div>";
					}else{
						output += "<ul id = 'reservation_list_ul' style = 'list-style:none;'>"
						
						for(dataset of data.list){
							output += "<li>"
							output += "<div class='result_purchase'>";
							output += "<div class='purchase_result_list'>";
							output += "<div class='purchase-result-list-title'>";
							output += "<p>예매일시 <strong> " + dataset.rokdate + "</strong></p>";
							output += "<p>예매번호 <a href = 'mypage_ticket_content.do?rid=" + dataset.rid + "'>" + dataset.rid + "</a></p>";
							output += "</div>";
							output += "<div class='purchase-result-list-content'>";
							output += "<div>";
							output += "<div class='purchase-result-content-title'>";
							output += "<a href='mypage_ticket_content.do?rid=" + dataset.rid + "'>";
							output += "<img src='http://localhost:9000/dmu/resources/upload/" + dataset.dsfile + "'>";
							output += "</a>";
							output += "<div class='purchase-result-list-content-text'>";
							output += "<a href='mypage_ticket_content.do?rid=" + dataset.rid + "'><strong style = 'font-weight : 800;'>" + dataset.dtitle + "</strong></a>";
							output += "<div>";
							output += "<span class='date'>" + dataset.dcode + "</span><span>" + dataset.rtotal + "매</span>";
							output += "</div></div></div>";
							output += "<div class='purchase-result-list-content-status'>";
							if(dataset.rcheck == 'y'){
								output += "<strong>예매완료</strong>";
							}else if(dataset.rcheck == 'ex'){
								output += "<strong>기간만료</strong>";
							}else if(dataset.rcheck == 'n'){
								output += "<strong>예매취소</strong>";
							}else{
								output += "<strong>사용불가</strong>";
							}
							
							output += "</div></div></div></div></div></li>";
						}
						output += "</ul>";
						output += "<div id='ampaginationsm' style='text-align:center;'></div>";
					}
					
					$(".no-result_purchase").remove();
					$("#reservation_list_ul").remove();
					$("#ampaginationsm").remove();
					$(".search-area").append(output);
					
					paging_ajax(data.dbCount, data.rpage, data.pageSize);

					//페이징 번호 클릭 시 이벤트 처리
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
						   jQuery('.showlabelsm').text('The selected page no: '+e.page);
						   ticket_reservation_ajax(e.page, $(".show_ticket").attr("data-dcode"), $("#datepicker1").val(), $("#datepicker2").val());
				    });
					
				}//success
			});//ajax
		}//funtion
		
		//페이징 리스트 출력
		function paging_ajax(dbCount, rpage, pageSize){
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
		

		
		
		/********* function list *********/
		
		//주의 문구 띄우는 함수
		function warningCheck(check, obj, coment){
			let style_warning = "<div class = 'check_join'>"
				style_warning += "<img src = 'http://localhost:9000/dmu/resources/images/warning.png' class = 'join_warning'>";
				style_warning += "<span></span></div>";
			if(check == true){
			
				obj.next().remove();
				obj.after(style_warning);
				
				obj.next().children(".join_warning").css({"height" : "20px", "margin-right" : "10px", "width" : "auto"});
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
		
		
		/********* popup setup *********/
		function popup_login(guideLine) {
			$("#popup_joinNo").text("취소");
			$("#popup_joinOk").css("display", "inline");
			$(".background_join").addClass("show_join");
			$(".window_join").addClass("show_join");
			$("#popup_joinGuide").html(guideLine);
			$("#popup_joinGuide").css({"line-height" : "1.5rem"});
			$("#popup_joinNo").click(function() {
				$("#popup_joinOk").css("display", "inline-block");
				$("#unregister_member").css("display", "none");
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
			});
		}
		

		/************************ mypage_member_check.do *****************************/

		//비밀번호 유효성 체크
		$("button.member_check").click(function(){
			member_check_ajax();
		});//click
		
		$("input.passwordCheck").keyup(function(e){
			if(e.keyCode == 13) {
				member_check_ajax();
			}
		});//key-up
		
		function member_check_ajax(){
			if($(".passwordCheck").val() == ""){
				warningCheck(true, $("div.myinfo-box div.check_normal_area div.pass_check_area"), "비밀번호를 입력해주세요.");
			}else{
				//mypageMemberCheckForm.submit();
				$.ajax({
					type : "post",
					data : {
						pass : $(".passwordCheck").val()
					},
					url : "mypage_member_confirm.do",
					success : function(result) {
						let data = JSON.parse(result);
						
						if(data.check_result == "fail") {
							warningCheck(true, $("div.myinfo-box div.check_normal_area div.pass_check_area"), "비밀번호가 일치하지 않습니다.");
						}else{
							$(location).attr("href", "http://localhost:9000/dmu/mypage_member.do");
						}
					}
				});//ajax
			}//if~else
		}
		
		
		/************************ mypage_member.do **********************************/
		let passRule = /^(?=.*[a-xA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,14}$/;
		$(".primary").click(function(){
			let password = $(".pass").val();
			let pass_check = $(".new-pass").val();
			let zonecode = $("#zonecode").val();
			let addr1 = $("#addr1").val();
			let addr2 =  $("#addr2").val();
			if(password == "" && pass_check == "" && zonecode == "" && addr1 == "" && addr2 == ""){
				popup_login("변경된 정보가 없습니다.");
				$("#popup_joinOk").css("display", "none");
				$("#popup_joinNo").text("확인");

				return false;
			}else{
				if(password != "" || pass_check != ""){
					
					if(!passRule.test($(".pass").val())){
						$(".pass").focus();
						return false;
					}else if($(".passCheck").val() != $(".pass").val()){
						warningCheck(true, $(".new-pass-check"), "비밀번호가 일치하지 않습니다.");
						$(".new-pass").focus();
						return false;
					}else{
						member_info_udpate("password");
					}
				}else if(zonecode != "" || addr1 != "" || addr2 != ""){
					if(zonecode == "" || addr1 == "" || addr2 == "") {
						popup_login("주소를 입력해주세요.");
						$("#popup_joinOk").css("display", "none");
						$("#popup_joinNo").text("확인");
					}else{
						member_info_udpate("address");
					}
				}
			}
		});
		
		//변경 내용 저장
		function member_info_udpate(type){
			$("form").attr({
				"name" : "updateMemberForm",
				"action" : "update_info.do"
			});
			
			popup_login("변경사항을 저장하시겠습니까?");
			
			$("#popup_joinOk").click(function(){
				
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
				
				$(".type_check").val(type);
				let formData = $(".mypage_member_form").serialize();
				$.ajax({
					type : "post",
					data : formData,
					cache : false,
					url : "update_info.do",
					success : function(result){
						let data = JSON.parse(result);
						if(data.update_result == "exist"){
							warningCheck(true, $(".new-pass"), "직전 비밀번호는 사용하실 수 없습니다.");
							$(".pass").focus();
							return false;
						}else if(data.update_result == "success"){
							warningCheck(false, $(".new-pass"), "");
							popup_login("변경이 완료되었습니다.");
							$("#popup_joinOk").css("display", "none");
							$("#popup_joinNo").text("확인");
							$("#popup_joinNo").click(function() {
								$(location).attr("href", "http://localhost:9000/dmu/mypage_member.do");
							});
						}
					}
				});
				
				/*$("form").attr({
					"name" : "updateMemberForm",
					"action" : "update_info.do"
				});
				updateMemberForm.submit();*/
			});
		}
		
		$(".pass").keyup(function(){
			let password = $(".pass").val();
			if($(this).val() != ""){
				if(!passRule.test(password)){
					warningCheck(true, $(".new-pass"), "10~14자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.");
				}else{
					warningCheck(false, $(".new-pass"), "");
				}
			}else{
				warningCheck(false, $(".new-pass"), "");
				if($(".passCheck").val() == "") {
					warningCheck(false, $(".new-pass-check"), "");
				}
			}
		});
	
		$(".passCheck").keyup(function(){
			if($(".pass").val() != ""){
				if($(".passCheck").val() != ""){
					if($(".passCheck").val() != $(".pass").val()){
						warningCheck(true, $(".new-pass-check"), "비밀번호가 일치하지 않습니다.");
					}else{
						warningCheck(false, $(".new-pass-check"), "");
					}
				}else{
					warningCheck(false, $(".new-pass-check"), "");
				}
			}else{
          	  if($(this).val() == ""){
              	 warningCheck(false, $(".new-pass-check"), "");
            }
         }
		});
		
		/********* address API *********/
		$("#addressCheck").click(function() {
			var themeObj = {
				searchBgColor : "#080808",
				queryTextColor : "#F8F8F8"
			};
			new daum.Postcode({
				theme : themeObj,
				oncomplete : function(data) {
					$("#zonecode").val(data.zonecode);
					$("#addr1").val(data.address);
				}
			}).open();
		});
		
		//탈퇴 버튼
		$(".status_none").click(function(){
			popup_login("탈퇴하시겠습니까?");
			$("#popup_joinOk").css("display", "none");
			$("#unregister_member").css("display", "inline-block");
			$("#unregister_member").click(function(){
				$("form").attr({
					"name" : "deleteMemberForm",
					"action" : "delete_member.do"
				});
				deleteMemberForm.submit();
			});
		});
		
		//저장 버튼
		
		
		//취소 버튼
		$(".secondary").click(function(){
			$(location).attr("href", "mypage_main.do");
		});
	
});