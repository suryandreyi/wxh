<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>日志信息</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<div class="bodywrapper">
		<%@ include file="top.jsp" %>
        <%@ include file="leftMenu.jsp" %>

		<div class="centercontent">
			<div class="pageheader">
				<h1 class="pagetitle">运维日志信息</h1>
			</div>
			<!--pageheader-->

			<div id="contentwrapper" class="contentwrapper">
				<div id="inbox" class="subcontent">
					<table cellpadding="0" cellspacing="0" border="0"
						class="stdtable mailinbox">
						<thead>
							<tr>
								<th class="head0">日志名称</th>
							</tr>
						</thead>
						<tbody id="wxh">
							<tr class='unread'>
								<td><a
									href="http://47.103.222.181:10000/visualCass/watchlog_do?logname=debug"
									class="title">debug.log</a></td>
							</tr>
							<tr class='unread'>
								<td><a
									href="http://47.103.222.181:10000/visualCass/watchlog_do?logname=system"
									class="title">system.log</a></td>
							</tr>
							<tr class='unread'>
								<td><a
									href="http://47.103.222.181:10000/visualCass/watchlog_do?logname=gc.log.0.current"
									class="title">gc.log.0.current.log</a></td>
							</tr>
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