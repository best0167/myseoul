<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- !PAGE CONTENT! -->
    
    <!-- Header -->
    <!-- <input type="button" value="click to toggle fullscreen" onclick="toggleFullScreen(document.body)"> -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> Dashboard</b></h5>
    </header>

    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-quarter">
            <div class="w3-container w3-green w3-padding-16">
                <div class="w3-left"><img src="images/pencil_w.png" width="50px"/></div>
                <div class="w3-right">
                <h3>${indexInfo.qna_noAns}</h3>
                </div>
            
                <div class="w3-clear"></div>
                <h4>문의사항</h4>
            </div>
        </div>
        
        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16">
                <div class="w3-left"><img src="images/man_home_w.png" width="50px"/></div>
                <div class="w3-right">
                <h3>${indexInfo.house_cnt}</h3>
                </div>
                
                <div class="w3-clear"></div>
                <h4>쉐어링</h4>
            </div>
        </div>
    
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-text-white w3-padding-16">
                <div class="w3-left"><img src="images/seller_w.png" width="50px"/></div>
                <div class="w3-right">
                <h3>${indexInfo.seller_cnt}</h3>
                </div>
        
                <div class="w3-clear"></div>
                <h4>판매유저</h4>
            </div>
        </div>
        
        <div class="w3-quarter">
            <div class="w3-container w3-orange w3-text-white w3-padding-16">
                <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                <div class="w3-right">
                <h3>${indexInfo.buyer_cnt}</h3>
                </div>
        
                <div class="w3-clear"></div>
                <h4>일반유저</h4>
            </div>
        </div>
    </div>

    <hr>
    
    <!-- 대기중인 인원 -->
    <div class="w3-container">
        <h5><b>대기 현황</b></h5>
        
        <div style="width:177px;height:52px;padding-left:25px;background-color:#6ab04c;float:left;">
            <div class="inner" style="width:170px;height:50px;float: right;padding-right:7px;">
                <img src="images/add_user.png" width="50px">
                <span style="font-size:15px;color: white;">
                    <a href="adminUser.do" style="text-decoration: none;">판매회원전환</a>
                </span>
                <span class="w3-badge w3-right w3-small w3-red " id="blinkEle1" style="margin-left:-17px;margin-top:5px;">
                    +${indexInfo.wait_seller}
                </span>
            </div>
        </div>
        
        <div style="width:177px;height:52px;padding-left:25px;background-color:#22a6b3;float:left;margin-left:30px;">
            <div class="inner" style="width:170px;height:50px;padding-top:5px;float:right;padding-right:7px;">
                <img src="images/add_home.png" style="margin-left:10px;" width="40px">
                <span style="font-size:15px;color:white;margin-left:5px;">
                    <a href="adminEnroll.do" style="text-decoration: none;">집등록대기중</a>
                </span>
                <span class="w3-badge w3-right w3-small w3-red" id="blinkEle2" style="margin-left:-17px;">
                    +${indexInfo.wait_enroll}
                </span>
            </div>
        </div>
        
        <div style="width:177px;height:52px;padding-left:25px;background-color:#f0932b;float:left;margin-left:30px;">
            <div class="inner" style="width:177px;height:50px;padding-top:5px;float:right;padding-right:7px;">
                <img src="images/add_refund.png" style="margin-left:10px;" width="40px">
                <span style="font-size:15px;color:white;margin-left:5px;">
                    <a href="adminRefund.do" style="text-decoration: none;">환불신청대기</a>
                </span>
                <span class="w3-badge w3-right w3-small w3-red" id="blinkEle3" style="margin-left:-17px;">
                    +${indexInfo.wait_refund}
                </span>
            </div>
        </div>
    </div>
    
     <hr>
     
    <!-- General Stats -->  
    <div class="w3-container">
        <h5><b>추이</b></h5>
        
        <p>New Visitors</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-green" style="width:${indexInfo.visitor_rate}%">+${indexInfo.visitor_rate}&#37;</div>
        </div>

        <p>New Users</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-orange" style="width:${indexInfo.user_rate}%">+${indexInfo.user_rate}&#37;</div>
        </div>

        <p>Accumulate visitors</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-red" style="width:100%">${indexInfo.visitor_acc} visitors</div>
        </div>
    </div>
    
    <hr>
    
    <!-- Countries -->
    <div class="w3-container">
        <h5><b>국가</b></h5>
    
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
            <tr>
                <td>Korea</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.kr}" pattern=".00" />&#37;
                </td>
            </tr>
        
            <tr>
                <td>North of America</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.na}" pattern=".00" />&#37;
                </td>
            </tr>
      
            <tr>
                <td>China</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.cn}" pattern=".00" />&#37;
                </td>
            </tr>
      
            <tr>
                <td>Japan</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.jp}" pattern=".00" />&#37;
                </td>
            </tr>
            
            <tr>
            	<td>France</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.fr}" pattern=".00"/>&#37;
                </td>
            </tr>
        
            <tr>
                <td>Canada</td>
                <td>
                	<fmt:formatNumber value="${indexInfo.can}" pattern=".00"/>&#37;
                </td>
            </tr>
        </table><br>
        <button class="w3-button w3-dark-grey">More Countries  <i class="fa fa-arrow-right"></i></button>
    </div>

<!-- End page content -->
<script>
$(document).ready(function(){
		
	if(${indexInfo.wait_seller != 0}){
		setInterval(function(){
			$("#blinkEle1").toggle();
		},500);
	}
	
	if(${indexInfo.wait_enroll != 0}){
		setInterval(function(){
			$("#blinkEle2").toggle();
		},500);
	}
	
	if(${indexInfo.wait_refund != 0}){
		setInterval(function(){
			$("#blinkEle3").toggle();
		},500);
	}
	
});

//function toggleFullScreen(elem) {
//    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
/*
		if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
        if (elem.requestFullScreen) {
            elem.requestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        } else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    }
}
 */
</script>