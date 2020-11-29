<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>集群状态</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<script type="text/javascript">
$(function(){
	var ips = new Array();
	var addr = address + "/visualCass/nodestate_do";
	
	$.ajax({
		url : addr,
		dataType : "json",
		type : "POST",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
			var sx = document.getElementById("wxh")
			
			var str = "";
			$.each(data, function(i, item) {
				if(item.state == "1"){
				str += "<tr class='unread'>" + 
            	"<td><a class='msgstar starred'></a></td>" +
            	"<td>"+ item.ip +"</td>" +
                "</tr>"					
				}else{
				str += "<tr class='unread'>" + 
	            "<td><a class='msgstar'></a></td>" +
	            "<td>"+ item.ip +"</td>" +
	             "</tr>"		
				}
			})
			sx.innerHTML = str;
		}
	})
});
</script>
<div class="bodywrapper">
    <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>
	<%@ include file="basic.jsp" %>
        
    <div class="centercontent">
    
        <div class="pageheader">
            <h1 class="pagetitle">集群节点状态信息</h1>

        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
             
             <div id="inbox" class="subcontent">
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable mailinbox">
                    <thead>
                    <tr>
                        <th class="head0">节点状态</th>
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
