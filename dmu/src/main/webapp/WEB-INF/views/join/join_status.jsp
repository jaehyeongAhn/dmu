<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장M</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/join.js"></script>
<script>
</script>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no" frameborder=0></iframe>

	<main class = "join" style="height:450px;">
		<div class = "section">
			<div class = "joinContainer">
				<div class = "container">
					<h3>회원가입</h3>
				</div>
				<form name = "join_statusForm" action = "join_status_ok.do" method = "post">
					<fieldset style="border:none;">
						<div class = "statusList">
							<div class = "checkList">
								<button type = "submit" name = "status" class = "public" value = "public">
									<div><img src="http://localhost:9000/dmu/resources/images/public.svg"></div>
									<span>일반 가입</span>
								</button>
							</div>
							<div class = "checkList">
								<button type = "submit" name = "status" class = "accept" value = "accept">
									<img src="http://localhost:9000/dmu/resources/images/admin.svg">
									<span>관리자 가입</span>
								</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</main>
	
	<iframe src="footer.do" width="100%" height="490px" scrolling="no" frameborder=0 class = "footer"></iframe>
</body>
</html>