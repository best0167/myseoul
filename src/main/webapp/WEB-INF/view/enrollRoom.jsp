<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/enrollRoom.css">
</head>
<body>
    <div class="wrap_enroll">
    <br>
        <h1>등록 신청서</h1>
    <br>
    <form name="frm_rooms" action="roomPro.do" method="post" enctype="multipart/form-data">
        <c:forEach var="index" begin="0" end="${dto.h_rooms-1}" >
            <fieldset>
                <legend>${index+1}번방</legend>
                <details>
                    <summary onclick="changeSpan(${index})">
                        <span id="closed${index}"><img alt="화살표" src="images/summary_down.png" width=35px;>작성하기</span>
                        <span id="opened${index}" style="display:none;"><img alt="화살표" src="images/summary_up.png">접기</span>
                    </summary>
                    <div>
                        <input type="text" class="cls_none" name="roomDtoList[${index }].r_pid" value="${dto.h_uid}">
                        <input type="text" class="cls_none" name="roomDtoList[${index }].r_hnum" value="${dto.h_num}">
                        <input type="date" class="cls_none" name="roomDtoList[${index }].r_startdate" value="${dto.h_startdate}">
                        <input type="date" class="cls_none" name="roomDtoList[${index }].r_enddate" value="${dto.h_enddate}">
                        
                        <table>
                            <tr>
                                <th>방이름</th>
                                <td>
                                    <input type="text" name="roomDtoList[${index }].r_name" required>
                                </td>
                            </tr>
                    
                            <tr>
                                <th>방면적</th>
                                <td>
                                    <input type="text" class="cls_number" name="roomDtoList[${index }].r_area" required>m<sup>2</sup>
                                </td>
                            </tr>
                    
                            <tr>
                                <th>화장실 유무</th>
                                <td>
                                    <input type="radio" name="roomDtoList[${index }].r_bath" value="n" checked>없음&nbsp;
                                    <input type="radio" name="roomDtoList[${index }].r_bath" value="y">있음
                                </td>
                            </tr>
                    
                            <tr>
                                <th>방 단위가격</th>
                                <td>
                                    &#8361;.<input type="text" class="cls_price" name="roomDtoList[${index }].r_price" required>
                                </td>
                            </tr>
                    
                            <tr>
                                <th>방 사진</th>
                                <td>
                                    <input type="button" class="input_btn" onclick="addInput(${index})" value="+">
                		            <input type="button" class="input_btn" onclick="delInput(${index})" value="-"><br>
                                    <div id="addInputTag${index}">
                                        <input type="file" name="roomPicsDtoList[${index}].files" accept='image/jpeg' required><br>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </details>
            </fieldset>
        </c:forEach>
        <div id="menu_result">
            <input type="reset" value="지우기">
            <input type="button" value="제출" onclick="send()">
        </div>
    </form>
    </div>
    
    
<script type="text/javascript" src="resources/js/enrollRoom.js"></script>
</body>
</html>