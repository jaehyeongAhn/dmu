<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<link rel="icon" href="/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/ticket.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet" href="http://localhost:9000/dmu/resources/css/join.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/ticket.js"></script>
<title>TICKET | D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<style>
	img{
		tesxt-aline:center;
	}
</style>
</head>
<body>
	<iframe src="http://localhost:9000/dmu/header.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
		
	<main style="height:480px">
		 <form name="ticketDeleteForm" action="admin_ticket_delete_check.do" method="post">
		 	<input type="hidden" name="did" value="${did}">
				<div data-v-ec5a0c2c="" class="root-container">
					<div data-v-ec5a0c2c="" class="content-wrapper">
						<div data-v-ec5a0c2c="" class="body-wrapper">
							<div data-v-25f87e60="" data-v-ec5a0c2c="">
								<div data-v-25f87e60="" class="sub-contents-area">
									<div data-v-6d324aa0="" data-v-7b1f57c8="" class="step-process-area">
										<ul data-v-6d324aa0="">
											<li data-v-6d324aa0="" class="complete">
												<span data-v-6d324aa0="" class="no">01</span>
												<span data-v-6d324aa0="" class="txt">ticket</span>
											</li>
											<li data-v-6d324aa0="" class="on">
												<span data-v-6d324aa0="" class="no">02</span>
												<span data-v-6d324aa0="" class="txt">ticket content</span>
											</li>
											<li data-v-6d324aa0="" class="">
											<span data-v-6d324aa0="" class="no">03</span>
											<span data-v-6d324aa0="" class="txt">수정/삭제</span>
											</li>
										</ul>
									</div>
						<div class = "section">
								<div class = "joinContainer">
									<div class = "content">
										<div class = "container">
											<img id="deleteimg" src = "http://localhost:9000/dmu/resources/images/join_ok.png">
										<h3>버튼을 누르면 삭제가 완료됩니다.</h3>
												<div data-v-8ed31374="" class="use-info-ticket">
													<div data-v-26e42198="" data-v-8ed31374="" class="btn-area">
														<p>
															<br>
														</p>
														<p>
															<br>
														</p>
														<button data-v-26e42198="" type="submit" class="secondary small">삭제완료</button>
														<a href="adminexhibition_list.do"><button data-v-26e42198=""  type="button" class="secondary small">리스트</button></a>
													</div>
												</div>
											</div>
											
												</div>
												</div>
											</div>
											
										
											</div>
											<!---->
										</div>
										<!---->
										<!---->
									</div>
								</div>
				
				 </form>
			</main>
			
			
		
	


	
	<iframe src="footer.do" width="100%" height="550px" scrolling="no" frameborder=0></iframe>

</body>
</html>