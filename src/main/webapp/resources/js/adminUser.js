function checkfunction(u_id){
	var div_toggle = "div_toggle_"+u_id;
	var ele = document.getElementById(div_toggle);
	$(ele).children('p').toggle();
}

function allOff(){
	$('.cls_toggle p:first-child').css("display","inline");
	$('.cls_toggle p:last-child').css("display","none");
}