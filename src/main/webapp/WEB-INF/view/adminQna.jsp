<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
	<style type="text/css">
	.pagelist a{
   text-decoration: none;
   color: black;
   font-size: 25px;
}
.pagelist a:hover, 
.pagelist .pagecolor{
   text-decoration: underline;
   color: red;
}
p.a{
	font-family: 'Trade Winds', cursive;

}
h1 {
font-family: 'Nanum Brush Script', cursive;

}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
    //$('#searchBtn').on('click', function(){});   
    var checkUser = '${sessionScope.u_id}';
    var checkAdmin = '${sessionScope.admin_name}';
    if(checkUser == '' || checkUser==null){
    	//비회원(비로그인)일때
    	$('#button').css('display','none');
    	$('#emptyUser').css('display','inline-block');
    }else if(checkAdmin == '' || checkAdmin == null){
    	//회원(로그인시)일때
    	$('#button').css('display','inline-block');
    	$('#emptyUser').css('display','none');
    }else{
    	//관리자일때
    	$('#button').css('display','none');
    	$('#emptyUser').css('display','none');
    }
    
    $('#searchBtn').click(function(){
       if($('select[name=searchKey]').val()=='all'){
          alert('검색 필터를 선택하세요');
          return false;
       }
       
       if($('input[name=searchWord]').val()==''){
          alert('검색어를 입력하세요.');
          return false;
       }
       
       $('#search').attr('action', 'qnaGo.do');
       $('#search').submit();
       
    });//////////////
    
    	if('${! empty pv.searchKey}'){
    		$.each($('select[name=searchKey] option'),function(index, element){
    			if($(element).val()=='${pv.searchKey}'){
    				$(this).prop('selected','selected');
    			}
    		});
    		$('input[name=searchWord]').val('${pv.searchWord}');
    	}///////검색하고 나서 검색어가 사라지지 않은 기능
    
 });//end
</script>
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> QnA Management</b></h5>
    </header>
    <br>
    <div class="w3-container">
        <form id="search">
		<select name="searchKey"class="selectpicker" style="height:30px">
			<option value="all">전체</option>
			<option value="q_title">제목</option>
			<option value="q_uid">글쓴이</option>
		</select>
		<input type="text" name="searchWord"/>
		<input type="button" value="검색" id="searchBtn"class="btn btn-default"/>
	</form>
	
	<div id="boardwrap">
	<table class="table table-striped">
		<tr>
			<th width="5%">NO.</th>
			<th width="35%">제목</th>
			<th  width="20%">아이디</th>
			<th width="10%">조회수</th>
			<th width="20%">날짜</th>
			<th width="7%" align="center">파일</th>
		</tr>
		
		<c:forEach items="${aList}" var="dto">
		<tr>
			<td align="center">${dto.q_num}</td>
			<td>
			<c:url var="path" value="view.do">
				<c:param name="q_num" value="${dto.q_num}"/>
				<c:param name="currentPage" value="${pv.currentPage}"/>
				<c:param name="searchKey" value="${pv.searchKey}"/>
				<c:param name="searchWord" value="${pv.searchWord}"/>
		</c:url>
	<c:if test="${dto.q_relevel!=0}">
		 <img src="images/level.gif" height= "15" width="${dto.q_relevel*20}">
		<img src="images/re.gif"/> 
	</c:if>
	
	<a href="${path}">${dto.q_title}</a></td>
	<td>${dto.q_uid}	</td>
	<td align="center">${dto.q_readcnt}</td>
	<td>${dto.q_regdate}</td>
	
	  <%-- <c:if test="${dto.q_image!=null}">
	<td align="center"><img src="images/save.gif"></td>
	</c:if>   --%>
	<c:choose>
	<c:when test="${dto.q_image!=null}">
	<td align="center"><img src="images/save.gif"></td>
	</c:when>
	<c:otherwise>
	<td align="center">         </td>
	</c:otherwise>
	</c:choose>
	</tr>
	</c:forEach>
	<tr>
	<td colspan="6" align='center'><p class="a">Man maketh manner</p></td>
	</tr> 
	</table> 
		 <div class="pagelist" align="center">
		<br/>
		<!-- 이전 출력 시작-->
		 <c:if test="${pv.startPage>1 }">
			<a href="list.do?currentPage=${pv.startPage-pv.blockPage}">◁</a>
						
		</c:if> 
		
	<!--  d이전 출력 끝 -->
	<!-- 페이지 출력 시작 -->
       <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">   
         <span>
            <c:url var="currPage" value="qnaGo.do">
               <c:param name="currentPage" value="${i}"/>
               <c:param name="searchKey" value="${pv.searchKey}"/>
               <c:param name="searchWord" value="${pv.searchWord}"/>
            </c:url>
            <c:choose>
               <c:when test="${i==pv.currentPage}">
                  <a href="${currPage}" class="pagecolor">
                  <c:out value="${i}"/></a>
               </c:when>
               <c:otherwise>
                  <a href="${currPage}"><c:out value="${i}"/></a>
               </c:otherwise>
            </c:choose>
            </span>
      </c:forEach> 
   <!-- 페이지 출력 끝 -->
	<!-- 다음 출력 시작 -->
	 <c:if test="${pv.endPage<pv.totalPage}">
		<a href="list.do?currentPage=${pv.startPage+pv.blockPage}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}">▶</a>	
	</c:if> 
	<!-- 다음 출력 끝 -->
	 </div> 	
		
		<br>
	<div align="center">
	<form id="frm" name="frm" method="get" action="write.do">
		<input type="submit" id="button" value="글쓰기"class="btn btn-success">
		<span id="emptyUser" style="color:red;display:none;">회원만 글쓰기 가능합니다!</span> 
	</form>
	
	</div>
	</div>
    </div>
</body>
</html>