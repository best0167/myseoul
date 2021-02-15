<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	if(confirm("등록 허가를 취소할까요?")) {
		alert('등록이 취소 되었습니다.')
		location.href = 'cancelPermitEnroll.do?h_num='+'${h_num}';
	} else {
		location.href = window.history.go(-1);
	}
</script>