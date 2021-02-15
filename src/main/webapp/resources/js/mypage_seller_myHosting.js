$(document).ready(function(e){
	
});/////////////////////////


function delHouseFunc(hnum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = 'delSellerHouse.do?h_num='+hnum;
		location.href=url;
	}else{
		alert('취소하셨습니다.');
		return false;
	}
}