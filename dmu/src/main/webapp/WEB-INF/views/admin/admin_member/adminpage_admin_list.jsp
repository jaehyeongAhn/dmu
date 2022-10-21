<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D MUSEUM | DAELIM MUSEUM | 구슬모아당구장</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/font.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/mypage.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/am-pagination_dmu.css">
<link rel="stylesheet"
	href="http://localhost:9000/dmu/resources/css/adminpage.css">
<script src="http://localhost:9000/dmu/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/dmu/resources/js/admin_member.js"></script>
<script src="http://localhost:9000/dmu/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/dmu/resources/js/main_header.js"></script>
<script>
	$(document).ready(
			function() {

				let dbCount = '${dbCount}'
				let rpage = '${rpage}'
				let pageSize = '${pageSize}'

				//페이징 리스트 출력
				function paging(dbCount, rpage, pageSize) {
					var pager = jQuery('#ampaginationsm').pagination({

						maxSize : 7, // max page size
						totals : dbCount, // total rows	
						page : rpage, // initial page		
						pageSize : pageSize, // max number items per page

						// custom labels		
						lastText : '&raquo;&raquo;',
						firstText : '&laquo;&laquo;',
						prevText : '&laquo;',
						nextText : '&raquo;',

						btnSize : 'sm' // 'sm'  or 'lg'		
					});
				}

				paging(dbCount, rpage, pageSize);

				//페이징 번호 클릭 시 이벤트 처리
				jQuery('#ampaginationsm').on(
						'am.pagination.change',
						function(e) {
							jQuery('.showlabelsm').text(
									'The selected page no: ' + e.page);
							$(location).attr(
									'href',
									"http://localhost:9000/dmu/adminpage_admin_list.do?rpage="
											+ e.page);
						});

				/* //popup
				function admin_popup(){
					$(".member_detail").click(function(){
						$(".background_member").addClass("show");
						$(".window_member").addClass("show");
						$(".popup_close").click(function(){
							$(".background_member").removeClass("show");
							$(".window_member").removeClass("show");
						});
					});
				}
				
				admin_popup();
				
				$(".accept").click(function(){
					$(".background_accept").addClass("show_accept");
					$(".window_accept").addClass("show_accept");
					$("#popup_acceptNo").click(function(){
						$(".background_accept").removeClass("show_accept");
						$(".window_accept").removeClass("show_accept");
					});
				});
				
				
				$("#popup_acceptOk").click(function(){
					$(".background_ok").addClass("show");
					$(".window_ok").addClass("show");
					$("#popup_close").click(function(){
						$(".background_ok").removeClass("show");
						$(".window_ok").removeClass("show");
					});
				});
				
				
				//검색기능
				
				$(".search-btn").click(function(){
					admin_search_admin(1);
				});
				
				
				$(".search-bar").keyup(function(e){
					if(e.keyCode == 13){
						admin_search_admin(1);
					}
				});
				
				function admin_search_admin(rpage){
				    $(".search-bar").val($(".search-bar").val().trim());
				    let keyword = $(".search-bar").val().trim();
				    $.ajax({
				        
				        url : 'admin_search_admin_json.do',
				        type: 'get',
				        cache : false,
				        headers : {"cache-control":"no-cache", "pragma": "no-cache"},
				        data : {"keyword" : keyword, "rpage": rpage},
				        success : function(data){
				            let dataset = JSON.parse(data);
				            
				           	var output ="<table class='info-table'><thead><tr>";
				            output +="<th>아이디</th>";
				            output +="<th>회원명</th>";
				            output +="<th>전화번호</th>";
				            output +="<th>이메일</th>";
				            output +="<th>가입일자</th>";
				            output +="<th>상태</th>";
				            output +="<th>자세히보기</th>";
				            output +="<th>관리자승인</th>";
				            output +="</tr></thead>";
				            
				            for(obj of dataset.list){
				                output += "<tbody><tr>";
				                output += "<td class='memberId'>" + obj.mid + "</td>";
				                output += "<td>" + obj.mname + "</td>";
				                output += "<td>" + obj.pnumber + "</td>";
				                output += "<td>" + obj.email + "</td>";
				                output += "<td>" + obj.ddate + "</td>";
				                if(obj.unregister == 'n'){
				                    output += "<td>탈퇴</td>"
				                }else{
				                    output +="<td>가입완료</td>"
				                }
				                output += "<td><button class='member_detail admin'><a href='#'>자세히보기</a></button></td>"
				                if(obj.status == 'accept'){
				                	output +="<td><button class='accept'><a href='#'>관리자승인</a></button></td>"
				                }else{
				                	output +="<td>승인완료</td>"
				                }
				            }
				                output += "</tr></tbody></table>";	
				            
				            var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm' style='text-align:center;''> "
				            paging_list +="</div>"
				            
				            if(dataset.list.length !=0){
				                
				            $(".no-result").css("display","none");
				            	            
				            $(".info-table").remove();
				            $("#ampaginationsm").remove();
				            $(".info-list").append(output);
				            $(".info-list").after(paging_list);
				            $("div.search-result strong.total").text(dataset.dbCount);
				            
				            admin_popup();
				            paging(dataset.dbCount, dataset.rpage, dataset.pageSize);
				            
				            //페이징 번호 클릭 시 이벤트 처리
				            jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
				                   jQuery('.showlabelsm').text('The selected page no: '+e.page);
				                   //$(location).attr('href', "http://localhost:9000/dmu/adminpage_member_list.do?rpage="+e.page);
				                   admin_search_admin(e.page);
				                
				            });  
				            
				            }else{
				                $("div.search-result strong.total").text(dataset.dbCount);
				                $(".info-table").remove();
				                $(".no-result").css("display","block");
				            }
				        
				        },
				        error : function(data){
				            alert('error');
				        }
				        
				        
				    }); //ajax
				    

				}//function - admin_search_admin */

			});//ready
