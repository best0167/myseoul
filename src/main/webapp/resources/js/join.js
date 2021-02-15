$(document).ready(function(e) {

    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var phoneCheck = RegExp(/^\d{2,3}-\d{3,4}-\d{4}$/);
    var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
    var birthCheck = RegExp(/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/);
    var nameCheck = RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/);

    var u_phone = document.getElementById('u_phone').value;
    var u_gender = $(":input:radio[name=u_gender]:checked").val();
    var u_email = document.getElementById('u_email')        
    var u_birth = document.getElementById('u_birth').value;
    document.getElementById('u_nation').options[document.getElementById('u_nation').selectedIndex].value;
            

    var idx = false;
    var idx1 = false;

    $('#id-success').hide(); 
    $('#id-danger').hide();
    $('#email-success').hide(); 
    $('#email-danger').hide();
 		

    $('#signUp').click(function() {

    	if(!getCheck.test($('#u_id').val())) {
           	alert('영문자와 숫자를 조합하여 4~12자를 입력해주세요!');
          	$('#u_id').val('');
           	$('#u_id').focus();     	

           	return false;

        } else if(!getCheck.test($('#u_pw').val())) {
           	alert('영문자와 숫자를 조합하여 4~12자를 입력해주세요!');
           	$('#u_pw').val('');
          	$('#u_pw').focus();      	

         	return false;

        } else if($('#u_pw').val() != $('#u_pw_chk').val()) {
           	alert('패스워드가 다릅니다.');
          	$('#u_pw_chk').focus();

           	return false;

        } else if(!nameCheck.test($('#u_name').val())) {
           	alert("올바른 이름을 입력해주세요");
           	$('#u_name').focus();

           	return false;

        } else if(!phoneCheck.test($('#u_phone').val())) {
           	alert('올바른 전화번호 형식을 입력해주세요');
           	$('#u_phone').focus();        	

          	return false;

        } else if(!emailCheck.test($('#u_email').val())) {
          	alert('올바른 이메일 형식을 입력해주세요');
          	$('#u_email').focus();

           	return false;

        } else if(!birthCheck.test($('#u_birth').val())) {
           	alert('올바른 생년월일 형식을 선택해주세요');
          	$('#u_birth').focus();

           	return false;
        }

        if(idx == false) {
           	alert('아이디 중복체크를 해주세요.');
           	return false;
        }

        if(idx1 == false) {
          	alert('이메일 중복체크를 해주세요.');
           	return false;
        }
        else {
          	$('join_frm').submit();
        }

    });

        	

    $('#idChk').click(function() {
 		$.ajax({
 			url : 'idChk.do',
        	type : 'GET',
        	data : {
        		'u_id' : $('#u_id').val()
        	},

        	success: function(data) {

        		if($('#u_id').val() == "") {
        			alert("아이디를 입력해주세요!");
        			$('#u_id').focus();

        	    	return;

        	    } if(!getCheck.test($('#u_id').val())) {	    					
        			alert("4~12글자 사이로 입력해주세요!")

        			$('#u_id').focus();

        	    } else if(data == 0 && $.trim($('#u_id').val()) != "") {

        			$('#id-success').show();
        			$('#id-danger').hide();

        			idx = true;

        		    $('#u_id').change(function() {

        		    	idx = false;

        		        $('#id-success').hide(); 
        		        $('#id-danger').hide();

        		    })
        			$('#u_pw').focus();
    	    	
        	    } else{   				
        	    	$('#id-success').hide();
        			$('#id-danger').show();
        			}
        		},
   			error: function(){
   				alert('서버에러');
   			}
       	})
    })

        	

    $('#emailChk').click(function() {
    	$.ajax({
    		url : 'emailChk.do',
    		type : 'GET',
    		data : {
    			'u_email' : $('#u_email').val()
    		},

    		success: function(data) {  

           		if($('#u_email').val() == "") {
        			alert("이메일을 입력해주세요!");
        			$('#u_email').focus();

        	    	return;

           		} if(!emailCheck.test($('#u_email').val())) {	    					
        			alert("올바른 이메일을 입력해주세요!")
        			$('#u_email').focus();

        	    } else if(data == 0 && $.trim($('#u_email').val()) != "") {

	    			$('#email-success').show();
	    			$('#email-danger').hide();

	    			idx1 = true;
	    			$('#u_email').change(function() {
        		    	idx1 = false;
        		        $('#email-success').hide(); 
        		        $('#email-danger').hide();

        		    })
		    			
	    	    } else{   				
	    	    	$('#email-success').hide();
	    			$('#email-danger').show();

    			}
    		},

			error: function(){
				alert('서버에러');
			}

    	})
    })

});

        

$(function() {   	
   	$('#alert-success').hide(); 
   	$('#alert-danger').hide();

   	$('input').keyup(function(){ 
   		var u_pw=$('#u_pw').val(); 
    	var u_pw_chk=$('#u_pw_chk').val(); 
    	if(u_pw != "" || u_pw_chk != ""){  // 둘다 공백이 아닐때
    		if(u_pw == u_pw_chk){ 
    			$('#alert-success').show();
    			$('#alert-danger').hide();
    		}
    		else{ 
    			$('#alert-success').hide();
    			$('#alert-danger').show();
    		} 

    	} 
    });		
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