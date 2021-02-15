<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
if(confirm("삭제할까요?")){
	var url = 'adminUserDelete.do?u_id='+'${u_id}';
	location.href= url;
} else{
	alert('취소하셨습니다.')
	location.href=window.history.go(-1);
}
</script>
