<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="resources/css/mypage_users_update.css" rel="stylesheet" type="text/css">
</head>
<body>
    <h1>회원 정보 수정</h1>
	<hr>
	<form id="upddel_frm" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input type="text" value="${dto.u_name}" id="u_name" name="u_name"></td>
			</tr>
			
			<tr>
			<th>등급</th>
			<td>
	  		  <select name='u_grade' name="u_grade" id='u_grade' required >
		     	<c:set var="u_garde" value="${dto.u_grade}" />
				<c:choose>
				
					<c:when test="${dto.u_grade==0 }">
					  <option value="0" selected>일반유저</option>
					  <option value="1">판매유저</option>
					</c:when>
					<c:when test="${dto.u_grade==1 }">
					  <option value="1" selected>판매유저</option>
					  <option value="0">일반유저</option>
					</c:when>
					<c:otherwise>
						관리자
					</c:otherwise>
				</c:choose>
				</select>
			</td>
			</tr>

		
			<tr>
				<th>아이디</th>
				<td>${dto.u_id}</td>
				
			</tr>
		
			<tr>
				<th>비밀번호</th>
				<td>${dto.u_pw}</td>
			</tr>
				
			<tr>
				<th>성별</th>
				<td>
					<c:set var="u_gender" value="${dto.u_gender}" />
					<c:if test='${u_gender eq "m" }'>
						<label>
							<input type="radio" name="u_gender" value="m" id="u_gender" checked />남자
						</label>
						<label>
							<input type="radio" name="u_gender" value="w" id="u_gender">여자
						</label>
					</c:if>
					<c:if test='${u_gender eq "w" }'>
						<label>
							<input type="radio" name="u_gender" value="m" id="u_gender" />남자
						</label>
						<label>
							<input type="radio" name="u_gender" value="w" id="u_gender" checked />여자
						</label>
					</c:if>
				</td>
			</tr>
		
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="u_phone" id="u_phone" name="u_phone" value="${dto.u_phone}" onKeyup="inputTelNumber(this);" maxlength="13" >
				</td>
			</tr>
		
			<tr>
				<th>이메일</th>
				<td><input type="text" value="${dto.u_email}" id="u_email" name="u_email"></td>
			</tr>
		
			<tr>
				<th>생년월일</th>
				<td><input type="date" value="${dto.u_birth}" max="9999-12-31" id="u_birth" name="u_birth"></td>
			</tr>
		
			<tr>
				<th>국가</th>
				<td>
					<select name='u_nation' name="u_nation" id='u_nation' required >
						<c:set var="u_nation" value="${dto.u_nation}" />
						<c:if test="${u_nation eq 'Korea' }">		
							<option value='Korea' selected>Korea</option>
							<option value='North of America'>North of America</option>
							<option value='China'>China</option>
							<option value='Japan'>Japan</option>
							<option value='France'>France</option>
							<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'North of America' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America' selected>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'China' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China' selected>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'Japan' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan' selected>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'France' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France' selected>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'Canada' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada' selected>Canada</option>
			</c:if>
			</select>
			</td>
		</tr>
		<tr>
			<th>적립포인트</th>
			<td><input type="text" value="${dto.u_point}" id="u_point" name="u_point"></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.u_regdate}</td>
		</tr>
	 </table>
	 
	 <div class="button_area">
       <input type="submit" id="update" value="회원정보수정하기" class="btn btn-primary" onclick="javascript: form.action='/myseoul/adminUserUpdatePro.do';">
    </div>
    <c:set var="u_id" value="${dto.u_id}"></c:set>
    <input type="hidden" value="${u_id}" name="u_id">
    </form>
   
    <script type="text/javascript">
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
</body>
</html>