</script>
<style>
</style>
</head>
<body>
	<iframe src="header.do" width="100%" height="200px" scrolling="no"
		frameborder=0 class="header"
		style="position: absolute; overflow: hidden;"></iframe>
	<div style="width: 100%; height: 17vh; color: transparent">헤더</div>
	<!-- 사이드 메뉴 -->
	<div class="main">
		<div class="section">
			<div class="container">
				<aside class="mypage">
					<div class="mypage-list">
						<a href="adminpage_main.do" class="mypage-main"> <strong
							class="menu-title">ADMIN PAGE</strong>
						</a>
						<div class="mypage-menu-list">
							<ul>
								<li class="on"><a class="menu-title" href="#">ADMIN</a>
									<div class="sub-menu-list">
										<ul>
											<li class=""><a class="" href="adminpage_member_list.do">회원관리</a>
											</li>
											<c:if test="${sessionScope.member.mid == 'master'}">
												<li class=""><a class="" href="adminpage_admin_list.do"
													style="color: black; font-weight: 700;">관리자승인</a></li>
											</c:if>
											<li class=""><a class=""
												href="adminpage_reservation_list.do">예매관리</a></li>
											<li class=""><a class="" href="adminpage_inquiry_list.do">1대1 문의</a></li>
										</ul>
									</div></li>
								<li class="on"><a class="menu-title">CONTENT</a>
									<div class="sub-menu-list">
										<ul>
											<li class=""><a class="" href="adminexhibition_list.do"
												target="_blank">상품 리스트 작성</a></li>
											<li class=""><a class="" href="admin_notice_list.do"
												target="_blank">공지사항 작성</a></li>
										</ul>
									</div></li>
							</ul>
						</div>
					</div>
				</aside>

				<%-- 마이페이지 content --%>
				<div class="sub-contents">
					<div class="page-title">
						<h2>관리자승인</h2>
					</div>
					<div class="myinfo">
						<div class="myinfo-box">
							<div style="display: flex; justify-content: space-between;">
								<div data-v-1b9c8af9="" data-v-080a389a="" class="search-result">
									총 <strong class='total'>${dbCount}</strong>건
								</div>
								<div>
									<input type="text" name="search" placeholder="검색어를 입력하세요."
										class="search-bar-admin">
									<button class="search-btn-admin">검색</button>
								</div>
							</div>
							<div data-v-1b9c8af9="" data-v-080a389a="" class="no-result"
								style="display: none;">
								<p data-v-1b9c8af9="" data-v-080a389a="">작성된 공지사항이 없습니다.</p>
							</div>
							<div class="info-list">
								<table class="info-table">
									<thead>
										<tr>
											<th>아이디</th>
											<th>회원명</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>가입일자</th>
											<th>상태</th>
											<th>자세히보기</th>
											<th>관리자승인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${list}">
											<tr>
												<td class="memberId">${vo.mid}</td>
												<td>${vo.mname}</td>
												<td>${vo.pnumber}</td>
												<td>${vo.email}</td>
												<td>${vo.ddate}</td>
												<c:choose>
													<c:when test="${vo.unregister == 'n'}">
														<td>탈퇴</td>
													</c:when>
													<c:otherwise>
														<td>가입완료</td>
													</c:otherwise>
												</c:choose>
												<td><button class="member_detail admin">
														<a href="#">자세히보기</a>
													</button></td>
												<c:choose>
													<c:when test="${vo.status == 'accept'}">
														<td><button class="accept">
																<a href="#">관리자승인</a>
															</button></td>
													</c:when>
													<c:otherwise>
														<td>승인완료</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div data-v-650d6904="" data-v-1b9c8af9=""
								class="pagination-area" data-v-080a389a="" id="ampaginationsm"
								style="text-align: center;">
															<button data-v-650d6904="" type="button" disabled="disabled"
								class="btn-first">first</button>
							<button data-v-650d6904="" type="button" disabled="disabled"
								class="btn-prev">prev</button>
							<ul data-v-650d6904="">
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">1</a></li>
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">2</a></li>
								<li data-v-650d6904="" class="on"><a data-v-650d6904=""
									href="javascript:void(0);" role="button">3</a></li>
							</ul>
