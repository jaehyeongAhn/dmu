$(document).ready(function() {
		/*********************************** /join/terms.do **************************************/
		
		//전체 동의
		$("#all_check").click(function(){
			$( '.terms' ).prop( 'checked', this.checked );
			$("#nextJoinPage").prop("disabled", !this.checked);
		});

		$(".terms").change(function(){
			let check = $(".terms").filter(":checked").length;
			
			if(check == 3){
				$("#all_check").prop("checked", true);	
				$("#nextJoinPage").prop("disabled", false);
			}else{
				$("#all_check").prop("checked", false);
				$("#nextJoinPage").prop("disabled", true);
			}
		});
		
		//join.do 페이지로 넘어감
		$("#nextJoinPage").click(function(){
			join_termsForm.submit();
		});





		/*********************************** /join/join.do ***************************************/

		/********* function list *********/
		
		//주의 문구 띄우는 함수
		function warningCheck(check, obj, coment){
			let style_warning = "<div class = 'check_join'>"
				style_warning += "<img src = 'http://localhost:9000/dmu/resources/images/warning.png' class = 'join_warning'>";
				style_warning += "<span></span></div>";
			if(check == true){
				
				/* $(".check_join").addClass(name);
				if(document.querySelector(name) ) */
				
				//$(".check_join").remove();
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
		
		//이메일 유효성 체크
		function emailCheck(){
			//email validation check
			let emailRule = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			let email = $("#email1").val()+"@"+$("#email2").val();
			if(!emailRule.test(email)){
				$("#email1").css("border", "0.5px solid red");
				$("#email2").css("border", "0.5px solid red");
				
				warningCheck(true, $(".emailTable"), "유효하지 않은 이메일 형식입니다.");
				$("#accredit_send").attr("disabled", true);
				
				return false;
			}else{
				$("#email1").css("border", "0.5px solid #dcdcdc");
				$("#email2").css("border", "0.5px solid #dcdcdc");
				
				warningCheck('ok', $(".emailTable"), "사용 가능한 이메일입니다.");
				if($("#name_check").val() == ""){
					$("#accredit_send").attr("disabled", true);		
					warningCheck(true, $("#idInput"), "이름을 입력해주세요");		
				}else{
					warningCheck(false, $("#idInput"), "");
					$("#accredit_send").attr("disabled", false);				
				}
			}
			
			return true;
		}
		
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


		/********* email check *********/
		$("#email3").change(function() {
			if($(this).val() == "default"){
				$("#email2").val("");
				$("#email2").attr("readonly", false);
				$("#email2").focus();
				emailCheck();
			}else{
				$("#email2").val("");
				$("#email2").attr("readonly", true);
				$("#email2").val($(this).val());
				emailCheck();
			}
		});
		
		
		$("#email2").keyup(function(){
			emailCheck();
		});
		$("#email1").keyup(function(){
			emailCheck();
		});


		/********* id check *********/
		let idRule = /^(?!(?:[0-9]+)$)([-_]?[a-zA-Z]|[-_]?[0-9a-zA-Z]){6,12}$/;
		$("#did").keyup(function(){
			let id = $("#did").val();
			if($("#did").val() == ""){
				$("#idCheck").attr("disabled", true);
				warningCheck(true, $(".idTable"), "아이디를 입력해 주세요.");
			}else if(!idRule.test($("#did").val())){
				warningCheck(true, $(".idTable"), "6~12자의 영문 혹은 영문과 숫자를 조합하여 입력해 주세요.");
			}else{
				$("#idCheck").attr("disabled", false);
				warningCheck(false, $(".idTable"), "");
			}
		});
		
		let check_result_id = 0;
		$("#did").keyup(function(){
			check_result_id = 0;
			if($("#did").val().length == 0){
				$("#idCheck").attr("disabled", true);
			}else{
				$("#idCheck").attr("disabled", false);
			}
		});
		
		/********* id 중복 check **********/
		$("#idCheck").click(function(){
			if($("#idCheck") != "" && idRule.test($("#did").val())){
				$.ajax({
					type : "post",
					url : "join_idCheck.do",
					data : {
						mid : $("#did").val()
					},
					success : function(result){
						if(result == 0){
							warningCheck("ok", $(".idTable"), "사용 가능한 아이디입니다.");
							check_result_id = 1;
						}else if(result == 1){
							warningCheck(true, $(".idTable"), "사용 중인 아이디입니다.");
							/*$("#joinOk").click(function() {
								popup_setup("아이디 중복 체크를 해주세요.", $("#did"));
								return false;
							});*/
						}
					}//success
				});//ajax
			}//if
		});//click
	
		
		/********* password check *********/
		//비밀번호 유효성 체크
		let passRule = /^(?=.*[a-xA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,14}$/;
		$("#pass").keyup(function(){
			if($("#pass").val() != ""){
				let password = $("#pass").val();
				if(!passRule.test(password)){
					warningCheck(true, $(".passTable"), "10~14자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.");
				}else{
					warningCheck(false, $(".passTable"), "");
				}
			}
		});
		//비밀번호 확인
		$("#passcheck").keyup(function(){
			if($("#passcheck").val() != "" && $("#pass").val() != ""){
				if($("#passcheck").val() != $("#pass").val()){
					warningCheck(true, $(".passCheckTable"), "비밀번호가 일치하지 않습니다.");
				}else{
					warningCheck(false, $(".passCheckTable"), "");
				}
			}
		});
		
		//이름 확인
		$("#dname").keyup(function(){
			if($("#dname").val() == 0){
				warningCheck(true, $(".nameTable"), "이름을 입력해 주세요.");
			}else{
				warningCheck(false, $(".nameTable"), "");
			}
		});
		
		/********* validation check *********/

		$("#joinOk").click(function() {
			if($("#did").val() == ""){
				warningCheck(true, $(".idTable"), "아이디를 입력해 주세요.");
				$("#did").focus();
				return false;
			}else if(!idRule.test($("#id").val())){
				warningCheck(true, $(".idTable"), "6~12자의 영문 혹은 영문과 숫자를 조합하여 입력해 주세요.");
				$("#id").focus();
				return false;
			}else if($("#pass").val() == "" || !passRule.test($("#pass").val())){
				warningCheck(true, $(".passTable"), "10~14자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.");
				$("#pass").focus();
				return false;
			}else if($("#passcheck").val() == ""){
				warningCheck(true, $(".passCheckTable"), "비밀번호가 일치하지 않습니다.");
				$("#passcheck").focus();
				return false;
			}else if($("#dname").val() == ""){
				warningCheck(true, $(".nameTable"), "이름을 입력해 주세요.");
				$("#dname").focus();
				return false;
			}else if($("#email1").val() == "" || $("#email2").val() == ""){
				popup_setup("이메일을 입력해 주세요.", $("#email1"));
				return false;
			}else if(!emailCheck()){
				popup_setup("유효하지 않은 이메일 형식입니다.", $("#email1"));
				return false;
			}else if($("#year").val() == "default" || $("#month").val() == "default" || $("#day").val() == "default"){
				popup_setup("생년월일을 선택해 주세요", $("#year"));
				return false;
			}else if($("#pnum2").val() == "" || $("#pnum3").val() == ""){
				popup_setup("휴대폰번호를 입력해 주세요", $("#pnum1"));
				return false;
			}else if($("#zonecode").val() == "" || $("#addr1").val() == ""){
				popup_setup("주소를 입력해주세요", $("#addr1"));
				return false;
			}else if($("#addr2").val() == ""){
				popup_setup("상세주소를 입력해 주세요.", $("#addr2"));
				return false;
			}else if(check_result_id == 0){
				popup_setup("아이디 중복 체크를 진행해주세요.", $("#did"));
				return false;
			}else{
				//joinForm.submit();
				let member = $("form[name='joinForm']").serialize();
				$.ajax({
					type : "post",
					context : this,
					cache : false,
					data : member,
					url : "joinController.do",
					success : function(result){
						if(result == 0){
							popup_setup("이미 가입된 계정입니다.", $("#email1"));
							warningCheck(true, $(".emailTable"), "이미 존재하는 이메일입니다.");
						}else{
							$(location).attr("href", "http://localhost:9000/dmu/join_ok.do");
						}
					}//success
				});//ajax
			}

		});

		/********* popup setup *********/
		function popup_setup(guideLine, obj) {
			$(".background_join").addClass("show_join");
			$(".window_join").addClass("show_join");
			$("#popup_joinGuide").text(guideLine);
			$("#popup_joinOk").click(function() {
				$(".background_join").removeClass("show_join");
				$(".window_join").removeClass("show_join");
				obj.focus();
			});
		}
		
		
		/************************************** login_idfind.do ***********************************/

		//아이디 찾기 name Check
		function find_check(obj){
			if(obj.val() == ""){
				warningCheck(true, $("#idInput"), "이름을 입력해주세요");
				$("#accredit_send").attr("disabled", true);
				
				warningCheck(true, $("#passInput"), "이름을 입력해주세요");
				$("#accredit_send_pass").attr("disabled", true);
			}else{
				warningCheck(false, $("#idInput"), "");
				if($("#email1").val() != "" && $("#email2").val() != "" ){
					$("#accredit_send").attr("disabled", false);
				}
				
				warningCheck(false, $("#passInput"), "");
				if($("#pass_email1").val() != "" && $("#pass_email2").val() != "" ){
					$("#accredit_send_pass").attr("disabled", false);
				}
			}
		}
		$("#name_check").keyup(function(){
			find_check($(this));
		});
		

		
		//인증번호 전송 버튼(아이디 찾기)
		$("#accredit_send").click(function(){
			let email = $("#email1").val() + "@" + $("#email2").val();
			if($("#email1").val() != "" && $("#email2").val() != "" ){
				if($("#name_check").val() != ""){
					$("#accredit_send").attr("disabled", false);
					warningCheck(false, $("#idInput"), "");
					warningCheck(false, $(".emailTable"), "");
					$.ajax({
						type : "post",
						url : "emailCheck.do",
						data : {
							email : email,
							name : $("#name_check").val()
						},
						success : function(result){
							if(result != 0){
								//이름과 이메일이 일치하면 이메일 인증 요청을 보내도록 함
								warningCheck('ok', $("#codeSet"), "인증메일이 전송되었습니다!");
								emailCode(email, "id");
							}else{
								//이름과 이메일이 존재하지 않으면 반환
								warningCheck(true, $(".emailTable"), "존재하지 않는 계정입니다");
							}
						}//success
					});//ajax
				}else{
					warningCheck(true, $("#idInput"), "이름을 입력해주세요");
				}
			}else{
				$("#accredit_send").attr("disabled", true);
			}
			
		});//click-event
		
				
		//인증번호가 일치하는지 판단하는 요소
		function emailCode(email, check_code){
			$.ajax({
				type : "post",
				url : "emailCode.do",
				data : {
					email : email
				},
				success : function(result){
					let code = parseInt(result);
					
					if(check_code == "id"){
						
						$("#id_accredit").keyup(function(){
							if($("#id_accredit").val().length > 0){
								$("#accredit_check").attr("disabled", false);
								
								//이메일 인증 완료 시 아이디 호출
								$("#accredit_check").click(function(){
									if($("#id_accredit").val() == result){
										warningCheck('ok', $("#codeSet"), "인증번호가 일치합니다.");
										$("#find_myid").attr("disabled", false);
										$("#find_myid").click(function(){
											loginIdFindForm.submit();
										});//id-find btn
									}else{
										warningCheck(true, $("#codeSet"), "인증번호가 일치하지 않습니다.");
										$("#find_myid").attr("disabled", true);
									}
								});//click
							}else{
								$("#accredit_check").attr("disabled", true);
							}
						});//key-up event
					
					}else {
						//비밀번호 찾기 인증번호
						$("#pass_accredit").keyup(function(){
							if($("#pass_accredit").val().length > 0){
								$("#pass_accredit_check").attr("disabled", false);
								
								//이메일 인증 완료 시 아이디 호출
								$("#pass_accredit_check").click(function(){
									if($("#pass_accredit").val() == result){
										warningCheck('ok', $("#pass_codeSet"), "인증번호가 일치합니다.");
										$("#find_mypass").attr("disabled", false);
										$("#find_mypass").click(function(){
											loginPassFindForm.submit();
										});//id-find btn
									}else{
										warningCheck(true, $("#pass_codeSet"), "인증번호가 일치하지 않습니다.");
										$("#find_mypass").attr("disabled", true);
									}
								});//click
							}else{
								$("#pass_accredit_check").attr("disabled", true);
							}
						});//key-up event
					}
				}//success
			});//ajax
		}
		
		/** ------------------------------------  비밀번호 찾기 ------------------------------------------ **/
		//인증번호 전송 버튼(비밀번호 찾기)
		$("#name_check_pass").keyup(function(){
			if($("#name_check_pass").val().length > 0){
				warningCheck(false, $("#passInput"), "");
			}else{
				warningCheck(true, $("#passInput"), "이름을 입력해주세요");
			}			
		});
		
		//비밀번호 찾기 페이지의 아이디 체크
		$(".idCheckPass").keyup(function(){
			if($(".idCheckPass").val().length > 0){
				warningCheck(false, $("#passID"), "");
				if($("#pass_email1").val() != "" && $("#pass_email2").val() != "" ){
					$("#accredit_send_pass").attr("disabled", false);
				}
			}else{
				warningCheck(true, $("#passID"), "아이디를 입력해주세요");
				$("#accredit_send_pass").attr("disabled", true);
			}			
		});
		
		
		/********* 아이디 찾기 페이지 email check *********/
		$("#pass_email1").keyup(function(){
			emailCheck_find();
		});
		
		$("#pass_email2").keyup(function(){
			emailCheck_find();
		});
		$("#pass_email3").change(function() {
			if($(this).val() == "default"){
				$("#pass_email2").val("");
				$("#pass_email2").attr("readonly", false);
				$("#pass_email2").focus();
				emailCheck_find();
			}else{
				$("#pass_email2").val("");
				$("#pass_email2").attr("readonly", true);
				$("#pass_email2").val($(this).val());
				emailCheck_find();
			}
		});

		
		
		/********* style 변경 **********/
		//스타일 삭제 함수			
		function removeStyle(){
			var removeList = [$("#idInput"), $("#codeSet"), $("#passInput"), $("#emailTable"), 
							$("#passId"), $("#emailPass"), $("#emailPass"), $("pass_codeSet")];
			//작성한 내용이나 스타일 삭제
			$("input").val("");
			$(".check_join").remove();
			
			warningCheck(false, $(".emailTable"), "");
			removeList.forEach(function(item, index, array){
				warningCheck(false, item, "");
			});
			$("#email1").css("border", "0.5px solid #dcdcdc");
			$("#email2").css("border", "0.5px solid #dcdcdc").attr("readonly", false);
			$("#pass_email1").css("border", "0.5px solid #dcdcdc");
			$("#pass_email2").css("border", "0.5px solid #dcdcdc").attr("readonly", false);
			
			$("#accredit_send").attr("disabled", true);
			$("#accredit_check").attr("disabled", true);
			$("#accredit_send_pass").attr("disabled", true);
			$("#pass_accredit_check").attr("disabled", true);
			$("#find_myid").attr("disabled", true);
			$("#find_mypass").attr("disabled", true);
		}
		
		$(".id_tab").click(function(){
			//기존 show class 삭제
			$(".id_tab div").removeClass("show");
			$(".pass_tab div").removeClass("show");
			$(".idfind form.pass_find").removeClass("show");
			
			removeStyle();
			
			$(".id_tab div").addClass("show");
			$(".idfind form.id_find").addClass("show");
		});
		$(".pass_tab").click(function(){
			//기존 show class 삭제
			$(".pass_tab div").removeClass("show");
			$(".id_tab div").removeClass("show");
			$(".idfind form.id_find").removeClass("show");
			
			removeStyle();
			
			$(".pass_tab div").addClass("show");
			$(".idfind form.pass_find").addClass("show");
		});
		
		//이메일 유효성 체크
		function emailCheck_find(){
			//email validation check
			let emailRule = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			let email = $("#pass_email1").val()+"@"+$("#pass_email2").val();
			if(!emailRule.test(email)){
				$("#pass_email1").css("border", "0.5px solid red");
				$("#pass_email2").css("border", "0.5px solid red");
				
				warningCheck(true, $(".emailPass"), "유효하지 않은 이메일 형식입니다.");
				
				$("#accredit_send_pass").attr("disabled", true);
				
				return false;
			}else{
				$("#pass_email1").css("border", "0.5px solid #dcdcdc");
				$("#pass_email2").css("border", "0.5px solid #dcdcdc");
				
				warningCheck('ok', $(".emailPass"), "사용 가능한 이메일입니다.");
				
				if($("#pass_name_check").val() == ""){	
					$("#accredit_send_pass").attr("disabled", true);		
					warningCheck(true, $("#passInput"), "이름을 입력해주세요");		
				}else{
					warningCheck(false, $("#passInput"), "");
					$("#accredit_send_pass").attr("disabled", false);				
				}
			}
			
			return true;
		}
		
		$("#accredit_send_pass").click(function(){	
			let email = $("#pass_email1").val() + "@" + $("#pass_email2").val();
				if($("#pass_email1").val() != "" && $("#pass_email2").val() != "" ){
					if($("#name_check_pass").val() != ""){
						$("#accredit_send_pass").attr("disabled", false);
						warningCheck(false, $("#passInput"), "");
						warningCheck(false, $(".emailPass"), "");
						$.ajax({
							type : "post",
							url : "emailCheckPass.do",
							data : {
								email : email,
								name : $("#name_check_pass").val(),
								mid : $(".idCheckPass").val()
							},
							success : function(result){
								if(result != 0){
									//이름과 이메일이 일치하면 이메일 인증 요청을 보내도록 함
									warningCheck('ok', $("#pass_codeSet"), "인증메일이 전송되었습니다!");
									emailCode(email, "pass");
								}else{
									//이름과 이메일이 존재하지 않으면 반환
									warningCheck(true, $(".emailPass"), "존재하지 않는 계정입니다");
								}
							}//success
						});//ajax
					}else{
						warningCheck(true, $("#passInput"), "이름을 입력해주세요");
					}
				}else{
					$("#accredit_send_pass").attr("disabled", true);
				}
			
		});//button-event	
		
		
		
		
		/********************************** login_pw.jsp ******************************************/

		$("#alterPass1").keyup(function(){
			let password = $(this).val();
			if(passRule.test(password)){
				warningCheck(false, $(".alterPassCheck"), "");
				if($("#alterPass1").val() != "" && $("#alterPass2").val() != ""){
					if($("#alterPass1").val() != $("#alterPass2").val()){
						warningCheck(true, $(".alterPassInput"), "비밀번호가 일치하지 않습니다.");
					}else{
						warningCheck('ok', $(".alterPassInput"), "비밀번호가 일치합니다.");
					}
				}
			}else{
				warningCheck(true, $(".alterPassCheck"), "10~14자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.");
			}
		});
		$("#alterPass2").keyup(function(){
			if($("#alterPass1").val() != "" && $("#alterPass2").val() != ""){
				if($("#alterPass1").val() != $("#alterPass2").val()){
					warningCheck(true, $(".alterPassInput"), "비밀번호가 일치하지 않습니다.");
				}else{
					warningCheck('ok', $(".alterPassInput"), "비밀번호가 일치합니다.");
				}
			}
		});
		
		$("#password_alterBtn").click(function(){
			let password = $("#alterPass1").val();
			if(passRule.test(password)){
				warningCheck(false, $(".alterPassCheck"), "");
				if($("#alterPass1").val() != "" && $("#alterPass2").val() != ""){
					if($("#alterPass1").val() != $("#alterPass2").val()){
						warningCheck(true, $(".alterPassInput"), "비밀번호가 일치하지 않습니다.");
						return false;
					}else{
						passwordAlterForm.submit();
					}
				}
			}else{
				warningCheck(true, $(".alterPassCheck"), "10~14자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.");
				return false;
			}
		});
	});