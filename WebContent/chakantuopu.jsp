<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-3.3.1.js"></script>
<title>sx</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "http://47.103.222.181:10000/visualCass/keyspace_do",
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
			$.each(data, function(i, item) {
				alert(item.name);
			})
		}
	})
});
</script>
</body>
</html>