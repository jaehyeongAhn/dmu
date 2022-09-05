<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exhibition 정보 입력</title>
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/event_write.css">
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
		<h1>Exhibition 정보 입력</h1>
		<form name="boardWriteForm" action="exhibition_write_check.do" method="post"  >
			<ul>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
				</li>
				<li>
					<label>전시회 이름</label>
					<input type="text" name="dexhibtion" id="dexhibtion">
				</li>
				<li>
					<label>장소</label>
					<input type="text" name="dplace" id="dplace">
				</li>
				<li>
					<label>전시기간 시작일</label>
					<input type="text" name="dstart" id="dstart">
				</li>
				<li>
					<label>전시기간 종료일</label>
					<input type="text" name="dend" id="dend">
				</li>
				<li>
					<label>이용요금</label>
					<textarea name="dprice" id="dprice" ></textarea>
				</li>
				<li>
					<label>운영시간</label>
					<textarea name="dtime" id="dtime" ></textarea>
				</li>
				<li>
					<label>이용정보</label>
					<textarea name=dinformation id="dinformation" ></textarea>
				</li>
				<li>
					<button type="button" class="btn_style" id="btn_exhibition_Write">등록완료</button>
					<a href="exhibition_write.do"><button type="reset" class="btn_style">다시쓰기</button></a>
					  
					 
				</li>
			</ul>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:9000/dmu/footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







