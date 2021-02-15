<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/mypage_seller_upMyHosting.css">
</head>
<body>
	<h1>내 호스팅 관리</h1>
	<hr>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">
  		<span class="close">&times;</span>
  		<img class="modal-content" id="img01">
  		<div id="caption"></div>
	</div>
	<!-- The Modal -->
	
<div class="tab_container">
	<ul class="tabs">
		<li class="tab-link current" id="tab_house" data-tab="tab-1">${houseDTO.h_name}</li>
		<c:forEach var="room" items="${RoomList}" varStatus="status">
			<li class="tab-link tab_room" data-tab="tab-${status.count+1}">${room.r_name}</li>
		</c:forEach>
	</ul>

	<div id="tab-1" class="tab-content current">
		<h3>House</h3>
		<form name="frm_house" method="post" enctype="multipart/form-data">
			<input type="text" id="hnum" name="h_num" value="${houseDTO.h_num}">
			<table class="table">
				<tr>
					<th>등록 이름</th>
					<td>
						<input type="text" name="h_name" value="${houseDTO.h_name}" required>
					</td>
				</tr>
				<tr>
					<th>등록주소</th>
					<td>
						<input type="text" id="postcode" placeholder="우편번호">
                        <input type="text" id="region" name="h_region" value="${houseDTO.h_region}" required>
                        <input type="button" class="input_btn" id="btn_daumPost" onclick="execDaumPostcode()" value="주소 검색"><br>
	                    
	                    <label for="roadAddress">도로명주소 :</label>
	                    <input type="text" class="address" id="roadAddress" name= "h_roadaddr"  value="${houseDTO.h_roadaddr}" readonly required><br>
	                    <input type="text" class="address" id="jibunAddress" name= "jibunAddress" readonly>
	                    <span id="guide"></span>
	                    <label for="detailAddress">상세주소 &nbsp;&nbsp; : </label>
	                    <input type="text" class="address" id="detailAddress" name="h_detailaddr" value="${houseDTO.h_detailaddr}" required>
					</td>
				</tr>
				<tr>
					<th>수용인원</th>
					<td><input type="number" class="cls_number" name="h_limit" min="1" value="${houseDTO.h_limit}" required></td>
				</tr>
				<tr>
					<th>욕실수</th>
					<td><input type="number" class="cls_number" name="h_bath" min="1" value="${houseDTO.h_bath}" required></td>
				</tr>
				<tr>
					<th>최저가격</th>
					<td>
						<input type="text" id="input_price" name="h_price" value="${houseDTO.h_price}" required>원
					</td>
				</tr>
				<tr>
					<th>세부사항</th>
					<td>
						<textarea name="h_contents" rows="30" cols="50" style="width:500px;height:100px;resize: none;">${houseDTO.h_contents}</textarea>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<div><small>&#8251;메인사진은 삭제가 불가능합니다</small></div>
						<c:forEach var="hPicDTO" items="${housePics}" varStatus="rstatus">
							<img class="review_img" src="${hPicDTO.hp_dir}" width="30px" height="30px" style="border: 1px solid black;"/> &rarr; 
							<input type="radio" name="housePicsDtoList[${rstatus.index}].hp_option" onclick="showInput(${rstatus.count},'off');" value="no" checked>변경안함&nbsp;
							<input type="radio" name="housePicsDtoList[${rstatus.index}].hp_option" onclick="showInput(${rstatus.count},'on');" value="change" >변경&nbsp;
							<input type="radio" name="housePicsDtoList[${rstatus.index}].hp_option" onclick="showInput(${rstatus.count},'off');" value="delete" >삭제&nbsp;
							<div id="inputFile[${rstatus.count}]" style="display:none;margin-left:50px;">
								<input type="file" name="housePicsDtoList[${rstatus.index}].hfile" />
							</div>
							<br>
							<input type="text" name="housePicsDtoList[${rstatus.index}].hp_num" value="${hPicDTO.hp_num}" style="display:none;">
							<input type="text" name="housePicsDtoList[${rstatus.index}].hp_hnum" value="${hPicDTO.hp_hnum}" style="display:none;">
							<input type="text" name="housePicsDtoList[${rstatus.index}].hp_dir" value="${hPicDTO.hp_dir}" style="display:none;">
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button type="button" class="btn btn-primary" id="submit_house">수정</button>
						<button type="button" class="btn btn-danger goBack">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<c:forEach var="roomDTO" items="${RoomList}" varStatus="status">
		<div id="tab-${status.count+1}" class="tab-content">
			<h3>Room</h3>
			<form name="frm_room${status.count}" id="frm_room${status.count}" method="post" enctype="multipart/form-data">
				<input type="text" id="rnum" name="r_num" value="${roomDTO.r_num}">
				<input type="text" id="rhnum" name="r_hnum" value="${roomDTO.r_hnum}">
				<table class="table">
					<tr>
						<th>등록 이름</th>
						<td>
							<input type="text" name="r_name" value="${roomDTO.r_name}" required>
						</td>
					</tr>
					<tr>
						<th>방 면적</th>
						<td>
							<input type="text" class="cls_number"  name="r_area" value="${roomDTO.r_area}" required>
                    		    m<sup>2</sup>
						</td>
					</tr>
					<tr>
						<th>욕실 유무</th>
						<td>
							<c:if test="${roomDTO.r_bath == 'n'}">
								<input type="radio" name="r_bath" value="n" checked>없음&nbsp;
                            	<input type="radio" name="r_bath" value="y">있음
							</c:if>
							<c:if test="${roomDTO.r_bath == 'y'}">
								<input type="radio" name="r_bath" value="n">없음&nbsp;
                            	<input type="radio" name="r_bath" value="y" checked>있음
							</c:if>
						</td>
					</tr>
					<tr>
						<th>단위 가격</th>
						<td>
							<input type="text" id="input_price" name="r_price" value="${roomDTO.r_price}" required>
						</td>
					</tr>
					<tr>
						<th>사진</th>
						<td>
							<div><small>&#8251;메인사진은 삭제가 불가능합니다</small></div>
							<c:forEach var="rPicDTO" items="${roomPics[status.index]}" varStatus="rstatus">
								<img class="review_img" src="${rPicDTO.rp_dir}" width="30px" height="30px" style="border: 1px solid black;"/> &rarr; 
								<input type="radio" name="roomPicsDtoList[${rstatus.index}].rp_option" onclick="showRput(${rstatus.count},'off');" value="no" checked>변경안함&nbsp;
								<input type="radio" name="roomPicsDtoList[${rstatus.index}].rp_option" onclick="showRput(${rstatus.count},'on');" value="change" >변경&nbsp;
								<input type="radio" name="roomPicsDtoList[${rstatus.index}].rp_option" onclick="showRput(${rstatus.count},'off');" value="delete" >삭제&nbsp;
								<div id="RputFile[${rstatus.count}]" style="margin-left:50px;">
									<input type="file" name="roomPicsDtoList[${rstatus.index}].rfile" />
								</div>
							<br>
							<input type="text" name="roomPicsDtoList[${rstatus.index}].rp_num" value="${rPicDTO.rp_num}" style="display:none;">
							<input type="text" name="roomPicsDtoList[${rstatus.index}].rp_hnum" value="${rPicDTO.rp_hnum}" style="display:none;">
							<input type="text" name="roomPicsDtoList[${rstatus.index}].rp_rnum" value="${rPicDTO.rp_rnum}" style="display:none;">
							<input type="text" name="roomPicsDtoList[${rstatus.index}].rp_dir" value="${rPicDTO.rp_dir}" style="display:none;">
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<button type="button" class="btn btn-primary" onclick="roomSubmit(${status.count})">수정</button>
							<button type="button" class="btn btn-danger goBack">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</c:forEach>

</div>
	
<script type="text/javascript" src="resources/js/mypage_seller_upMyHosting.js"></script>
</body>
</html>