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
    <link rel="stylesheet" href="resources/css/adminEnroll.css">
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> House Management</b></h5>
    </header>
    <br>
    <div class="w3-container">
        <!-- <h5><b>등록대기 목록</b></h5> -->
        <div id="btn_group">
        	<button id="btn_total" onclick="location.href='adminPermitEnroll.do'">전체목록</button>
        	<button id="btn_wating" style="background-color:#535c68;color:white;">대기목록</button>
        </div>
        <form name="frm_permit" action="adminEnroll.do" method="post">
        <table>
            <tr>
                <th width="5%">No.</th>
                <th width="7%">등록번호</th>
                <th width="8%">유형</th>
                <th width="20%">등록명</th>
                <th width="20%">판매자아이디</th>
                <th width="20%">등록일</th>
                <th width="20%">승인</th>
            </tr>
            <c:forEach var="dto" items="${waitList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${dto.h_num}</td>
                    <td>
                        <c:choose>
                            <c:when test="${dto.h_type == 1}">아파트</c:when>
                            <c:when test="${dto.h_type == 2}">빌라</c:when>
                            <c:when test="${dto.h_type == 3}">상가</c:when>
                            <c:when test="${dto.h_type == 4}">오피스텔</c:when>
                            <c:when test="${dto.h_type == 5}">단독주택</c:when>
                            <c:otherwise>Err!</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${dto.h_name}</td>
                    <td>${dto.h_uid}</td>
                    <td>${dto.h_regdate}</td>
                    <td>
                        <label class="switch">
                            <input type="checkbox" id="check${dto.h_num}" name="permit" onclick="checkfunction(${dto.h_num})" value="${dto.h_num}">
                            <span class="slider round"></span>
                        </label>
                        <div class="cls_toggle" id="div_toggle${dto.h_num}" style="display:inline-block;">
                            <p>OFF</p>
                            <p style="display:none;">ON</p>
                        </div>
                    </td>
                <tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                    <input type="reset" class="btn_result" value="초기화" onclick="allOff()">
                    <input type="submit" class="btn_result" value="허가">
                </td>
            </tr>
        </table>
        </form>
        
        <br>

    </div>
    
    <script type="text/javascript" src="resources/js/adminEnroll.js"></script>
</body>
</html>