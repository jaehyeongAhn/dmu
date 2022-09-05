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

		//index.do 페이지로 돌아감
		$(".backHome").click(function(){
			$(location).attr("href", "index.do");
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
				
				obj.next().children(".join_warning").css("width", "20px").css("height", "20px").css("margin-right", "10px");
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
		
		
		
		//이메일 유효성 체크
		function emailCheck(){
			//email validation check
			let emailRule = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			let email = $("#email1").val()+"@"+$("#email2").val();
			if(!emailRule.test(email)){
				$("#email1").css("border", "0.5px solid red");
				$("#email2").css("border", "0.5px solid red");
				
				warningCheck(true, $(".emailTable"), "유효하지 않은 이메일 형식입니다.");
				return false;
			}else{
				$("#email1").css("border", "0.5px solid #dcdcdc");
				$("#email2").css("border", "0.5px solid #dcdcdc");
				
				warningCheck('ok', $(".emailTable"), "사용 가능한 이메일입니다.");
				$("#email").val(email);
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
				//$("#email2").val("");
				$("#email2").attr("readonly", true);
				$("#email2").val($(this).val());
				emailCheck();
			}
		});
		
		
		$("#email2").keyup(function(){
			emailCheck();
		});


		/********* id check *********/
		let idRule = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){6,12}$/;
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
		
		$("#did").keyup(function(){
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
					url : "join_idCheck.do?did="+$("#did").val(),
					success : function(result){
						if(result == 0){
							warningCheck("ok", $(".idTable"), "사용 가능한 아이디입니다.");
						}else if(result == 1){
							warningCheck(true, $(".idTable"), "사용 중인 아이디입니다.");
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
		
		/********* validation check *********/

		$("#joinOk").click(function() {
			if($("#did").val() == ""){
				warningCheck(true, $(".idTable"), "아이디를 입력해 주세요.");
				$("#did").focus();
				return false;
			}else if(!idRule.test($("#did").val())){
				warningCheck(true, $(".idTable"), "6~12자의 영문 혹은 영문과 숫자를 조합하여 입력해 주세요.");
				$("#did").focus();
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
			}else if($("#email1").val() == ""){
				popup_setup("이메일을 입력해 주세요.", $("#email1"));
				return false;
			}else if($("#email2").val() == ""){
				popup_setup("이메일을 입력해 주세요.", $("#email2"));
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
			}else{
				joinFrom.submit();
			}

		});
		
		
		
	/********************************* login.do ************************************/
	
		
	//login check
	$("#loginOk").click(function(){
		if($("#login_id").val() == ""){
			warningCheck(true, $("#idInput"), "아이디를 입력해주세요.");
			$("#login_id").css("border", "0.5px solid #D92121");
			
			$("#login_pass").css("border", "0.5px solid #dcdcdc");
			warningCheck(false, $("#passInput"), "");
			
		}else if($("#login_pass").val() == ""){
		
			$("#login_id").css("border", "0.5px solid #dcdcdc");
			warningCheck(false, $("#idInput"), "");
			
			$("#login_pass").css("border", "0.5px solid #D92121");
			warningCheck(true, $("#passInput"), "비밀번호를 입력해주세요.");
		}else{
			warningCheck(false, $("#passInput"), "");
			loginForm.submit();
		}
	});
	
	
	/********************************** join_ok.do *********************************/
	$("#loginGo").click(function(){
		$(location).attr("href", "http://localhost:9000/dmu/login.do");
	});
});