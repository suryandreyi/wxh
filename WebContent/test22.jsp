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
			var addr = address + "/visualCass/targetInsert_do?type=test2";
			$("#form").attr("action", addr);
		}
		function swtoinfo() {
			$("#showinfo").css('display', 'block');
			$("#showprocess").css('display', 'none');
			$("#pro").attr('class', '');
			$("#target").attr('class', 'current');
		}
		function swtoprocess() {
			$("#showinfo").css('display', 'none');
			$("#showprocess").css('display', 'block');
			$("#pro").attr('class', 'current');
			$("#target").attr('class', '');
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
							<h3>指标2</h3>
						</div>
						<!--contenttitle-->
						<form class="stdform" id="form" method="post">
							<p>
								<label>开启ipsec</label>
								<button class="submit radius2" id="sub" onclick="return check()">开启</button>
								<span class="field"> <select name="resultNum"
									class="uniformselect">
										<option selected="selected">183.250.164.68</option>
										<option>36.153.113.4</option>
										<option>159.226.41.232</option>
										<option>202.189.3.235</option>
								</select>
								</span>
							</p>
							<p>
								<label>任务名称</label> <span class="field"><input
									type="text" name="taskname" class="smallinput" /></span>
							</p>
							<p>
								<label>Keyspace</label> <span class="field"><input
									type="text" name="key" class="smallinput" /></span>
							</p>
							<p>
								<label>table</label> <span class="field"><input
									type="text" name="tab" class="smallinput" /></span>
							</p>
							<p>
								<label>查询文件路径</label> <span class="field"><input
									type="text" name="filepath" class="smallinput" /></span>
							</p>
							<p>
								<label>结果文件存储路径</label> <span class="field"><input
									type="text" name="resultpath" class="smallinput" /></span>
							</p>
							<p>
								<label>线程数</label> <span class="field"><input type="text"
									name="input1" class="smallinput" /></span>
							</p>
							<p>
								<label>插入条目数</label> <span class="field"><input
									type="text" name="input1" class="smallinput" /></span>
							</p>
							<p>
								<label>文件选择</label> <span class="field"><input
									type="file" name="input1" class="smallinput" /></span>
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
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="sub" onclick="return check()">查询</button>
								<input type="reset" class="reset radius2" value="Reset Button" />
							</p>
						</form>
					</div>
					<!--widgetbox-->
				</div>
				<!--one_half-->
				<div class="one_half last">
					<div class="widgetbox">
						<br /> <br />
						<div class="title">
							<h3>指标详情</h3>
						</div>
						<div class="widgetcontent">
							<div id="tabs">
								<ul class="hornav">
									<li id="target" class="current" onclick="return swtoinfo()"><a>指标内容</a></li>
									<li id="pro" onclick="return swtoprocess()"><a>测试流程</a></li>
								</ul>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>提供满足特定网络安全等级要求的底层透明数据传输能力。</h5>
									</blockquote>
								</div>
								<div id="showprocess" style="display: none">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>1.在客户端节点开启ipsec-vpn-Client，在系统数据节点开启ipsec-vpn-Server</h5>
										<h5>2.在系统插入数据集数据</h5>
										<h5>3.记录每100条数据插入成功后的时间</h5>
										<h5>4.进行多次测试</h5>
										<h5>5.关闭ipsec-vpn,重复以上测试</h5>
										<h5>6.比较开启和关闭ipsec后数据传输的速度变化</h5>
									</blockquote>
								</div>
							</div>
							<!--#tabs-->
						</div>
						<!--widgetcontent-->
					</div>
					<!--widgetbox-->
					<div class="widgetbox">
						<div class="title">
							<h3>测试结果</h3>
						</div>
						<div class="widgetcontent">
							<p>
								<label>选择任务</label>
								<button class="submit radius2" id="sub" onclick="return check()">查看日志</button>
								<span class="field"> <select name="resultNum"
									class="uniformselect">
										<option selected="selected"></option>
										<option></option>
										<option></option>
										<option></option>
								</select>
								</span>
							</p>
							<br />
						</div>
						<!--widgetcontent-->
					</div>
					<!--widgetbox-->
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