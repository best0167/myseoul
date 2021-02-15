<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	if(confirm("삭제할까요?")) {
		alert('삭제되었습니다.')
		location.href = 'adminEnroll_delete.do?h_num='+'${h_num}';
	} else {
		location.href = window.history.go(-1);
	}
</script>