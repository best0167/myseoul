<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/enroll.css">

</head>	
<body>
<%-- 체크용
 usessionid:${sessionScope.u_id}
gradename:${grade}
 --%>

    <div class="wrap_enroll">
        <br>
        <h1>등록 신청서</h1>
        <br>
        <c:choose>
            <c:when test="${empty sessionScope.u_id}">
                <div class="cancel">&#8251;회원만 이용가능합니다!</div>
            </c:when>
            
            <c:when test="${grade eq '판매유저'}">
                <form name="frm_home" action="homePro.do" method="post" enctype="multipart/form-data" onsubmit="return checkRegion(this)">
                    <table style="margin:auto;">
                        <tr>
                            <th>판매자id</th>
                            <td>
                                <input type="text" name="h_uid" value="${sessionScope.u_id}" readonly>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>등록이름</th>
                            <td>
                                <select name="h_type" id="h_type">
                                    <option value="">유형선택</option>
                                    <c:forEach var="dto" items="${typeList}" varStatus="status">
                                        <option value="${status.count}">${dto.c_name}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" name="h_name" required><br>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>위치</th>
                            <td>
                        	    <input type="text" id="postcode" placeholder="우편번호">
                        		<input type="text" id="region" name="h_region" placeholder="행정구" required>
                        		
                        		
	                    		<label for="roadAddress">도로명주소 :</label>
	                    		<input type="text" class="address" id="roadAddress" name= "h_roadaddr" placeholder="주소검색을 이용해주세요" readonly required>
	                    		<input type="button" class="input_btn" id="btn_daumPost" onclick="execDaumPostcode()" value="주소 검색"><br>
	                    
	                    		<label for="jibunAddress">지번주소 &nbsp;&nbsp;: </label>
	                    		<input type="text" class="address" id="jibunAddress" name= "jibunAddress" readonly><br>
	                    		<span id="guide"></span>
	                    
	                    		<label for="detailAddress">상세주소 &nbsp;&nbsp;: </label>
	                    		<input type="text" class="address" id="detailAddress" name="h_detailaddr" placeholder="상세주소입력" required>
                    		</td>
                		</tr>
                		
                		<tr>
                    		<th>기간</th>
                    		<td>
                        		<input type="date" class="cls_date" name="h_startdate" required>
                        		<strong>~</strong>
                        		<input type="date" class="cls_date" name="h_enddate" required>
                    		</td>
                		</tr>
                		
                		<tr>
                		    <th>수용성별</th>
                		    <td>
                		        <input type="radio" name="h_gender" value="m" checked>남자 
                		        <input type="radio" name="h_gender" value="w">여자
                		    </td>
                		</tr>
                		
                		<tr>
                    		<th>수용인원</th>
                    		<td><input type="number" class="cls_number" name="h_limit" min="1" value="1" required>명</td>
                		</tr>
                		
                		<tr>
                    		<th>방개수</th>
                    		<td><input type="number" class="cls_number"  name="h_rooms" min="1" value="1" required>개</td>
                		</tr>
                		
                		<tr>
                    		<th>욕실수</th>
                    		<td><input type="number" class="cls_number"  name="h_bath" min="1" value="1" required>개</td>
                		</tr>
                		
                		<tr>
                    		<th>전체면적</th>
                    		<td>
                    		    <input type="text" class="cls_number"  name="h_area" required>
                    		    m<sup>2</sup>
                    		</td>
                		</tr>
                		
                		<tr>
                    		<th>최저가</th>
                    		<td>&#8361;.<input type="text" id="input_price" name="h_price" required></td>
                		</tr>
                		
                		<tr>
                    		<th>메인사진</th>
                    		<td>
                    		    <div class="imgBox"><div class="innerText">메인사진을 드랍하세요</div></div>
                    		    <input type="file" name="files" id="mainImg" required>
                    		</td>
                		</tr>
                		<tr>
                		    <th>추가사진</th>
                		    <td>
                		        <input type="button" class="input_btn" id="btn_add" style="width:30px;" value="+">
                		        <input type="button" class="input_btn" id="btn_minus" style="width:30px;" value="-">
                		        <sub>(최대3개까지만 가능합니다)</sub>
                		        <div id="addInputTag"></div>
                		    </td>
                		</tr>
                		
                		<tr>
                    		<th>세부설명</th>
                    		<td><textarea name="h_contents" rows="30" cols="50" style="width:500px;height:100px;resize: none;"></textarea></td>
                		</tr>
                		<tr>
                		    <td colspan="2" id="menu_result">
                		        <input type="reset" value="지우기">
                		        <input type="submit" value="제출">
                		    </td>
                		</tr>
                	</table>
            	</form>
            </c:when>
            
            <c:otherwise>
                <div class="cancel">&#8251;판매유저만 등록가능합니다!</div>
            </c:otherwise>
        </c:choose>
    </div>
    
    
    <script type="text/javascript" src="resources/js/enroll.js"></script>
</body>
</html>