 
	function onlyNumber() {
		var str = 0;
		var Mynum = document.getElementById("inptext").value;
		Mynum = Mynum.replace(/[^0-9]/g, '');
		document.getElementById("inptext").value = Mynum;
		var plus = document.getElementById("inptext").value = Mynum;
		if (plus < str) {
			document.getElementById("inptext").value = 0;
		} else if (plus > 4) {
			document.getElementById("inptext").value = 4;
		}
	}
	
	$(document).ready(function() { 
		var inp = $("#inptext").val();
		$(".btn-plus").on("click", function() {
			setTimeout(function() {
				if (inp == 4) {
					inp;
				} else {
					inp++;
				}
				$("#inptext").val(inp);
				$("#rtotal").val(inp);
			}, 4);
		});
		$(".btn-minus").on("click", function() {
			setTimeout(function() {
				if (inp == 0) {
					inp;
				} else if (inp <= 4) {
					inp--;
				}
				$("#inptext").val(inp);
				$("#rtotal").val(inp);
			}, 4);
		});
	 
 
 
				let min_start = 0;
				let enddate = "${vo.enddate}";
				let startdate = "${vo.startdate}";
				
				if(startdate < 0) {
					min_start = 0;
				}else {
					min_start = startdate;
				}
				
				// Getter
				var dayNamesShort = $("#calendar").datepicker("option",
						"dayNamesShort");

				$("#calendar").datepicker(
						{
							//datepicker 초기 설정
							dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thu",
									"Fri", "Sat" ],
							dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu",
									"Fri", "Sat" ],
							monthNames : [ "01", "02", "03", "04", "05", "06",
									"07", "08", "09", "10", "11", "12" ],
							minDate : parseInt(min_start),
							maxDate : parseInt(enddate),
							showMonthAfterYear : false,
							//datepicker의 DOM이 업데이트 될 때 호출 (오늘 날짜 자동으로 받아 저장)
							onUpdateDatepicker : function() {
								var date = $.datepicker.formatDate("yy-mm-dd",
										$("#calendar").datepicker("getDate"));
								$("#date").val(date);
								$("#rdate").val(date);
							},
							//datepicker의 날짜가 변경될 때마다 이벤트 발생 (선택 날짜 받아 저장)
							onSelect : function() {
								var date = $.datepicker.formatDate("yy-mm-dd",
										$("#calendar").datepicker("getDate"));
								$("#date").val(date);
								$("#rdate").val(date);
								$(".round-selection").attr("disabled", false)

								//alert(date);
							}
						});

				// Setter
				$("#calendar").datepicker("option", "dayNamesShort",
						[ "Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam" ]);

		 
	 
	//popup
	$(".icon").click(function(){
		$(".background_exhibition").addClass("show");
		$(".window_exhibition").addClass("show");
		$(".popup_close").click(function(){
			$(".background_exhibition").removeClass("show");
			$(".window_exhibition").removeClass("show");
		});
	});
	
 });
	
