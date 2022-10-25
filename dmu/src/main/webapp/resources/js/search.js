
	$(document).ready(function(){
		//리스트 init
		$(".ex-list").css("display", "none");
		
		//카테고리 선택
		$("li.category a").click(function(){
			category(this);
		});
		
		function category(obj) {
			//카테고리 선택
			$("ul.snb.en li").removeClass("on");
			$(obj).parents().addClass("on");
			search($(obj).attr("alt"));
		}
		
		//search ajax
		$(".search-btn").click(function(){
			search_start();
		});//mouse-click
		
		//enter ajax
		$(".search-bar").keyup(function(e){
			if(e.keyCode == 13){
				search_start();
			}//keycode-check
		});//keyup-event
		
		//search 동작 이벤트
		function search_start(){
			if($(".search-bar").val().trim().length < 2) {
				$(".alert").css("display", "block");
				$(".search-bar").focus();
				return false;
			}else {
				$(".alert").css("display", "none");
				search($("li.category.on a").attr("alt"));
			}//if문
		}
		
		function search(dcode){
			$(".search-bar").val($(".search-bar").val().trim());
			$.ajax({
				type : "get",
				url : "searchText.do?keyword="+$(".search-bar").val().trim()+"&dpage="+dcode,
				/*data : {
					keyword : $(".search-bar").val().trim(),
					dpage : dcode
				},*/
				success : function(result){
					//alert(result);
					let data = JSON.parse(result);
					
					let output = "<dd class = 'on'>";
					output += "<div class = 'introduce-menu'>";
					output += "<div class='img-area'>";
					output += "<img src='' style=''>";
					output += "</div>";
					output += "<div class='info-area'>";
					output += "<p class='tag'></p>";
					output += "<p class='title'></p>";
					output += "<ul>";
					output += "<li><em>장소: </em><span></span></li>";
					output += "<li><em>일시: </em><span></span></li>";
					output += "</ul>";
					output += "</div>";
					output += "</div>";
					output += "<div class='btn-group'>";
					output += "<div class='btn-area'>";
					output += "<a href = '#' class = 'link_other'><button id='btn95' type='button' class='secondary small'>다른 전시회 살펴보기</button></a>";
					output += "</div>";
					output += "<div class='btn-area search-hidden-btn'>";
					output += "<a href='#' class='link_ticket'><button id='btn96' type='button' class='primary small'>예매하기</button></a>";
					output += "</div>";
					output += "</div>";
					output += "</dd>";

					//스타일 초기화
					function init_style(){
						$(".exhibition").css("display", "none");
						$(".learn").css("display", "none");
						$(".event").css("display", "none");
						
						$(".exhibition dt").siblings("dd").remove();
						$(".learn dt").siblings("dd").remove();
						$(".event dt").siblings("dd").remove();
					}
					init_style();
					
					//category($("li.category.all"));
					
					//검색 리스트 출력
					let index = 2;
					search_totalcount($(".search-bar").val().trim());
					
					//검색 결과 출력
					function list_print(){
						if(data.list.length != 0){
							$("div.container.search ul.guidance-area").css("display", "none");
							for(dataset of data.list){
								if(dataset.dcode == "exhibition"){
									$(".exhibition").css("display", "block");
									data_search("exhibition");
								}else if(dataset.dcode == "learn") {
									$(".learn").css("display", "block");
									data_search("learn");
								}else if(dataset.dcode == "event") {
									$(".event").css("display", "block");
									data_search("event");
								}
							}
						}else {
							$("div.container.search ul.guidance-area").css("display", "block");
						}
					}
					list_print();
				
					//디자인 함수
					function data_search(str){
						$("." + str).append(output);	
						//$("." + str + " dd").filter(":nth-child(" + index + ")").addClass("search" + index);
						$("." + str + " dd.on").addClass("search" + index);
						$("." + str + " dd.search" + index + " div.img-area img").attr("src", "http://localhost:9000/dmu/resources/upload/"+dataset.dsfile);
						$("." + str + " dd.search" + index + " div.info-area p.tag").text(dataset.dtarget);
						$("." + str + " dd.search" + index + " div.info-area p.title").text(dataset.dtitle);
						$("." + str + " dd.search" + index + " div.info-area li:first-child span").text(dataset.dplace);
						$("." + str + " dd.search" + index + " div.info-area li:last-child span").text(dataset.dstart + " ~ " + dataset.dend);
						$("." + str + " dd.search" + index + " div.btn-group input.id_result").val(dataset.did);
						$("." + str + " dd.search" + index + " div.btn-group a.link_ticket").attr("href", "http://localhost:9000/dmu/"+str+".do?did="+dataset.did);
						$("." + str + " dd.search" + index + " div.btn-group a.link_other").attr("href", "http://localhost:9000/dmu/"+str+"_list.do");
	
						//.on 삭제
						$("dd").removeClass("on");
						
						++index; 
					}
					
					
				}
			});//ajax
		}//search function()
		
		//검색 결과 수
		function search_totalcount(keyword){
			$.ajax({
				url : "searchTotal.do?keyword="+keyword,
				success : function(result){
					let data = JSON.parse(result);

					$("li.category.all span").text(data.total);
					$("li.category.exhibition_list span").text(data.exhibition);
					$("li.category.learn_list span").text(data.learn);
					$("li.category.event_list span").text(data.event);

				}//success
			});//ajax
		}
		
		
	
		/************************* header_search ***************************/
		if($(".search-bar").val() != ""){
			search("all");
		}
	});