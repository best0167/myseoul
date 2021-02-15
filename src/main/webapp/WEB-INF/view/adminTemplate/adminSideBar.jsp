<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s4">
                <img src="images/avatar_admin.png" class="w3-circle w3-margin-right" style="width:46px">
            </div>
            
            <div class="w3-col s8 w3-bar">
                <span>${sessionScope.u_id}, <strong>	${sessionScope.admin_name}</strong></span><br>
                <a href="#" class="w3-bar-item w3-button"><img src="images/archive.png" width="20px"/></a>
                <a href="#" class="w3-bar-item w3-button"><img src="images/admin.png" width="20px"/></a>
                <a href="logout.do" class="w3-bar-item w3-button"><img src="images/exit_b.png" width="20px"/></a>
            </div>
        </div>
        <hr>
        
        <div class="w3-container">
            <a href="admin.do"><b><i>Managemenet</i></b></a>
        </div>
        
        <div class="w3-bar-block">
            <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
            <a href="adminUserTotal.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-users fa-fw"></i>  회원관리</a>
            <a href="adminPermitEnroll.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><img src="images/man_home.png" width="19px" />  호스팅관리</a>
            <a href="adminRefund2.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><img src="images/money_off.png" width="19px">  환불관리</a>
            <a href="adminSale.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><img src="images/wallet.png" width="19px">  매출현황</a>
            <a href="noticeGo.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><img src="images/notes.png" width="19px">  공지사항</a>
            <a href="qnaGo.do" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><img src="images/pencil.png" width="19px">  QnA응답</a><br><br>
        </div>
    </nav>


<!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
    