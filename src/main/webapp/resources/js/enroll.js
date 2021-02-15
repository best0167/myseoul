

// [1]주소검색 팝업에서 검색결과 항목을 클릭했을때 실행할 코드//////////////////////////////////////////////////////////////
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
		$('[name=h_contents]').val($('[name=h_contents]').val().replace(/\n/gi,'<br/>'));
		return true;
	}else{
		alert('서울지역만 등록가능합니다!');
		frm.h_roadaddr.focus();
		return false;
	}
}//////////////////////////////end [2]


//[3]이미지 drag&drop 박스 이벤트등록/////////////////////////////////////////////////////////////////////////////////////////
$('.imgBox')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e){
e.stopPropagation();
e.preventDefault();
}

function uploadFiles(e){
e.stopPropagation();
e.preventDefault();
}


function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $(e.target).css({
            "background-color": "gray",
            "outline-offset": "-20px"
        });
    } else {
        $(e.target).css({
            "background-color":"rgba(241, 242, 246,0.5)",
            "outline-offset": "-10px"
        });
    }
}
//////////////////////////////end [3]


//[4]이미지 드랍시 input 타입에 등록시킴////////////////////////////////////////////////////////////////////////////////////
function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e); //드래그했던 변경사항 원상복구
    $('#mainImg').prop('files',null);  //기존에 이미지가 업로드되어있었다면 지움
    $('.innerText').css('display','none');
 
    e.dataTransfer = e.originalEvent.dataTransfer;  //e.dataTransfer가 undefined로 뜰때가있음
    var files = e.target.files || e.dataTransfer.files;  //드랍한 객체 담기
 
    if (files.length > 1) {
        alert('하나만 드롭시키세요!');
        return;
    }
    
    if (files[0].type.match(/image.*/)) {
    	//input타입에 적용시키기
    	$('#mainImg').prop('files',files);
    	
    	//이미지 미리보기
        $(e.target).css({
            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
            "outline": "none",
            "background-size": "100% 100%"
        });
    }else{
      alert('이미지가 아닙니다.');
      return;
    }
}//////////////////////////////end [4]


//[5]추가사진 버튼클릭이벤트////////////////////////////////////////////////////////////////////////////////////////////
$('#btn_add').on('click',function(){
	var child = $('#addInputTag > input').length;  //최대3개로 제한둘것임
	if(child == "3"){
		alert('최대허용갯수는 3개입니다!');
	}else{
		$('#addInputTag').append("<input type='file' name='files' accept='image/jpeg'><br>");
	}
});

$('#btn_minus').on('click',function(){
	$('#addInputTag br:last').remove();
	$('#addInputTag input:last').remove();
});
//////////////////////////////end [5]