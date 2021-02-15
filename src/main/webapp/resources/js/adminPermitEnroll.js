
$(document).ready(function() {
	$('#cancelPermitEnroll').click(function() {
		if(confirm("허가를 취소하시겠습니까?")) {
			alert("허가가 취소되었습니다.");
		} else {
			return false;
		}
	})

	
	$('#delete').click(function() { 
		if(confirm("삭제하시겠습니까? 되돌릴 수 없습니다.")) {
			alert("삭제되었습니다.");
		} else {
			return false;
		}    	
	});
	
	$('#searchBtn').click(function() {


		if(!$("input:checked[Name='h_region']").is(":checked")) {
			alert("지역을 선택해주세요");
			return false;
		} else {
		
		$('#search').attr('action', 'adminPermitEnroll.do');
		$('#search').submit();
		}
	});
});	


function doOpenCheck(chk) {
	var obj = document.getElementsByName("h_region");
	for(var i=0;i<obj.length;i++) {
		if(obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}