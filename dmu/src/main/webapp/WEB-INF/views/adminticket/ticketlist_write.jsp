<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exhibition 정보 입력</title>
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/write.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>

</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:9000/dmu/header.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>ticket 정보 입력</h1>
		<form name="ticketlistform" action="ticketlist_write_check.do" method="post" enctype="multipart/form-data" >
			<ul>
				
				<li>
					<label>제목(공통)</label>
					<input type="text" name="dtitle" id="dtitle">
				</li>
				<li>
					<label>코드(공통)</label> <!-- learn exhibition event 3개입력해서 분류하는기준 -->
					<input type="text" name="dcode" id="dcode">
				</li>
				<li>
					<label>시작일(공통)</label>
					<input type="text" name="dstart" id="dstart">
					<label>종료일(공통)</label>
					<input type="text" name="dend" id="dend">
				</li>
				<li>
					<label>이용요금(공통)</label>
					<input type="text" name="dprice" id="dprice">
					<label>장소(공통)</label>
					<input type="text" name="dplace" id="dplace">
					<label>정원(0이라도입력)</label>
					<input type="text" name="dpersonnel" id="dpersonnel">
				</li>
				<li>
					<label>대상(교육,이벤트)</label>
					<input type="text" name="dtarget" id="dtarget">
					<label>교육횟수(0이라도입력)</label>
					<input type="text" name="dnum" id="dnum">
				</li>
				 
				<li>
					<label>이용정보(전시,교육)</label>
					<textarea name=dinformation id="dinformation" ></textarea>
				</li>
				<li>
					<label>운영시간,교육시간(공통)</label>
					<textarea name="dtime" id="dtime" ></textarea>
				</li>
				<li>
					<label>이미지(공통)</label>
					<input type="file" name="file1">
				</li>
				<li>
					<button type="button" class="btn_style" id="btn_exhibition_Write">등록완료</button>
					<a href="ticketlist_write.do"><button type="reset" class="btn_style">다시쓰기</button></a>
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/dmu/footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>