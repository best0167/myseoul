<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<div class="w3-container w3-teal">
  		<h3>방문 신청하기</h3>
	</div>

  <form id="frm" name="frm" class="w3-container">



        <p><label class="w3-text-teal"><b>아이디</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" value="${dto.u_id}" id="v_uid" name="v_uid" readonly></p>


        <p><label class="w3-text-teal"><b>이름</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" value="${dto.u_name}" id="v_uname" name="v_uname" readonly></p>


        <p><label class="w3-text-teal"><b>방문 희망 날짜</b></label>
        <input class="w3-input w3-border w3-light-grey" type="date" name="v_date" id="v_date" max="9999-12-31" required /></p>


        <p><label class="w3-text-teal"><b>연락처</b></label>
        <input class="w3-input w3-border w3-light-grey" placeholder="연락처를 작성해 주세요"type="text"  id="v_phone" name="v_phone" onKeyup="inputTelNumber(this);" maxlength="13" required></p>


		<!-- 집, 방 -->
		<p><label class="w3-text-teal"><b>방 이름</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" value="${rdto.r_name}" id="v_rname" name="v_rname" readonly></p>
        <p><label class="w3-text-teal"><b>집 이름</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" value="${hdto.h_name}" id="v_hname" name="v_hname" readonly></p>


        <p><label class="w3-text-teal"><b>집 주소</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" width="500px" value="${hdto.h_roadaddr}" id="v_hroadaddr" name="v_hroadaddr" readonly></p>


    <!-- 판매자:-->
    <p><label class="w3-text-teal"><b>판매자 이름</b></label>
    <input class="w3-input w3-border w3-light-grey" type="text" value="${pdto.u_name}" id="v_pname" name="v_pname" readonly></p>
    <p><label class="w3-text-teal"><b>판매자 연락처</b></label>
    <input class="w3-input w3-border w3-light-grey" type="text" value="${pdto.u_phone}" id="v_pphone" name="v_pphone" readonly></p>


    
    <input type="hidden" value="${rdto.r_hnum}" id="v_hnum" name="v_hnum"/>
    <input type="hidden" value="${rdto.r_num}" id="v_rnum" name="v_rnum"/>
    <input type="hidden" value="${rdto.r_pid}" id="v_pid" name="v_pid">
    
    <p><input type="button" class="w3-btn w3-teal" id="visit" value="방문 예약 하기">
    <button class="w3-btn w3-teal" onclick="self.close();">취소 하기</button></p>
  </form>
</body>

<script type="text/javascript">

	var phoneCheck = RegExp(/^\d{2,3}-\d{3,4}-\d{4}$/);
	var dateCheck = RegExp(/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/);
	
	var v_phone = document.getElementById('v_phone').value;
	var v_date = document.getElementById('v_date').value;
	
  $('#visit').on('click',function(){
	if(!phoneCheck.test($('#v_phone').val())) {
	  	alert('올바른 전화번호 형식을 입력해주세요');
	  	$('#v_phone').focus();
	        	
	  	return false;
	} else if(!dateCheck.test($('#v_date').val())) {
	   	alert('올바른 년월일 형식을 선택해주세요');
	   	$('#v_date').focus();
	        	
	   	return false;
	}else{
	 $('#frm').attr('action','visitReservationPro.do').submit();
	 alert('방문 예약 완료! 방문 신청 내역으로 이동합니다')
	 opener.location.href="userReservation2.do"
	 self.close();
	}
  });

function inputTelNumber(obj) {
  	var number = obj.value.replace(/[^0-9]/g, "");
    var u_phone = "";
	
    // 서울 지역번호(02)가 들어오는 경우
    if(number.substring(0, 2).indexOf('02') == 0) {
  	    if(number.length < 3) {
   	    	return number;
  	    } else if(number.length < 6) {
  	        u_phone += number.substr(0, 2);
       	    u_phone += "-";
       	    u_phone += number.substr(2);
       	} else if(number.length < 10) {
       	    u_phone += number.substr(0, 2);
       	    u_phone += "-";
       	    u_phone += number.substr(2, 3);
      	    u_phone += "-";
       	    u_phone += number.substr(5);
       	} else {
       	    u_phone += number.substr(0, 2);
       	    u_phone += "-";
       	    u_phone += number.substr(2, 4);
       	    u_phone += "-";
       	    u_phone += number.substr(6);
       	}
          	        
   // 서울 지역번호(02)가 아닌경우
    } else {
        if(number.length < 4) {
        	return number;
	    } else if(number.length < 7) {
	   	    u_phone += number.substr(0, 3);
	   	    u_phone += "-";
	   	    u_phone += number.substr(3);
	   	} else if(number.length < 11) {
	   	    u_phone += number.substr(0, 3);
	   	    u_phone += "-";
	   	    u_phone += number.substr(3, 3);
	  	    u_phone += "-";
	   	    u_phone += number.substr(6);
	   	} else {
	   	    u_phone += number.substr(0, 3);
	   	    u_phone += "-";
	  	    u_phone += number.substr(3, 4);
	   	    u_phone += "-";
	   	    u_phone += number.substr(7);
	   	}
	}
	           	    
	obj.value = u_phone;
}
</script>
</html>