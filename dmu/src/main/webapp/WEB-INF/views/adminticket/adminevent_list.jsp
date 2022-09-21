<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dmu</title>
<link rel="stylesheet"  href="http://localhost:9000/dmu/resources/css/tiket.css">
<link rel="stylesheet"  href="http://localhost:9000/mycgv/resources/css/am-pagination.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
</head>
<body>
	<iframe src="header.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	<main>
		<div data-v-ec5a0c2c="" class="root-container">
			<div data-v-ec5a0c2c="" class="content-wrapper">
				<div data-v-ec5a0c2c="" class="body-wrapper">
					<div data-v-7b1f57c8="" data-v-ec5a0c2c="">
						<div data-v-7b1f57c8="" class="sub-contents-area">
							<div data-v-6d324aa0="" data-v-7b1f57c8=""
								class="step-process-area">
								<ul data-v-6d324aa0="">
											<li data-v-6d324aa0="" class="complete"><span
												data-v-6d324aa0="" class="no">01</span><span
												data-v-6d324aa0="" class="txt">ticket</span></li>
											<li data-v-6d324aa0="" class="on"><span
												data-v-6d324aa0="" class="no">02</span><span
												data-v-6d324aa0="" class="txt">ticket content</span></li>
											<li data-v-6d324aa0="" class=""><span data-v-6d324aa0=""
												class="no">03</span><span data-v-6d324aa0="" class="txt">수정/삭제
													</span></li>
										</ul>
							</div>
							<div data-v-7b1f57c8="" class="container">
								<div data-v-7b1f57c8="" class="ticket-list-area">
									<div data-v-7b1f57c8="">
										<div data-v-7b1f57c8="" class="snb-area">
											<ul data-v-7b1f57c8="" class="snb">
												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminexhibition_list.do" role="button">EXHIBITION </a></li>
												<li data-v-7b1f57c8="" class=""><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminlearn_list.do" role="button">LEARN </a></li>
												<li data-v-7b1f57c8="" class="on"><a data-v-7b1f57c8=""
													href="http://localhost:9000/dmu/adminevent_list.do" role="button">EVENT </a></li>
											</ul>
										</div>
										<div data-v-7b1f57c8="" class="sub-contents-area">
											<div data-v-1e8092ec="" data-v-7b1f57c8="" class="container">
												<div data-v-1e8092ec="" class="list-top-area">
													<span data-v-1e8092ec="" class="total">총 <strong>3</strong>건
													</span>
													<ul data-v-1e8092ec="" class="order">
														<li data-v-3c1f59cb="" class="">
															<a data-v-3c1f59cb="" href="ticketlist_write.do">
															<button type="button" class="btn_style">글쓰기</button>
															</a>			
														</li>
														<li data-v-1e8092ec="" class="on"><a
															data-v-1e8092ec="" href="javascript:void(0);">시작일 순</a></li>
														<li data-v-1e8092ec="" class=""><a data-v-1e8092ec=""
															href="javascript:void(0);">종료일 순</a></li>
													</ul>
												</div>
												<c:forEach var="vo" items="${list}">
												<c:if test="${vo.dcode eq'event'}">
												<div data-v-1e8092ec="" class="ticket-list event">
													<ul data-v-1e8092ec="">
														<li data-v-1e8092ec="">
														
															<c:if test="${vo.dsfile != null }">
														<a data-v-1e8092ec=""
															href="http://localhost:9000/dmu/ticketlist_content.do?did=${vo.did}" class="thumb">
															<img
																data-v-2fed1a9a="" data-v-1e8092ec=""
																src="http://localhost:9000/dmu/resources/upload/${vo.dsfile }"></a>
															</c:if>
																<a
															data-v-1e8092ec="" href="http://localhost:9000/dmu/ticketlist_content.do?did=${vo.did}"
															class="title"> ${vo.dtitle } </a>
														<ul data-v-1e8092ec="" class="info">
																<li data-v-1e8092ec=""><span data-v-1e8092ec=""
																	class="tit">기간</span>
																<p data-v-1e8092ec="" class="date">${vo.dstart } ~
																		${vo.dend }</p></li>
																<li data-v-1e8092ec=""><span data-v-1e8092ec=""
																	class="tit">장소</span><span data-v-1e8092ec=""
																	class="txt">${vo.dplace }</span></li>
																<li data-v-1e8092ec=""><span data-v-1e8092ec=""
																	class="tit">참가비</span><span data-v-1e8092ec=""
																	class="txt">${vo.dprice } 원</span></li>
																<li data-v-1e8092ec=""><span data-v-1e8092ec=""
																	class="tit">대상</span><span data-v-1e8092ec=""
																	class="txt">${vo.dtarget }</span></li>
															</ul></li>
															
														
													</ul>
												</div>
												</c:if>
												</c:forEach>
												<!---->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<iframe src="footer.do" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
</body>
</html>