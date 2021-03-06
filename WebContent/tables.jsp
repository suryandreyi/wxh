<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/loaders.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<style>
.loader {
	margin-bottom: 50px;
	min-height: 100px;
	margin-left: 800px;
}
</style>
<script type="text/javascript">
$(function(){
	var key = "<%=request.getAttribute("keyspace")%>";
	var addr = address+"/visualCass/table_do";
	var href = address+"/visualCass/insert_do?type=table&key="+key;
	$("#add").attr("href",href);
	$.ajax({
		url : addr+"?keyspace="+key+"",
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
			var sx = document.getElementById("wxh");
			var str = "";
			$.each(data, function(i, item) {
				$.each(item, function(m, n) {
					str += "<tr class='unread'>" + 
					"<td align='center'><input type='checkbox'/></td>" +
					"<td><a href='"+address+"/visualCass/tabtodata_do?keyspace="+i+"&table="+n+"' class='title'>"+ n +"</a></td>" +
					"<td>"+ m +"</td>" +
					"</tr>"
					})
			})
					sx.innerHTML = str;
			$("#inbox").css('display', 'block');
			$("#loader").css('display', 'none');
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
            <h1 class="pagetitle">表格</h1>
            <ul class="hornav">
                 <li class="current"><a>基本信息</a></li>
                 <a href="" class="btn btn2 btn_book" id="add"><span>添加</span></a>
                 <a href="http://47.103.222.181:10000/visualCass/insert_do?type=keyspace" class="btn btn2 btn_book"><span>删除</span></a>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
            <div class="loaders" id="loader"
				style="width: 1000px; height: 1000px;" style="display:block">
				<div class="loader">
					<div class="loader-inner ball-clip-rotate-pulse"
						style="margin-bottom: 200px;">
						<div></div>
						<div></div>
					</div>
				</div>
			</div>
   
             <div id="inbox" class="subcontent" style="display:none">
                
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable mailinbox">
                    <colgroup>
                        <col class="con0" style="width: 4%" />
                        <col class="con1" />
                        <col class="con0" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="head0"><input type="checkbox" class="checkall" /></th>
                        <th class="head0">表名称</th>
                        <th class="head1">描述信息</th>
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
