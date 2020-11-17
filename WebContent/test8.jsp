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
<style>
.tab-menu {
	margin-top: 20px;
	height: 26px;
	overflow: hidden;
	position: relative;
	border-radius: 20px;
}

.lala {
	padding: 0;
	margin: 0;
	list-style: none;
}

.lala li {
	height: 24px;
	line-height: 24px;
	float: left;
	text-align: center;
	position: relative;
	font-size: 12px;
}

.tab-menu span {
	margin: 4px;
	display: inline-block;
	height: 18px;
	position: absolute;
	left: 0;
	top: 0;
	border-radius: 20px;
	transition: left .4s;
	-webkit-transition: left .4s;
	-moz-transition: left .4s;
}

.lala li:hover {
	cursor: pointer;
}

.tworow {
	width: 400px;
	background-color: rgba(224, 229, 232, 1);
}


.tworow .active {
	color: white;
}

.tworow li {
	width: 80px;
	color: rgba(0, 54, 80, 1);
}

</style>
</head>
<body class="withvernav">
	<script type="text/javascript">
		//setInterval(wachlog, 3000);
	
		$(function() {
			$("#hourlist").find("li").click(function() {
				$("#hourlist li").each(function(){
					$(this).attr('class', '');
					$(this).css('background-color', '');
				})
				
				$(this).attr('class', 'active');
				$(this).css('background-color', 'rgba(0, 54, 80, 1)');
			})
		});

		function check() {
			var sx1 = document.getElementById("wxh");
			var str1 = sx1.innerHTML;
			str1 += "<h3> 开始测试 </h3>";
			sx1.innerHTML = str1;
			
			var sx = $(".active").text();
			
			var addr = address + "/visualCass/targetInsert_do?type=test8&block="+sx;
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
					str1 = sx1.innerHTML;
					str1 += "<h3> 测试完成</h3>";
					sx1.innerHTML = str1;
				}
			});
		}
		
		function wachlog() {
			var addr = address + "/visualCass/result_do?type=test8";
			var taskName = $("#tn").val();	
			$.ajax({
				url : addr,
				dataType : "json",
				type : "post",
				data : {"taskName":taskName},
				async : false,
				success : function(data) { //如果请求成功，返回数据。
					var sx = document.getElementById("wxh");
					var str = sx.innerHTML+"<h3> 结果统计:</h3>";
					$.each(data.num, function(i, item) {
						str += "<h3>条目数:"+item+"条       大小:"+data.sz[i]+"kb</h3>";
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
							<h3>指标8</h3>
						</div>
						<!--contenttitle-->
						<h2>分片粒度选择</h2>
						<div class="tab-menu tworow">
							<span id="thirdbg"></span>
							<ul id="hourlist" class="lala">
								<li type="1">1M</li>
								<li type="2">2M</li>
								<li type="3">5M</li>
								<li type="4">10M</li>
								<li type="5">20M</li>
							</ul>
						</div>	
						<hr/>
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
								<label>文件路径</label> <span class="field"><input
									type="text" name="filepath" class="smallinput" /></span>
							</p>
							<p>
								<label>结果路径</label> <span class="field"><input
									type="text" name="resultpath" class="smallinput" /></span>
							</p>
												<p>
								<label>线程数</label> <span class="field"><input type="text"
									name="input1" class="smallinput" /></span>
							</p>
							<p>
								<label>索引范围</label> <span class="field"> <select
									name="consistent" class="uniformselect">
										<option selected="selected" name="a">全局索引</option>
										<option name="o">单机索引</option>
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
															<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="target" class="current"><a>指标内容</a></li>
									</ul>
									<div id="showinfo" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
											<h3>支持情报产品分片粒度多级可控。</h3>
										</blockquote>
									</div>
								</div>


								<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="pro" class="current"><a>测试流程</a></li>
									</ul>
									<div id="showprocess" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
										<h3>1.设置分片大小为1M</h3>
										<h3>2.在系统插入5M大小的数据</h3>
										<h3>3.从文件中读取需要传输的数据，根据指定的分片大小将其切割</h3>
										<h3>4.为每个分片分配分片id，并将其记录在分片表中</h3>
										<h3>5.从系统中读取数据时，根据Partition Key到分片表中找到对应的分片id</h3>
										<h3>6.根据分片id从系统中获得对应的分片数据，查看每个分片数据的大小，并对其拼接</h3>
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
								<button class="submit radius2" id="sub" onclick="return wachlog()">查看日志</button>
								<span class="field"> <select name="resultName" id="rn"
									class="uniformselect">
										<option selected="selected">Task1</option>
										<option>Task2</option>
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