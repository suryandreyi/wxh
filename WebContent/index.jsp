<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>

<body class="withvernav">
<script type="text/javascript">
var column=[];
$(function(){
	$.ajax({
		url : "http://47.103.222.181:10000/visualCass/index_do",
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) {
		}
	})	
});
</script>
<div class="bodywrapper">
    <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>  
    <div class="centercontent">
        <div class="pageheader">
            <h1 class="pagetitle">控制台</h1>
            <span class="pagedesc">页面的描述内容</span>
        </div><!--pageheader-->
        <br clear="all" />
	</div><!-- centercontent -->
</div><!--bodywrapper-->
</body>
</html>