function checkfunction(num){
	var div_toggle = "div_toggle"+num;
	var ele = document.getElementById(div_toggle);
	$(ele).children('p').toggle();
}

function allOff(){
	$('.cls_toggle p:first-child').css("display","inline");
	$('.cls_toggle p:last-child').css("display","none");
}