<!-- 							<button data-v-650d6904="" type="button" class="btn-next">
								next</button>
							<button data-v-650d6904="" type="button" class="btn-last">
								last</button>  -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="footer.do" width="100%" height="490px" scrolling="no"
		frameborder=0 class="footer" style="margin-bottom: -5px"></iframe>

	<div class="background_member">
		<div class="window_member">
			<div class="popup_member">
				<p class="popup_title">회원정보</p>
				<div class="popup_detail">
					<table class="popup_detail_table">
						<thead>
							<tr>
								<th>아이디</th>
								<td class="mid">${vo.mid}</td>
							</tr>
							<tr>
								<th>회원명</th>
								<td class="mname">${vo.mname}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td class="pnumber">${vo.pnumber}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td class="email">${vo.email}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td class="birth">${vo.birth}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td class="address">${vo.address}</td>
							</tr>
							<tr>
								<th>성별</th>
								<td class="gender">${vo.gender}</td>
							</tr>
							<tr>
								<th>회원유형</th>
								<td class="nationality">${vo.nationality}</td>
							</tr>
							<tr>
								<th>가입일자</th>
								<td class="ddate">${vo.ddate}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td class="unregister">${vo.unregister}</td>
							</tr>
							<tr>
								<th>승인여부</th>
								<td class="status">${vo.status}</td>
							</tr>
						</thead>
					</table>

				</div>
				<div class="popup_button">
					<button type="button" class="popup_close">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="background_accept">
		<div class="window_accept">
			<div class="popup_accept">
				<p id="popup_acceptGuide">승인하시겠습니까?</p>
				<input type="hidden" name="mid" class="accept_input">
				<button type="button" id="popup_acceptOk" style="cursor: pointer;">확인</button>
				<button type="button" id="popup_acceptNo" style="cursor: pointer;">취소</button>
			</div>
		</div>
	</div>
	<div class="background_ok">
		<div class="window_ok">
			<div class="popup_ok">
				<p id="popup_ok">승인완료되었습니다</p>
				<!--  <form name="acceptForm" action="acceptUpdate.do" method="post">-->
				<div class="popup_buttonok">
					<button type="button" id="popup_close" style="cursor: pointer;">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>