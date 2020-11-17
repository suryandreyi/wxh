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
	<script type="text/javascript">
		function check() {
			var addr = address+"/visualCass/targetInsert_do";
			$("#form").attr("action", addr);
		}
	</script>
	<div class="bodywrapper">
		<%@ include file="top.jsp"%>
		<%@ include file="leftMenu.jsp"%>
		<%@ include file="basic.jsp"%>
		<div class="centercontent">
			<div id="contentwrapper" class="contentwrapper">
				<div id="basicform" class="subcontent">
					<div class="contenttitle2">
						<h3>插入指标</h3>
					</div>
					<!--contenttitle-->
					<form class="stdform" id="form" method="post">
						<p>
							<label>Keyspace</label> <span class="field"><input
								type="text" name="key" class="smallinput" /></span>
						</p>
						<p>
							<label>table</label> <span class="field"><input
								type="text" name="tab" class="smallinput" /></span>
						</p>
						<p>
							<label>文件路径</label> <span class="field"><input type="text"
								name="filepath" class="smallinput" /></span>
						</p>
						<p>
							<label>结果路径</label> <span class="field"><input type="text"
								name="resultpath" class="smallinput" /></span>
						</p>
						<p>
							<label>线程数</label> <span class="field"><input type="text"
								name="input1" class="smallinput" /></span>
						</p>
						<p>
							<label>插入条目数</label> <span class="field"><input
								type="text" name="insertSumnum" class="smallinput" /></span>
						</p>
						<p>
							<label>文件选择</label> <span class="field"><input type="file"
								name="input1" class="smallinput" /></span>
						</p>
						<p>
							<label>索引范围</label> <span class="field"> <select
								name="input3" class="uniformselect">
									<option selected="selected">全局索引</option>
									<option>单机索引</option>
							</select>
							</span>
						</p>
						<p>
							<label>结果统计</label> <span class="field"> <select
								name="resultNum" class="uniformselect">
									<option selected="selected">/100条</option>
									<option>/5条</option>
									<option>/10条</option>
									<option>/1000条</option>
									<option>/10000条</option>
							</select>

							</span>
						</p>
						<br clear="all" />
						<br />
						<p class="stdformbutton">
							<button class="submit radius2" id="sub" onclick="return check()">查询</button>
							<input type="reset" class="reset radius2" value="Reset Button" />
						</p>
					</form>
					<p>
						<label>结果</label> <span class="field"><input type="text"
							name="input2" class="biginput" /></span>
					</p>
					<br />
					<p>
				</div>
				<!--contentwrapper-->
			</div>
			<!--centercontent-->
		</div>
		<!--bodywrapper-->
	</div>
</body>
</html>