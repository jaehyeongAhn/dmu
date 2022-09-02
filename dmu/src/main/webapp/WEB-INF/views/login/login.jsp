<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM</title>
<style>
	@font-face {
		font-family: 'Geogrotesque';
		src: local('Geogrotesque Light'),
			local('/dmu/resources/font/Geogrotesque-Light'),
			url('/dmu/resources/font/GeogrotesqueCyr-Light.woff2')
			format('woff2'),
			url('/dmu/resources/font/GeogrotesqueCyr-Light.woff') format('woff'),
			url('/dmu/resources/font/GeogrotesqueCyr-Light.ttf')
			format('truetype');
		font-weight: 300;
		font-style: normal;
	}
	
	* {
		font-family: "Geogrotesque";
	}
	
	div.container h2 {
		font-size: 3rem !important;
		text-align: center;
		line-height: 3.2rem;
		letter-spacing: -0.08em;
		font-weight : 500;
	}
	
	form[name='loginForm'] {
		text-align: center;
		padding: 0;
		display: flex;
		justify-content: center;
	}
	
	.loginList {
		list-style-type: none;
		margin: 0;
		padding: 0;
		width: 408px;
	}
	
	div#idInput, div#passInput {
		border: 0.5px solid #dcdcdc;
		width: 402.67px;
		height: 60px;
	}
	
	div#passInput {
		margin-top: 20px;
	}
	
	div#idInput input::placeholder, div#passInput input::placeholder {
		color : #999999;
	}
	
	div#idInput>input, div#passInput>input {
		border: none;
		width: 100%;
		height: 100%;
		padding: 16px;
		font-size: 15px;
		letter-spacing: -0.03rem;
		height: 100%;
		box-sizing: border-box;
	}
	div#idSetup {
		display : flex;
		justify-content : space-between;
		margin-top : 20px;
		align-items : center;
	}
	/* 체크박스 커스텀 */
	input#id_save {
		display : none;
	}
	input#id_save + label::before {
		content : "";
	    border: 0.5px solid #dcdcdc;
	    width: 24px;
	    height: 24px;
	    cursor: pointer;
	    display: inline-block;
	    vertical-align: middle;
	    margin-right : 5px;
	}
	input#id_save:checked + label::before{
		content: "✓";
	    background: black;
	    width: 24px;
	    height: 24px;
	    color : white;
	    text-align: center;
	    vertical-align: middle;
	}
	label[for = "id_save"], div#id_save > div > a{
		align-items: center;
	    height: inherit;
	    display: flex;
	    vertical-align: middle;
	}
	
	div#idSetup div:nth-child(2) a{
		text-decoration : none;
		color : gray;
	}
	div#idSetup div:nth-child(2) a:first-child::after {
		content : "|";
		color : lightgray;
		padding-left : 5px;
	}
	
	/****************** 로그인 버튼 *********************/
	div#loginBtn, div#joinBtn {
		margin-top : 20px;
	}
	div#joinBtn a {
		width : 100%;
		height : 60px;
	}
	div#loginBtn button, div#joinBtn button {
		color : white;
		width : 100%;
		height : 60px;
		font-size : 16px;
		letter-spacing : -0.12rem;
		font-weight : 400;
	}
	div#loginBtn button {
		color : white;
		background : black;
		border : 0.5px solid black;
	}
	div#joinBtn button {
		color : black;
		background : white;
		border : 0.5px solid black;
	}
	div#loginBtn button:hover {
		background : white;
		color : black;
		cursor : pointer;
	}
	div#joinBtn button:hover {
		background : #888888;
		border : 0.5px solid #888888;
		color : white;
		cursor : pointer;
	}
	/******** 전체 페이지 *********/
	main.login div.section{
		min-width : 1200px;
	}
</style>
</head>
<body>
	<main class = "login">
		<div class = "section">
			<div class = "container">
				<h2>로그인</h2>			
			</div>
			<form name = "loginForm" action = "#" method = "post">
				<ul class = "loginList">
					<li>
						<div id = "idInput">
							<input type = "text" name = "id" placeholder = "아이디를 입력해 주세요." maxlength = "20">								
						</div>
					</li>
					<li>
						<div id = "passInput">
							<input type = "password" name = "pass" placeholder = "비밀번호를 입력해 주세요." maxlength = "14">
						</div>
					</li>
					<li>
						<div id = "idSetup">
							<div>
								<input type = "checkbox" id = "id_save"><label for = "id_save">아이디 저장</label>
							</div>
							<div>
								<a href = "#">아이디 찾기</a>
								<a href = "#">비밀번호 찾기</a>
							</div>
						</div>
					</li>
					<li>
						<div id = "loginBtn">
							<button type = "button">로그인</button>				
						</div>
						<div id = "joinBtn">
							<a href = "http://localhost:9000/dmu/join.do"><button type = "button">회원이&nbsp;아니신가요?&nbsp;가입하기</button></a>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</main>
	
</body>
</html>