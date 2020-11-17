<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/loaders.css" type="text/css" />
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
	var key = "<%=request.getAttribute("keyspace")%>"
	var tab = "<%=request.getAttribute("table")%>"
	var href = address + "/visualCass/insert_do?type=Data&keyspace="+ key + "&table=" + tab + "";
	$("#add").attr("href", href);
	$.ajax({
			url : address + "/visualCass/showdata_do?keyspace="+ key + "&table=" + tab + "",
			dataType : "json",
			type : "post",
			async : false,
			success : function(data) { //如果请求成功，返回数据。
				var sx1 = document.getElementById("wxh1");
				var sx2 = document.getElementById("wxh2");
				var str1 = "";
				var str2 = "";
				var data1 = data.columns;
				var data2 = data.rowdatas;
				str1 += "<tr class='unread'>";
				str1 += "<th class='head0'><input type='checkbox' class='checkall'/></th>";
				$.each(data1, function(i, item) {
					str1 += "<th>" + item + "</th>";
				})
				str1 += "</tr>";
				sx1.innerHTML = str1;
				$.each(data2,function(i, item) {
					str2 += "<tr class='unread'>";
					str2 += "<td align='center'><input type='checkbox'/></td>";
					$.each(item, function(i, item) {
						str2 += "<td>" + item + "</td>";
					});
					str2 += "</tr>";
				});
				sx2.innerHTML = str2;
				$("#inbox").css('display', 'block');
				$("#loader").css('display', 'none');
			}
	})
});
	function deldata() {
		alert("删除");
		}
	</script>
	<div class="bodywrapper">
		<%@ include file="top.jsp"%>
		<%@ include file="leftMenu.jsp"%>
		<%@ include file="basic.jsp"%>
		<div class="centercontent">
			<div class="pageheader">
				<h1 class="pagetitle">data</h1>
				<span class="pagedesc">数据信息</span>
				<ul class="hornav">
					<li class="current">基本信息</li>
					<a id="add" class="btn btn2 btn_book"><span>添加</span></a>
					<a id="delete" class="btn btn2 btn_book" onclick="return deldata()"><span>删除</span></a>
				</ul>
			</div>
			<!--pageheader-->
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
				<div id="inbox" class="subcontent">
					<table cellpadding="0" cellspacing="0" border="0"
						class="stdtable mailinbox">
						<thead id="wxh1">
						</thead>
						<tbody id="wxh2">
						</tbody>
					</table>
				</div>
				<div id="compose" class="subcontent" style="display: none">&nbsp;</div>
			</div>
			<!--contentwrapper-->
		</div>
		<!--centercontent-->
	</div>
	<!--bodywrapper-->
</body>
</html>