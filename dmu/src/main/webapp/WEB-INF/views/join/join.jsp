<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/join.js"></script>
<script>
	$(document).ready(function(){
		/*let height = $(document).height();
		$(".footer").css("top", height);*/
		
		$("#cancle").click(function(){
			$(location).attr("href", "index.do");
		});
	}); 
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>
	<div>
	<main class = "join" style="height: 1600px;">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "container">
					<h3>회원가입</h3>
				</div>
				<div class="join_style">
					<form name="joinFrom" action="joinController.do" method="post">
						<input type = "hidden" name = "status" value = "${ vo.status }">
						<input type = "hidden" name = "older" value = "${ vo.older }">
						<input type = "hidden" name = "terms" value = "${ vo.terms }">
						<input type = "hidden" name = "consent" value = "${ vo.consent }">
						<fieldset class = "loginInformation">
							<legend>로그인&nbsp;&nbsp;정보</legend>
							<span class = "checkpoint">표시는 필수 입력 항목입니다.</span>
							<div class = "loginDetail">
								<ul>
									<li>
										<label class = "checkpoint">아이디</label> 
										<div class = "idTable">
											<div style = "margin : 0;">
												<input type="text" name="mid" id = "did" placeholder = "아이디를 입력해주세요" maxlength = "12">
											</div>
											<button type = "button" id = "idCheck" disabled>중복체크</button>
										</div>
									</li>
									<li>
										<label class = "checkpoint">비밀번호</label>
										<div class = "passTable">
											<input type="password" name="pass" id = "pass" placeholder = "비밀번호를 입력해주세요" maxlength = "14">
										</div> 
									</li>
									<li>
										<label class = "checkpoint">비밀번호 확인</label> 
										<div class = "passCheckTable">
											<input type="password" id = "passcheck" placeholder = "비밀번호를 재입력해주세요" maxlength = "14">									
										</div>
									</li>
								</ul>
							</div>
						</fieldset>
						<fieldset class = "individualInformation">
							<legend>개인정보</legend>
							<span class = "checkpoint">표시는 필수 입력 항목입니다.</span>
							<div class = "joinDetail">
								<ul>
									<li>
										<label>회원&nbsp;유형</label> 
										<div class = "customerTable">
											<input type="radio" name="nationality" id = "local" checked = "checked" value = "local">
											<label for = "local">내국인</label>
											<input type="radio" name="nationality" id = "foreign" value = "foreign">
											<label for = "foreign">외국인</label>
										</div>
									</li>
									<li>
										<label class = "checkpoint">이름</label> 
										<div class = "nameTable">
											<input type="text" name="mname" id= "dname" placeholder = "이름을 입력해주세요">
										</div>
									</li>
									<li>
										<label class = "checkpoint">성별</label>
										<div class = "genderTable">
											<input type="radio" name = "gender" id = "m" checked="checked" value = "m">
											<label for = "m">남자</label>
											<input type="radio" name = "gender" id = "f" value = "f">
											<label for = "f">여자</label>
										</div>
									</li>
									<li>
										<label class = "checkpoint">이메일</label>
										<div class = "emailTable">
											<input type = "text" name = "email1" id = "email1" placeholder = "이메일"><span>@</span>
											<input type = "text" name = "email2" id="email2">
											<select name = "email3" id = "email3">
												<option value = "default">직접입력</option>
												<option value = "gmail.com">gmail.com</option>
												<option value = "naver.com">naver.com</option>
												<option value = "hanmail.net">hanmail.net</option>
												<option value = "nate.com">nate.com</option>			
											</select>
											<!-- <input type = "hidden" name = "email" id = "email"> -->
										</div>
									</li>
									<li>
										<label class = "checkpoint">생년월일</label>
										<div class = "birthTable">
											<select name = "year" id = "year">
												<option value = "default">선택
												<c:forEach var = "year_data" begin = "1901" end = "2008">
													<option value = "${ year_data }">${ year_data }</option>
												</c:forEach>
											</select>
											<select name = "month" id = "month">
												<option value = "default">선택
												<c:forEach var = "month_data" begin = "1" end = "12">
													<option value = "${ month_data }">${ month_data }</option>
												</c:forEach>
											</select>
											<select name = "day" id = "day">
												<option value = "default">선택
												<c:forEach var = "day_data" begin = "1" end = "31">
													<option value = "${ day_data }">${ day_data }</option>
												</c:forEach>
											</select>
										</div>
									</li>
									<li>
										<label class = "checkpoint">휴대폰 번호</label>
										<div class = "phoneTable">
											<select name = "pnum1" id = "pnum1">
												<option value = "010">010</option>
												<option value = "011">011</option>
												<option value = "016">016</option>
												<option value = "017">017</option>
												<option value = "018">018</option>
												<option value = "019">019</option>
											</select>-
											<input type = "text" name = "pnum2" id = "pnum2" maxlength = "4" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">-
											<input type = "text" name = "pnum3" id = "pnum3" maxlength = "4" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
										</div>
										
									</li>
									<li>
										<label class = "checkpoint">주소</label>
										<div class = "addrTable">									
											<input type = "text" name = "zonecode" id = "zonecode" placeholder = "우편번호">
											<div class = "addrSimple">
												<input type = "text" name = "addr1" id = "addr1">
												<button type = "button" id = "addressCheck">주소 찾기</button>
											</div>
										</div>
										<input type = "text" name = "addr2" id = "addr2" placeholder = "상세 주소 입력">
									</li>
								</ul>
							</div>
							<div class = "checkBtnList">
								<button type="button" id = "cancle">취소</button>
								<button type="button" id = "joinOk">가입하기</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</main>
	</div>
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer"></iframe>
	
	<div class = "background_join">
		<div class = "window_join">
			<div class = "popup_join">
				<p id = "popup_joinGuide"></p>
				<button type = "button" id = "popup_joinOk" style = "cursor:pointer;">확인</button>
			</div>
		</div>
	</div>
</body>
</html>