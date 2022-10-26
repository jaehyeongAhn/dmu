$(document).ready(function(){


	//페이징 리스트 출력
	function paging(dbcount, rpage, pageSize){
		
	var pager = jQuery('#ampaginationsm').pagination({
	
	    maxSize: 7,	    		// max page size
	    totals: dbcount,	// total rows	
	    page: rpage,		// initial page		
	    pageSize: pageSize,	// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
}
	
	//페이징 번호 클릭 시 이벤트 처리
/* 	jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/dmu/notice_list.do?rpage="+e.page);         
    });
	 */

	
	$(".snb-area .snb li a.tabbox").click(function(){
		
		//alert($(this).attr("id"));
		$(".snb-area .snb li").removeClass("on");
		$(this).parent().addClass("on");
		var kind = $(this).attr("id");
		
		notice_search(kind, 1);
		
	});	
	
	notice_search("all", 1);
	
	function notice_search(kind, rpage){
		
		$.ajax({
			url : 'notice_list_json.do',
			type: 'post',
			cache : false,
			headers : {"cache-control":"no-cache", "pragma": "no-cache"},
			data : {"ncategory" : kind, "rpage": rpage},
			success : function(data){
				//console.log(data);
				let dataset = JSON.parse(data);
		

                var output = "<div data-v-1b9c8af9='' data-v-080a389a='' class='notice-list'>";
				output += "<ul data-v-1b9c8af9='' data-v-080a389a=''>";
				for(obj of dataset.list){
					output += "<li data-v-1b9c8af9='' data-v-080a389a=''>";
					output += "<a href='notice_content.do?nid="+obj.nid+"' data-v-1b9c8af9='' data-v-080a389a='' href='javascript:void(0)'>";
					output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='number'>"+obj.rno+"</span>";
					output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='category'>"+obj.ncategory+"</span>";
					output += "<div data-v-1b9c8af9='' data-v-080a389a='' class='title-area'>";
					output += "<strong data-v-1b9c8af9='' data-v-080a389a='' class='title'>"+obj.ntitle+"</strong>";
					output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='date'>"+obj.ndate+"</span>"
					output += "</div></a></li>";
				}
				
				var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm'>"
				paging_list +="</div>"
				
				output += "</ul></div>";
				
				if(dataset.list.length !=0){
				
				$(".no-result").css("display","none");
					
				$(".notice-list").remove();
				$(".search-result").after(output);
				$(".notice-list").append(paging_list);
				$("div.search-result strong.total").text(dataset.dbCount);
				
				//$('.notice-list').html(data);
				
				paging(dataset.dbCount, dataset.rpage, dataset.pageSize);
				
				//페이징 번호 클릭 시 이벤트 처리
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
					   jQuery('.showlabelsm').text('The selected page no: '+e.page);
			           //$(location).attr('href', "http://localhost:9000/dmu/notice_list.do?rpage="+e.page);
			           notice_search(kind, e.page);
			    });
				
				}else{
					$("div.search-result strong.total").text(dataset.dbCount);
					$(".notice-list").remove();
					$(".no-result").css("display","block");
				}
				
			},
			error : function(data){
				alert('error');
			}
		});
		
	}//function - notice_search
		
	
	
	
	/* 
	* 검색기능
	*/
	
	
	$(".search-button").click(function(){
		if($(".select-list").css("display") == "none"){
			$(".select-list").css("display", "block");
			
		}else{
			$(".select-list").css("display", "none");
		}
	});
	
 	$("#title_button").click(function(){
		$(".select-list").css("display", "none");
		$(".search-button").text("제목");
	});
 	
	$("#content_button").click(function(){
		$(".select-list").css("display", "none");
		$(".search-button").text("내용");
		
	});
	
	
	$(".btn-search").click(function(){
		notice_search_list(1);
	});
	
	
	$("#field22").keyup(function(e){
		if(e.keyCode == 13){
			notice_search_list(1);
		}
	});

	
	function notice_search_list(rpage){
		$("#field22").val($("#field22").val().trim());
		let keyword = $("#field22").val().trim();
		//alert($(".search-button").text());
		$.ajax({
			
			url : 'notice_search_json.do',
			type: 'get',
			cache : false,
			headers : {"cache-control":"no-cache", "pragma": "no-cache"},
			data : {"searchList" : $(".search-button").text(), "keyword" : keyword, "rpage": rpage},
			success : function(data){
				let dataset = JSON.parse(data);
				
                var output = "<div data-v-26e42198='' class='btn-area'>";
                output += "<a href='admin_notice_write.do'>";
                output += "<button data-v-26e42198='' id='btn50_1' type='button' class='secondary' style='margin-top:30px'>글쓰기</button></a></div>";
				output += "<div data-v-1b9c8af9='' data-v-080a389a='' class='notice-list'>";
				output += "<ul data-v-1b9c8af9='' data-v-080a389a=''>";
				for(obj of dataset.list){
	                output += "<li data-v-1b9c8af9='' data-v-080a389a=''>";
	                output += "<a href='notice_content.do?nid="+obj.nid+"' data-v-1b9c8af9='' data-v-080a389a='' href='javascript:void(0)'>";
	                output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='number'>"+obj.rno+"</span>";
	                output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='category'>"+obj.ncategory+"</span>";
	                output += "<div data-v-1b9c8af9='' data-v-080a389a='' class='title-area'>";
	                output += "<strong data-v-1b9c8af9='' data-v-080a389a='' class='title'>"+obj.ntitle+"</strong>";
	                output += "<span data-v-1b9c8af9='' data-v-080a389a='' class='date'>"+obj.ndate+"</span>"
	                output += "</div></a></li>";	
				}
				
				var paging_list = "<div data-v-650d6904='' data-v-1b9c8af9='' class='pagination-area' data-v-080a389a='' id='ampaginationsm'>"
				paging_list +="</div>"
				
				output += "</ul></div>";
				
				
				if(dataset.list.length !=0){
					
	            $(".no-result").css("display","none");
                
	            $(".notice-list").remove();
	            $(".search-result").after(output);
	            $(".notice-list").append(paging_list);
	            $("div.search-result strong.total").text(dataset.dbCount);
	            
				paging(dataset.dbCount, dataset.rpage, dataset.pageSize);
	            
				//페이징 번호 클릭 시 이벤트 처리
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
					   jQuery('.showlabelsm').text('The selected page no: '+e.page);
			           //$(location).attr('href', "http://localhost:9000/dmu/notice_list.do?rpage="+e.page);
			           notice_search_list(e.page);
					
			    }); 
				
				}else{
					$("div.search-result strong.total").text(dataset.dbCount);
					$(".notice-list").remove();
					$(".no-result").css("display","block");
					
				}
			
			},
			error : function(data){
				alert('error');
			}
			
		}); //ajax
		
	
	}//function - notice_search_list


	
});//ready