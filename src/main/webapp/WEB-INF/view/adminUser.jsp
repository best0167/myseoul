<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/adminUser.css">
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> USER Management</b></h5>
    </header>
    <br>
    <div class="w3-container">
        <div id="btn_group">
        	<button id="btn_total" onclick="location.href='adminUserTotal.do'">전체목록</button>
        	<button id="btn_wating" style="background-color:#535c68;color:white;">대기목록</button>
        </div>

        <form name="frm_permit" action="adminUser.do" method="post">
        <table>
            <tr>
                <th width="2%">No.</th>
                <th width="6%">아이디</th>
                <th width="5%">국적</th>
                <th width="10%">이름</th>
                <th width="14%">연락처</th>
                <th width="10%">법인명</th>
                <th width="10%">대표자</th>
                <th width="15%">사업자등록번호</th>
                <th width="14%">신청일</th>
                <th width="14%">승인</th>
            </tr>
            <c:forEach var="dto" items="${waitList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${dto.id}</td>
                    <td>${dto.nation}</td>
                    <td>${dto.name}</td>
                    <td>${dto.phone}</td>
                    <td>${dto.corpor}</td>
                    <td>${dto.ceo}</td>
                    <td>${dto.sellnum}</td>
                    <td>${dto.regdate}</td>
                    <td>
                        <label class="switch">
                            <input type="checkbox" id="check_${dto.id}" name="permit" onclick="checkfunction('${dto.id}')" value="${dto.id}"/>
                            <span class="slider round"></span>
                        </label>
                        <div class="cls_toggle" id="div_toggle_${dto.id}" style="display:inline-block;">
                            <p>OFF</p>
                            <p style="display:none;">ON</p>
                        </div>
                    </td>
                <tr>
            </c:forEach>
            <tr>
                <td colspan="9">
                    <input type="reset" class="btn_result" value="초기화" onclick="allOff()">
                    <input type="submit" class="btn_result" value="허가">
                </td>
            </tr>
        </table>
        </form>        
        
        <br>

    </div>
    
    
    <script type="text/javascript" src="resources/js/adminUser.js"></script>
</body>
</html>