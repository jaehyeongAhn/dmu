<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장M</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/join.js"></script>
<script>
	$(document).ready(function(){
		let height = $(document).height();
		$(".footer").css("top", height - 100);
		$(".backHome").click(function(){
			$(location).attr("href", "index.do");
		});
	}); 
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 class = "header"></iframe>

	<main class = "join">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "container">
					<h3>회원가입</h3>
				</div>
				<form name = "join_termsForm" action = "join_terms_ok.do" method = "post">
					<fieldset>
						<legend>약관동의</legend>
						<div class = "checkList" id = "all_checkList">
							<input type = "checkbox" id = "all_check"><label for = "all_check">모든 약관에 동의</label>						
						</div>
						<div class = "termsList">
							<div class = "checkList">
								<input type = "checkbox" id = "older" name = "older" class = "terms" value = "y">
								<label for = "older">[필수]&nbsp;&nbsp;만&nbsp;&nbsp;14세&nbsp;&nbsp;이상&nbsp;&nbsp;입니다.</label>
							</div>
							<div class = "checkList">
								<input type = "checkbox" id = "terms" name = "terms" class = "terms" value = "y">
								<label for = "terms">[필수]&nbsp;&nbsp;이용약관&nbsp;&nbsp;동의</label>	
								<!-- <span id = "consent_detail">[전문보기]</span>	 -->					
							</div>
							<div class = "checkList">
								<input type = "checkbox" id = "consent" name = "consent" class = "terms" value = "y">
								<label for = "consent">[필수]&nbsp;&nbsp;개인정보&nbsp;&nbsp;수집&nbsp;&nbsp;및&nbsp;&nbsp;이용에&nbsp;&nbsp;대한&nbsp;&nbsp;동의</label>														
								<!-- <span id = "unregister_detail">[전문보기]</span> -->						
							</div>
						</div>
						<div class = "nextJoin">
							<button type = "button" class = "backHome">홈으로</button>
							<button type = "button" id = "nextJoinPage" disabled>다음</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="510px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>