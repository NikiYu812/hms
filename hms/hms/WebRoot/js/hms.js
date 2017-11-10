/**
 * 
 */
/*
 * $(document).ready(function(){ $("#navbar> .navbar-nav> .dropdown-menu > li
 * >a").click(function(){ alert("123"); console.log("123");
 * $(this).addClass("active").siblings().removeClass("active");
 * 
 * });
 * 
 * 
 * });
 */
/*
 * function Detail(str) { $("#oldHouseDetails #oh_house_no").text(str.house_no);
 * $("#oldHouseDetails #oh_area").text(str.area); $("#oldHouseDetails
 * #oh_move_state").text(str.move_state); $("#oldHouseDetails
 * #oh_move_seq").text(str.move_seq); $("#oldHouseDetails
 * #oh_p0_name").text(str.person.p0_name); $("#oldHouseDetails
 * #oh_p0_uid").text(str.person.p0_uid); $("#oldHouseDetails
 * #oh_p1_name").text(str.person.p1_name); $("#oldHouseDetails
 * #oh_p1_idcNo").text(str.person.p1_idcNo); $("#oldHouseDetails
 * #oh_telNo").text(str.person.telNo); $("#oldHouseDetails
 * #oh_sign_state").text(str.sign_state); console.log(str.toString); }
 */

$(function() {
	$('#nav-search-input').bind(
			'keypress',
			function(event) {
				if (event.keyCode == "13") {
					var kw = $("#nav-search-input").val();
					window.location.href = "housingServlet?method=list&kw="
							+ encodeURI(encodeURI(kw));
				}
			});
});
function showDetail(kw, choose) {
	if (choose == null) {
		choose = 0;
	}
	if (kw == null || kw == "") {
	} else {
		var url = "housingServlet?method=find&type=1&choose="
				+ encodeURI(encodeURI(choose)) + "&kw="
				+ encodeURI(encodeURI(kw));
		window.location.href = url;
	}
}

$('.btn-choose')
		.click(
				function() {
					var id = $(this).attr('id');
					console.log(id);
					$('#choose-confirm')
							.on(
									'show.bs.modal',
									function(e) {
										if (id == 'choose1-btn') {
											$('#choose-modal-body').html(
													'<h4>确认进行第一轮抽签？</h4>');
											$(this)
													.find('.btn-ok')
													.attr(
															'href',
															encodeURI($(
																	e.relatedTarget)
																	.data(
																			'href')));
										} else if (id == 'choose2-btn') {
											var building_type_text = $(
													'#building_type').find(
													'option:selected').text();
											var building_type_value = $(
													'#building_type').val();
											console.log(building_type_text);
											$('#choose-modal-body')
													.html(
															'<h4>您选择的房源类型：'
																	+ building_type_text
																	+ '</h4><h4>确认进行第二轮抽签？</h4>');
											$(this)
													.find('.btn-ok')
													.attr(
															'href',
															encodeURI($(
																	e.relatedTarget)
																	.data(
																			'href'))
																	+ '&building_type='
																	+ building_type_value);
										}

									});

				});
