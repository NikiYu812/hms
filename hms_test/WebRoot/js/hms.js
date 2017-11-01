/**
 * 
 */
/*
$(document).ready(function(){
    $("#navbar> .navbar-nav> .dropdown-menu > li >a").click(function(){
        alert("123");
        console.log("123");
        $(this).addClass("active").siblings().removeClass("active");
        
    });
    
    
});
*/
function Detail(str){
	$("#oldHouseDetails #oh_house_no").text(str.house_no);
	$("#oldHouseDetails #oh_area").text(str.area);
	$("#oldHouseDetails #oh_move_state").text(str.move_state);
	$("#oldHouseDetails #oh_move_seq").text(str.move_seq);
	$("#oldHouseDetails #oh_p0_name").text(str.p0_name);
	$("#oldHouseDetails #oh_p0_uid").text(str.p0_uid);
	$("#oldHouseDetails #oh_p1_name").text(str.p1_name);
	$("#oldHouseDetails #oh_p1_idcNo").text(str.p1_idcNo);
	$("#oldHouseDetails #oh_telNo").text(str.telNo);
	$("#oldHouseDetails #oh_sign_state").text(str.sign_state);
	console.log(str.house_no+" "+str.area+" "+str.move_state+" "+str.move_state+" "+str.p0_name+" "+str.p0_uid+" "+str.p1_name+" "+str.p1_idcNo+" "+str.telNo);

}