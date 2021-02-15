	$(document).ready(function(e){
	$('[name=h_contents]').val($('[name=h_contents]').val().trim());
	$('[name=h_contents]').val($('[name=h_contents]').val().replace(/<br\s?\/?>/g, "\n"));
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
	
	$('.goBack').click(function(){
		location.href='myHosting.do';
	});
	
	$('#submit_house').click(function(){
		$('[name=h_contents]').val($('[name=h_contents]').val().replace(/\n/gi,'<br/>'));
		alert('수정완료!');
		$("form[name=frm_house]").attr("action", "upSellerHouse.do");
		$("form[name=frm_house]").submit();
		//document.frm_house.submit();
	});
	
	$('input[name="housePicsDtoList[0].hp_option"]').last().attr('disabled',true);
});//////////////////////////////////////////////


//[1]주소검색 팝업에서 검색결과 항목을 클릭했을때 실행할 코드//////////////////////////////////////////////////////////////
//도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법
function execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {

      	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      	var roadAddr = data.roadAddress; // 도로명 주소 변수
      	
      	// 우편번호와 주소 정보를 해당 필드에 넣는다.
      	document.getElementById('postcode').value = data.zonecode;
      	document.getElementById("roadAddress").value = roadAddr;
      	document.getElementById("jibunAddress").value = data.jibunAddress;
      	
      	var guideTextBox = document.getElementById("guide");
      	// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      	if(data.autoRoadAddress) {
      		var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
      		guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
      		guideTextBox.style.display = 'block';
      	} else if(data.autoJibunAddress) {
      		var expJibunAddr = data.autoJibunAddress;
      		guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      		guideTextBox.style.display = 'block';
      	} else {
      		guideTextBox.innerHTML = '';
      		guideTextBox.style.display = 'none';
      	}
      	
      	//도로명주소에서 "행정구"값 만 추출
      	var startIndex = roadAddr.indexOf(" ")+1;
      	var endIndex = roadAddr.indexOf(" ", startIndex);
      	document.getElementById("region").value = roadAddr.substring(startIndex, endIndex);
      }/////////////end function()
  }).open();/////////////end daumPostcode
}//////////////////////////////end [1]


//[2] 입력된 주소가 서울특별시가 맞는지 체크////////////////////////////////////////////////////////////////////////////////////////////
function checkRegion(){
	var frm = document.frm_home;
	var roadAddr = document.getElementById("roadAddress").value;
	var city = roadAddr.substring(0, roadAddr.indexOf(" "));
	var exp = /서울/;    //검사할 문자열(정규표현식);
	
	if(frm.h_type.value == ''){
		alert('등록유형을 선택해주세요!');
		frm.h_type.focus();
		return false;
	}else if(exp.test(city)){
		return true;
	}else{
		alert('서울지역만 등록가능합니다!');
		frm.h_roadaddr.focus();
		return false;
	}
}//////////////////////////////end [2]

//[3]방 서브밋 시키기
function roomSubmit(index){
	var frmName = "frm_room"+index;
	alert('수정완료!');
	$("form[name="+frmName+"]").attr("action", "upSellerRoom.do");
	$("form[name="+frmName+"]").submit();
}

//[4-1]집 사진 변경할거니?
function showInput(index,id){
	var divId = "inputFile["+index+"]";
	var inputBox = document.getElementById(divId);
	//console.log(divId);
	//console.log(inputBox);
	 if(id == "on"){
		 //console.log('show');
		 inputBox.style.display = "block";
	 }else{
		 //console.log('hide');
		 inputBox.style.display = "none";
	 }
}

//[4-2]방 사진 변경할거니?
function showRput(index,id){
// 어떻게해야할지모르겠네
}

////////////////////////////////[5]이미지 새창으로띄우기
var modal = document.getElementById("myModal");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
var imgs = document.getElementsByClassName("review_img");
for(var i=0; i<imgs.length; i++){
    var img = imgs.item(i);
    img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
}
var span = document.getElementsByClassName("close")[0];
span.onclick = function() { 
	  modal.style.display = "none";
}
 ///////////////////////////////////////////////////////