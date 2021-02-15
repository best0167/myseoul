<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
    <%-- <h5><del>(체크용)세션아이디:${sessionScope.u_id}</del></h5> --%>
    
    <!-- 별점순 Section -->
    <div class="section_subject">
        <h3 class="w3-border-bottom w3-border-grey w3-padding-16">
        	<strong>Top 4.</strong>
        	<span class="standard">별점순</span>
        </h3>
    </div>

     <div class="section_container wrap_contents">
     <table>
     	<tr>
        	<c:forEach var="stars" items="${starRank}" varStatus="status">
        		<td class="td_rank" background="${stars.h_mainPic}">
        			<div class="top_list" style="display:inline-block;" onclick="location.href='housedetail.do?h_num=${stars.h_num}';">
        				<div class="w3-display-container">
        					<div class="w3-display-topleft w3-black w3-padding">${status.count}.${stars.h_name}</div>
                			<img src="images/rankBorder.png" alt="이미지" style="width:100%;">
            			</div>
            		</div>
            	</td>
        	</c:forEach>
        </tr>
        <tr>
        	<c:forEach var="star_val" items="${starRank}" varStatus="status">
        		<td>
        			<div class="rank_info">
        			<span class="rank_info_left">
        				<c:choose>
        					<c:when test="${star_val.h_type==1}">아파트</c:when>
        					<c:when test="${star_val.h_type==2}">빌라</c:when>
        					<c:when test="${star_val.h_type==3}">상가</c:when>
        					<c:when test="${star_val.h_type==4}">오피스텔</c:when>
        					<c:when test="${star_val.h_type==5}">주택</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>&#47;${star_val.h_region}&#47;
        				<c:choose>
        					<c:when test="${star_val.h_gender=='m'}">男</c:when>
        					<c:when test="${star_val.h_gender=='w'}">女</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>
        			</span>
        			<span class="rank_info_right">
        				<i class="fas fa-star" style="font-size:20px;color:#fed330;"></i> &#40;${star_val.h_stars}&#41;
        			</span>
        			</div>
        		</td>
        	</c:forEach>
        </tr>
    </table>
    </div>
    
    <br>
    
    <!-- 조회순 Section -->
    <div class="section_subject">
        <h3 class="w3-border-bottom w3-border-grey w3-padding-16">
        	<strong>Top 4.</strong>
        	<span class="standard">조회순</span>
        </h3>
    </div>
    
    <div class="section_container wrap_contents">
     <table>
     	<tr>
        	<c:forEach var="read" items="${readRank}" varStatus="status">
        		<td class="td_rank" background="${read.h_mainPic}">
        			<div class="top_list" style="display:inline-block;" onclick="location.href='housedetail.do?h_num=${read.h_num}';">
        				<div class="w3-display-container">
        					<div class="w3-display-topleft w3-black w3-padding">${status.count}.${read.h_name}</div>
                			<img src="images/rankBorder.png" alt="이미지" style="width:100%;">
            			</div>
            		</div>
            	</td>
        	</c:forEach>
        </tr>
        <tr>
        	<c:forEach var="read_val" items="${readRank}" varStatus="status">
        		<td>
        			<div class="rank_info">
        			<span class="rank_info_left">
        				<c:choose>
        					<c:when test="${read_val.h_type==1}">아파트</c:when>
        					<c:when test="${read_val.h_type==2}">빌라</c:when>
        					<c:when test="${read_val.h_type==3}">상가</c:when>
        					<c:when test="${read_val.h_type==4}">오피스텔</c:when>
        					<c:when test="${read_val.h_type==5}">주택</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>&#47;${read_val.h_region}&#47;
        				<c:choose>
        					<c:when test="${read_val.h_gender=='m'}">男</c:when>
        					<c:when test="${read_val.h_gender=='w'}">女</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>
        			</span>
        			<span class="rank_info_right">
        				<i class="fas fa-mouse" style="font-size:20px;color:#303952;"></i> &#40;${read_val.h_readcnt}&#41;
        			</span>
        			</div>
        		</td>
        	</c:forEach>
        </tr>
    </table>
    </div>
    
    <br>
    
    <!-- 최신순 Section -->
    <div class="section_subject">
        <h3 class="w3-border-bottom w3-border-grey w3-padding-16">
        	<strong>Top 4.</strong>
        	<span class="standard">최신순</span>
        </h3>
    </div>
    
    <div class="section_container wrap_contents">
     <table>
     	<tr>
        	<c:forEach var="reg" items="${regRank}" varStatus="status">
        		<td class="td_rank" background="${reg.h_mainPic}">
        			<div class="top_list" style="display:inline-block;" onclick="location.href='housedetail.do?h_num=${reg.h_num}';">
        				<div class="w3-display-container">
        					<div class="w3-display-topleft w3-black w3-padding">${status.count}.${reg.h_name}</div>
                			<img src="images/rankBorder.png" alt="이미지" style="width:100%;">
            			</div>
            		</div>
            	</td>
        	</c:forEach>
        </tr>
        <tr>
        	<c:forEach var="reg_val" items="${regRank}" varStatus="status">
        		<td>
        			<div class="rank_info">
        			<span class="rank_info_left">
        				<c:choose>
        					<c:when test="${reg_val.h_type==1}">아파트</c:when>
        					<c:when test="${reg_val.h_type==2}">빌라</c:when>
        					<c:when test="${reg_val.h_type==3}">상가</c:when>
        					<c:when test="${reg_val.h_type==4}">오피스텔</c:when>
        					<c:when test="${reg_val.h_type==5}">주택</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>&#47;${reg_val.h_region}&#47;
        				<c:choose>
        					<c:when test="${reg_val.h_gender=='m'}">男</c:when>
        					<c:when test="${reg_val.h_gender=='w'}">女</c:when>
        					<c:otherwise>오류</c:otherwise>
        				</c:choose>
        			</span>
        			<span class="rank_info_right">
        				<i class="far fa-calendar-alt" style="font-size:20px;color:#ee5253;"></i> &#40;${reg_val.h_regdate}&#41;
        			</span>
        			</div>
        		</td>
        	</c:forEach>
        </tr>
    </table>
    </div>
    
    <br/><br/>
    
</body>
</html>