$(document).ready(function(){

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
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
			});
		}
		

		/************************ mypage_member_check.do *****************************/

		//비밀번호 유효성 체크
		$("button.member_check").click(function(){
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
		});//click
		
		
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
			popup_login("변경사항을 저장하시겠습니까?");
			$("#popup_joinOk").click(function(){
				$("form").attr({
					"name" : "updateMemberForm",
					"action" : "update_info.do"
				});
				$(".type_check").val(type);
				updateMemberForm.submit();
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
			$("#popup_joinOk").click(function(){
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