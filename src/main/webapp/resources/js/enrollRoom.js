function changeSpan(index){
	var oId = "opened"+index;
	var cId = "closed"+index;
	var opened = document.getElementById(oId);
	if(opened.style.display == "none"){
		document.getElementById(oId).style.display = "inline";
		document.getElementById(cId).style.display = "none";
	}else{
		document.getElementById(oId).style.display = "none";
		document.getElementById(cId).style.display = "inline";
	}

}



function addInput(index){
	var cnt = $('#addInputTag'+index+' > input').length;
	console.log(cnt);
	if(cnt == "3"){
		alert('최대허용갯수는 3개입니다!');
	}else{
		$('#addInputTag'+index).append("<input type='file' name='roomPicsDtoList["+index+"].files' accept='image/jpeg'><br>");
	}
}

function delInput(index){
	var cnt = $('#addInputTag'+index+' > input').length;
	console.log(cnt);
	if(cnt == "1"){
		alert('최소 1개의 사진은 등록해야합니다!');
	}else{
		$('#addInputTag'+index+ ' br:last').remove();
		$('#addInputTag'+index+ ' input:last').remove();
	}
}

function send(){
	alert('등록신청완료!');
	document.frm_rooms.submit();
}