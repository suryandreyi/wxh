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
<%@ include file="basic.jsp" %>
<script type="text/javascript">
$(function(){
	var ips = new Array();
	$.ajax({
		url : "http://47.103.222.181:10000/visualCass/select_do",
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
			var sx = document.getElementById("wxh")
			
			var str = "";
			$.each(data, function(i, item) {
				str += "<tr class='unread'>" + 
            	"<td><a class='msgstar starred'></a></td>" +
            	"<td>"+ item.ip +"</td>" +
                "</tr>"
			})
			sx.innerHTML = str;
		}
	})
});
</script>
<div class="bodywrapper">
    <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>
        
    <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">安全配置</h1>
            <span class="pagedesc">安全配置信息</span>

        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
             
             <div id="inbox" class="subcontent">
             
                <div class="msghead">
                    <ul class="msghead_menu">
                        <li><a class="reportspam">Report Spam</a></li>
                        <li class="marginleft5 dropdown" id="actions">
                            <a class="dropdown_label" href="#actions">
                            Actions
                            <span class="arrow"></span>
                            </a>
                            <ul>
                                <li><a href="">Mark as Read</a></li>
                                <li><a href="">Mark as Unread</a></li>
                                <li><a href="">Move to Folder</a></li>
                                <li><a href="">Add Star</a></li>
                            </ul>
                        </li>
                    </ul>
                    <span class="clearall"></span>
                </div><!--msghead-->
                
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable mailinbox">
                    <thead>
                    <tr>
                        <th class="head0">是否开启ipsec</th>
                        <th class="head1">节点</th>
                    </tr>
                    </thead>
                    <tbody id="wxh">
                    </tbody>
                </table>             
             </div>
             <div id="compose" class="subcontent" style="display: none">&nbsp;</div>
        </div><!--contentwrapper-->
    </div><!--centercontent-->
</div><!--bodywrapper-->

</body>
</html>
