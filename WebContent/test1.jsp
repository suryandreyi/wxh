<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>指标1</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<script type="text/javascript">
		function check() {
			var sx1 = document.getElementById("wxh");
			var str1 = sx1.innerHTML;
			str1 += "<h3> 开始测试 </h3>";
			sx1.innerHTML = str1;

			var addr = address + "/visualCass/targetInsert_do?type=test1";
			var taskName = $("#tn").val();
			var xh = document.getElementById("rn");
			var str = "<option>" + taskName + "</option>"
			xh.innerHTML = str;
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : addr,//url
				data : $('#form1').serialize(),
				success : function(result) {
					if (result.resultCode == 200) {
						var sx = document.getElementById("wxh");
						var str = sx.innerHTML;
						str = str + "<h3>测试完成</h3>";
						sx.innerHTML = str;
					}
					;
				},
				error : function() {
					alert("完成！");
				}
			});
		}
		function wachlog() {
			var addr = address + "/visualCass/result_do?type=test1";
			var taskName = $("#tn").val();
			$.ajax({
				url : addr,
				dataType : "json",
				type : "post",
				data : {
					"taskName" : taskName
				},
				async : false,
				success : function(data) { //如果请求成功，返回数据。
					var sx = document.getElementById("wxh");
					var str = sx.innerHTML + "<h3> 记录时间:";
					$.each(data, function(i, item) {
						str += "<h3>" + item + "ms";
					})
					sx.innerHTML = str;
				}
			})
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
							<h3>指标1</h3>
						</div>
						<!--contenttitle-->
						<form id="form1" class="stdform" onsubmit="return false"
							action="##" method="post">
							<p>
								<label>数据库名</label> <span class="field"><input
									type="text" name="key" class="smallinput" /></span>
							</p>
							<p>
								<label>表名</label> <span class="field"><input type="text"
									name="tab" class="smallinput" /></span>
							</p>
							<p>
								<label>任务名</label> <span class="field"><input type="text"
									name="taskname" class="smallinput" id="tn" /></span>
							</p>
							<p>
								<label>数据集路径</label> <span class="field"><input
									type="text" name="filepath" class="smallinput" /></span>
							</p>
							<p>
								<label>结果路径</label> <span class="field"><input
									type="text" name="resultpath" class="smallinput" /></span>
							</p>
							<p>
								<label>插入条目数</label> <span class="field"><input
									type="text" name="insertSumnum" class="smallinput" /></span>
							</p>
							<p>
								<label>一致性级别</label> <span class="field"> <select
									name="input3" class="uniformselect">
										<option selected="selected">强一致性</option>
										<option>本地一致性</option>
								</select>
								</span>
							</p>
							<p>
								<label>结果统计</label> <span class="field"> <select
									name="resultNum" class="uniformselect">
										<option selected="selected">/100条</option>
										<option>/20条</option>
										<option>/500条</option>
								</select>
								</span>
							</p>
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="sub" onclick="return check()">插入</button>
								<input type="reset" class="reset radius2" value="重置" />
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
							<div id="tabs" style="display: inline-block">
								<ul class="hornav">
									<li id="target" class="current"><a>指标内容</a></li>
								</ul>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h3>用例2：为多阵地跨地域部署的信息节点提供全局一致的、高可靠的数据视图</h3>
										<h3>用例3：数据一致时延小于10秒。</h3>
									</blockquote>
								</div>
							</div>


							<div id="tabs" style="display: inline-block">
								<ul class="hornav">
									<li id="pro" class="current"><a>测试流程</a></li>
								</ul>
								<div id="showprocess" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h3>用例2测试流程：</h3>
										<h3>1.在系统中创建一个新表；</h3>
										<h3>2.选择数据库，数据表，任务名，选取条目数为5000的样本数据集，点击插入按钮；</h3>
										<h3>3.在样本数据集中，选择任意数据；</h3>
										<h3>4.根据该数据，在不同节点上进行查询。</h3>
										</br>
										<h3>用例3测试流程：</h3>
										<h3>1.选择数据库，数据表，任务名，选择条目数为5000的样本数据，选择结果统计为/100条，点击插入按钮；</h3>
										<h3>2.查看后台日志；</h3>
										<h3>3.点击查看结果按钮，查看测试结果。</h3>
									</blockquote>
								</div>
							</div>
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
								<button class="submit radius2" id="sub"
									onclick="return wachlog()">查看日志</button>
								<span class="field"> <select name="resultName" id="rn"
									class="uniformselect">
								</select>
								</span>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0" id="wxh">
									</blockquote>
								</div>
							</p>
							<br />
						</div>
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