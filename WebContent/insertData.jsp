<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<%
if ((String)request.getAttribute("info") == "success") { %>
    <script>
    alert("添加数据成功！"); 
   </script>

<%}%>
<script type="text/javascript">
var column=[];
$(function(){
	var key ="<%=request.getParameter("keyspace")%>"
	var tab ="<%=request.getParameter("table")%>"
	$("#form1").attr("action",address +"/visualCass/insertdata_do?keyspace="+key+"&table="+tab+"");
	$.ajax({
		url : address +"/visualCass/showdata_do?keyspace="+key+"&table="+tab+"",
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
		var sx1 = document.getElementById("wxh1")
		var sx2 = document.getElementById("wxh2")
			
		var str1 = "";
		var str2 = "";
			
		var data1 = data.columns;
			
		str1 += "<tr class='unread'>";
		$.each(data1, function(i,item) {
			column[i] = item;
			str1 += "<td>"+ item +"</td>";
		})
		str1 += "</tr>";
		sx1.innerHTML = str1;
		str2 += "<tr class='unread'>";
		$.each(data1, function(i,item) {
			str2 += "<td><input type='text' name="+i+" /></td>";
		})
		str2 += "</tr>";	
		sx2.innerHTML = str2;
		}
	})	
});
function check() {
	var data=[];
	var mt = $("#mt").find("input[type='text']");
	mt.each(function(index,e){
		data[index] = $(e).val();
	});
	$("#hidTD1").val(JSON.stringify(data));
	$("#hidTD2").val(JSON.stringify(column));
	$("#form1").submit();
	alert("提交");
}
</script>
	<div class="bodywrapper">
    <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>
    <%@ include file="basic.jsp"%>    
    <div class="centercontent">
        <div class="pageheader">
            <h1 class="pagetitle">data</h1>
            <span class="pagedesc">数据信息</span>
            <ul class="hornav">
                 <li class="current">基本信息</li>
            </ul>
        </div><!--pageheader-->
        
        <div id="contentwrapper" class="contentwrapper">
             <div id="inbox" class="subcontent">
              <form id="form1" method="post">  
                <table id="mt" cellpadding="0" cellspacing="0" border="0" class="stdtable mailinbox">
                    <thead id="wxh1">
                    </thead>
                    <tbody id="wxh2">
                    </tbody>
                </table>  
                <input id="hidTD1" type="hidden" name="strjson1" />  
                <input id="hidTD2" type="hidden" name="strjson2" />  
                <input id="sub" type="buttton" value="提交" onclick="return check()"/>
                </form>         
             </div>
             <div id="compose" class="subcontent" style="display: none">&nbsp;</div>
        </div><!--contentwrapper-->
    </div><!--centercontent-->
</div><!--bodywrapper-->

</body>
</html>
1