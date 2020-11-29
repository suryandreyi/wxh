<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>查询数据</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<script type="text/javascript">
	function check() {
		var cql = $("#cql").val();
		$.ajax({
			url : address + "/visualCass/showdata_do?type=search",
			dataType : "json",
			type : "post",
			data: {
				cql:cql
			},
			async : false,
			success : function(data) { //如果请求成功，返回数据。
				var sx1 = document.getElementById("wxh1");
				var sx2 = document.getElementById("wxh2");
				var str1 = "";
				var str2 = "";
				var data1 = data.columns;
				var data2 = data.rowdatas;
				str1 += "<tr class='unread'>";
				$.each(data1, function(i, item) {
					str1 += "<th>" + item + "</th>";
				})
				str1 += "</tr>";
				sx1.innerHTML = str1;
				$.each(data2,function(i, item) {
					str2 += "<tr class='unread'>";
					$.each(item, function(i, item) {
						str2 += "<td>" + item + "</td>";
					});
					str2 += "</tr>";
				});
				sx2.innerHTML = str2;
				$("#inbox").css('display', 'block');
				$("#loader").css('display', 'none');
			}
		});
	}	
	</script>
	<div class="bodywrapper">
		<%@ include file="top.jsp"%>
		<%@ include file="leftMenu.jsp"%>
		<%@ include file="basic.jsp"%>
		<div class="centercontent">
			<div id="contentwrapper" class="contentwrapper widgetpage">
				<div class="one_half">
					<div class="widgetbox">
						<div class="contenttitle2">
							<h3>查询</h3>
						</div>
						<!--contenttitle-->
						<form id="form1" class="stdform" onsubmit="return false" action="##" method="post">
							<p>
								<label>查询语句</label> <span class="field"><input
									type="text" name="cql" id="cql" class="smallinput" /></span>
							</p>
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="sub" onclick="return check()">查询</button>
								<input type="reset" class="reset radius2" value="重置" />
							</p>
						</form>
					</div>
					<!--widgetbox-->
				</div>
				<!--one_half-->
				<div class="one_half last">
					<div id="inbox" class="subcontent">
					<table cellpadding="0" cellspacing="0" border="0"
						class="stdtable mailinbox" style="word-break:break-all; word-wrap:break-all;">
						<thead id="wxh1">
						</thead>
						<tbody id="wxh2">
						</tbody>
					</table>
					</div>
				</div>
				<!--one_half last-->
			</div>
			<!--contentwrapper-->
			<!--centercontent-->
		</div>
		<!--bodywrapper-->
	</div>
</body>
</html>