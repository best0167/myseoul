<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!--[*] 헤더 : 상단 메뉴바 -->
    <div class="w3-top" id="wrap_topMenu" style="z-index:10;">
        <div class="w3-bar w3-left-align w3-large" id="topMenu">
            <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
            <a href="main.do" class="w3-bar-item w3-button w3-padding-large" id="logo" style="text-decoration: none;"><i class="fa fa-home w3-margin-right"></i>SeoulMate</a>
        
            <!--[1] 집대여 메뉴 -->    
            <div class="w3-dropdown-hover w3-hide-small" style="font-family:Arial;font-weight:bold;">
                <button class="w3-button w3-padding-large">방 찾기</button>
                <div class="w3-dropdown-content w3-card-3 w3-bar-block" style="width:300px">
                    <a href="house_list.do" class="w3-bar-item w3-button" style="text-decoration: none;">목록에서 찾기</a>
                    <a href="mapGo.do" class="w3-bar-item w3-button" style="text-decoration: none;">지도에서 찾기</a>
                </div>
            </div>
            
            <!--[2] 등록 메뉴 -->
            <div class="w3-dropdown-hover w3-hide-small" style="font-family:Arial;font-weight:bold;">
                <button class="w3-button w3-padding-large">호스팅하기</button>
                <div class="w3-dropdown-content w3-card-2 w3-bar-block" style="width:300px">
                    <a href="enrollGo.do" class="w3-bar-item w3-button" style="text-decoration: none;">등록하기</a>
                </div>
            </div>
            
            <!--[3] 공지사항 메뉴 -->
            <div class="w3-dropdown-hover w3-hide-small" style="font-family:Arial;font-weight:bold;">
                <button class="w3-button w3-padding-large">공지사항</button>
                <div class="w3-dropdown-content w3-card-3 w3-bar-block" style="width:300px">
                    <a href="noticeGo.do" class="w3-bar-item w3-button" style="text-decoration: none;">공지사항</a>
                    <a href="faqGo.do" class="w3-bar-item w3-button" style="text-decoration: none;">자주 묻는 질문</a>
                </div>
            </div>
            
            <!--[4] 서비스센터 메뉴 -->
            <div class="w3-dropdown-hover w3-hide-small" style="font-family:Arial;font-weight:bold;">
                <button class="w3-button w3-padding-large" >질문하기</button>
                <div class="w3-dropdown-content w3-card-2 w3-bar-block" style="width:300px">
                    <a href="qnaGo.do" class="w3-bar-item w3-button" style="text-decoration: none;">질문과 답변</a>
                </div>
            </div>
            
            <!--[5] 아바타이미지(회원관련메뉴) -->
            <a href="javascript:void(0)" id="btn_avatar" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" 
                    style="padding:0px;" title="My Account" onclick="showUserOption()">
                    <i class="fas fa-user-circle" id="avat"></i>
            </a>
        
            <!--[5-1] 아바타이미지 클릭시 - 세션에 저장된 id 없는경우 - 로그인,회원가입 메뉴 보이기 -->
            <a href="login.do" id="btn_login" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" style="padding:0px;font-family:Arial;font-weight:bold;text-decoration:none;display:none;">로그인</a>
            <a href="joinGo.do" id="btn_join" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" style="padding:0px;font-family:Arial;font-weight:bold;text-decoration:none;display:none;">회원가입</a>
        
            <!--[5-2] 아바타이미지 클릭시 - 세션에 저장된 id 있는경우 - 장바구니,포인트,마이페이지,로그아웃 메뉴 보이기 -->
            <a href="logout.do" id="btn_logout" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-white" title="로그아웃"
                  style="margin-top:3px;display:none;">
                <img src="images/exit2.png" style="margin:-10px;width:32px;" alt="LogOut">
            </a>
            <a href="mypage.do" id="btn_mypage" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-white" title="마이페이지" 
                  style="margin-top:3px;margin-right:3px;display:none;">
                <img src="images/mypage2.png" style="margin:-10px;width:32px;" alt="MyPage">
            </a>
            <a href="javascript:void(0)" id="btn_mypoint" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-white" title="MyPoint" 
                  style="margin-top:1px;display:none;" onclick="showMyPoint()">
                <img src="images/point2.png" style="margin:-10px;width:32px;" alt="Point">
                <span id="mypoint_Val" class="w3-badge w3-right w3-small w3-green" style="display:none;"></span>
            </a>
        </div>
    </div>


    <!--[*] 소형플레이어의 간소화 메뉴바 -->
    <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Blank</a>
        <a href="house_list.do" class="w3-bar-item w3-button w3-padding-large">Rental-List</a>
        <a href="mapGo.do" class="w3-bar-item w3-button w3-padding-large">Rental-Map</a>
        <a href="enrollGo.do" class="w3-bar-item w3-button w3-padding-large">Enroll</a>
        <a href="login.do" id="small_login" class="w3-bar-item w3-button w3-padding-large" style="display: none;">LOGIN</a>
        <a href="logout.do" id="small_logout" class="w3-bar-item w3-button w3-padding-large" style="display:none;">LOOUT</a>
    </div>
    
    
<script type="text/javascript">
//첫 화면 셋팅
$(document).ready(function(){
	var session_id = '${sessionScope.u_id}';
	if(!(session_id==null || session_id=="")){
		$('#btn_avatar').css("display","none");
		$('#btn_logout').css("display","inline");
		$('#btn_mypage').css("display","inline");
		$('#btn_mypoint').css("display","inline");
		$('#btn_mybag').css("display","inline");
		$('#small_logout').css("display","inline");
		$('#small_login').css("display","none");
	}else{
		$('#small_login').css("display","inline");
		$('#small_logout').css("display","none");
	}
});

//포인트 버튼 클릭 시, 클릭시점에서 세션아이디의 포인트값 가져옴
var myPointBtn = 0;
function showMyPoint(){
	if(myPointBtn == 0){	
		var session_id = '${sessionScope.u_id}';
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'mypoint.do?data='+session_id,
					success:function(res){
						$('#mypoint_Val').html(res+'p');
						$('#mypoint_Val').css("display","inline");
					},
					error:function(){
						alert("error");
					}	
		});
		myPointBtn = 1;
	}else{
		$('#mypoint_Val').css("display","none");
		myPointBtn = 0;
	}
}

//아바타버튼 클릭 시, 회원가입,로그인버튼 나타냄
function showUserOption(){
	$('#btn_avatar').css("display","none");
	$('#btn_login').css("display","inline");
	$('#btn_join').css("display","inline");
}

// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>
