<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<style>
.wrap{
    width:1000px;
    height:400px;
    margin-top:60px;
    margin-bottom:80px;
    margin:auto;
}
.login_whole{
	width:850px;
	height:400px;
	margin-top:60px;
    margin-bottom:200px;
	margin-left:auto;
	margin-right:auto;
}
.login_left{
	width:400px;
	height:290x;
	float:left;
	padding-right:10px;
}
.login_input{
    margin-bottom:40px;
}
.form-control{
    width:100%;
    height:50px;
    border:2px solid #6F1E51;
}
div.login_input i{
	position:relative;
	float: right;
	margin-top: -38px;
	margin-right:10px;
	z-index: 2;
}    
.btn{
    width:100%;
    height:50px;
}
.btn-default{
    background-color: #6F1E51;
    color:white;
    font-size: 20px;
}
.btn-default:hover{
	background-color: white;
	border:2px solid #6F1E51;
	font-size: 20px;
	color: #6F1E51;
}
.login_left_bottom{
    width:390px;
    height:50px;
    margin-top:10px;
    margin-left:auto;
    margin-right:auto;
}
#wrap_errText{
	margin:auto;
	width:350px;
    height:30px;
}
.link_area{
	width:300px;
	height:20px;
	margin:auto;
	padding-left:13px;
}
.link:link{color:black; text-decoration:none;}
.link:visited{color:black;}
.link:hover{color:#2E9AFE;text-decoration:underline;}
.link:active{color:black;} 
.link{margin-left:5px;}
.login_right{
	width:400px;
	height:290px;
	float:right;
	padding-right:10px;
}
.login_img{
    width:400px;
    height:290px;
    border-radius: 8px;
}
div.login_input i{
	position:relative;
	float: right;
	margin-top: -37px;
	margin-right:10px;
	z-index: 2;
}    
a{color:#6E6E6E; text-decoration:none;}
#login-id-fail {color: red;}
#login-pwd-fail{color: red;}
#errText{color:red;}     
</style>
    
    <script type="text/javascript">
    	$(function() {
    		
    		$('#joinGo_btn').click(function() {
    			location.href = 'joinGo.do';
    		})
    		
    		$('#find_user_btn').click(function() {
    			location.href = 'searchUser.do';
    		})
    	})
    </script>
    
</head>
<body>
	<div class="wrap">
    	<div class="login_whole">
        	<h1>로그인</h1>
         	<hr>
         	<br>
         	<!-- 왼쪽영역 -->
         	<div class="login_left">
            	<form name="frmLogin" encType="UTF-8" action="login.do" method="post">
                	<div class="login_input">
                    	<input class="form-control" type="text" id="u_id" name="u_id" placeholder=" 아이디"  autofocus/>
                 	</div>
                 	<div class="login_input"> 
                    	<input class="form-control" type="password" id="u_pw" name="u_pw" placeholder=" 비밀번호" />
                    	<i class="eye"><img src="images/eye.png" width="25px" /></i>
                 	</div>
                 	<input type="submit" class="btn btn-default" value="로 그 인">
             	</form>
            
             	<div class="login_left_bottom">
             	 	<div id="wrap_errText">
             	 		<span id="errText">${param.errStr}</span>
             	 	</div>
             	 	<div class="link_area">
                		<a class="link" href="joinGo.do">회원가입 |</a>
                		<a class="link" href="searchUser.do">아이디 찾기 |</a>
                		<a class="link" href="searchUserPw.do">비밀번호 찾기</a>
                	</div>
             	</div>            
         	</div>    <!-- end login_left -->
 
	        <!-- 오른쪽 영역 -->
         	<div class="login_right">
            	<img class="login_img" src="images/seoul_01.jpg" alt="no">  
         	</div>     <!-- end login_ad_area -->
     	</div> <!-- end login_whole -->
	</div>
  
<script type="text/javascript">    
    $(document).ready(function(e){
    	$('.login_input i').on('click',see);
    	
    	$("#login").click(function() {
    		if($.trim($("#u_id").val()) == '') {
    			alert("아이디를 입력해주세요");
    			$("#u_id").focus();
    			return false;
    		} else if($.trim($("#u_pw").val()) == '') {
    			alert("비밀번호를 입력해주세요");
    			$("#u_pw").focus();
    			return false;
    		}
    		
    		$("#frm_login").submit();
    	});
    	
    	if(${param.errStr != null}){
    		$("#wrap_errText").append("&nbsp;");
    		
    		var interval = setInterval(function(){
    			$("#errText").toggle();
    		},500);
    		
    		setTimeout(function(){
    			clearInterval(interval);
    		},3000);
    	}

});  //////////////////////////////////////////////////////////

function see(){
	//비밀번호 표시,제거 버튼
	$('#u_pw').toggleClass('active');
    if($('#u_pw').hasClass('active')){
        $(this).attr('class',"eye").prev('#u_pw').attr('type',"text");
    }else{
        $(this).attr('class',"eye").prev('#u_pw').attr('type','password');
    }
}/////////////////////////////

</script>
</body>
</html>