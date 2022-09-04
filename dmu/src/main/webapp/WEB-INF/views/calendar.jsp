<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- 만일 현재 날짜의 스타일을 취소하고 싶다면 jquery-ui.css의 984~990번째 줄의 주석을 해제할 것 --%>
	
	<%--  jQuery UI CSS파일  --%>
  	<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> --%>
  	<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/jquery-ui.css">
	
	<%-- jQuery 기본 js파일 --%>
 	 <script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
	
	<%-- jQuery UI 라이브러리 js파일 --%>
  	<%-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> --%>
  	<script src="http://localhost:9000/dmu/resources/js/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			// Getter
			var dayNamesShort = $( "#calendar" ).datepicker( "option", "dayNamesShort" );
			
			$("#calendar").datepicker({
				//datepicker 초기 설정
				dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
				dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
				monthNames : [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				minDate : 0,
				maxDate : "${ date_count }",
				showMonthAfterYear : false,
				//datepicker의 DOM이 업데이트 될 때 호출 (오늘 날짜 자동으로 받아 저장)
				onUpdateDatepicker : function(){
					var date = $.datepicker.formatDate("yy-mm-dd", $("#calendar").datepicker("getDate"));
					$("#date").val(date);
				},
				//datepicker의 날짜가 변경될 때마다 이벤트 발생 (선택 날짜 받아 저장)
				onSelect : function(){
					var date = $.datepicker.formatDate("yy-mm-dd", $("#calendar").datepicker("getDate"));
					$("#date").val(date);
					//alert(date);
				}
			});
			 
			// Setter
			$( "#calendar" ).datepicker( "option", "dayNamesShort", [ "Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam" ] );
			
		});
	</script>
	<style>
		@font-face {
		    font-family: 'Geogrotesque';
		    src: local('Geogrotesque Light'), local('/test/resources/font/Geogrotesque-Light'),
		        url('/dmu/resources/font/GeogrotesqueCyr-Light.woff2') format('woff2'),
		        url('/dmu/resources/font/GeogrotesqueCyr-Light.woff') format('woff'),
		        url('/dmu/resources/font/GeogrotesqueCyr-Light.ttf') format('truetype');
		    font-weight: 300;
		    font-style: normal;
	 	}
	 	* {
	 		font-family : "Geogrotesque";
	 	}

	</style>
</head>
<body>
	<form name = "calendarTest" action = "calendarTestCheck.do" method = "post">
	<!-- 	<p>관람일</p> -->
		<div id = "calendar"></div>
		<input type = "hidden" name = "date" id = "date">
		<!-- <button type = "submit">(TEST)날짜 전송</button> -->
	</form>
</body>
</html>